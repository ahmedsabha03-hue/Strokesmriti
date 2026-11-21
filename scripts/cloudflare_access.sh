#!/usr/bin/env bash
# Creates or updates two Cloudflare Access applications:
#  1. the whole site: only listed examiner emails, one-time email code, 30-day session
#  2. /privacy.html: public (required by Google Play)
# Also protects the *.pages.dev address so the login cannot be bypassed.
set -euo pipefail
API="https://api.cloudflare.com/client/v4/accounts/$CF_ACCOUNT/access/apps"
AUTH=(-H "Authorization: Bearer $CF_TOKEN" -H "Content-Type: application/json")
include=$(echo "$EMAILS" | tr ',' '\n' | sed 's/^ *//;s/ *$//' | grep -v '^$' | jq -R '{email:{email:.}}' | jq -s .)
n=$(echo "$include" | jq length); echo "Examiner emails: $n"
[ "$n" -gt 0 ] || { echo "EXAMINER_EMAILS is empty"; exit 1; }
existing=$(curl -s "${AUTH[@]}" "$API?per_page=100")
echo "$existing" | jq -e '.success' >/dev/null || { echo "$existing" | jq -c .errors; echo "Open Zero Trust once in the Cloudflare dashboard (choose a team name and the Free plan), then re-run."; exit 1; }
upsert () { # name domain body
  id=$(echo "$existing" | jq -r --arg n "$1" '.result[]|select(.name==$n)|.id' | head -1)
  if [ -n "$id" ]; then r=$(curl -s -X PUT "${AUTH[@]}" "$API/$id" --data "$3"); else r=$(curl -s -X POST "${AUTH[@]}" "$API" --data "$3"); fi
  echo "$1: $(echo "$r" | jq -c '{success,errors}')"; echo "$r" | jq -e '.success' >/dev/null
}
app () { jq -n --arg name "$1" --arg dom "$2" --arg dec "$3" --argjson inc "$4" \
  '{name:$name,domain:$dom,type:"self_hosted",session_duration:"720h",app_launcher_visible:false,
    policies:[{name:($name+" policy"),decision:$dec,include:$inc,precedence:1}]}'; }
everyone='[{"everyone":{}}]'
upsert "StrokeSmriti privacy page" "$DOMAIN/privacy.html" "$(app 'StrokeSmriti privacy page' "$DOMAIN/privacy.html" bypass "$everyone")"
upsert "StrokeSmriti" "$DOMAIN" "$(app 'StrokeSmriti' "$DOMAIN" allow "$include")"
upsert "StrokeSmriti pages.dev" "strokesmriti.pages.dev" "$(app 'StrokeSmriti pages.dev' 'strokesmriti.pages.dev' allow "$include")"
