/* Offline cache for StrokeSmriti. VERSION changes on every release so devices fetch the new files. */
const VERSION = "psc-0.7.6";
const FILES = [
  "./",
  "./index.html",
  "./fonts.css",
  "./manifest.webmanifest",
  "./vendor/qrcode.js",
  "./icons/icon-192-maskable.png",
  "./icons/icon-192.png",
  "./icons/icon-512-maskable.png",
  "./icons/icon-512.png",
  "./fonts/noto-sans-bengali-bengali-400-normal.woff2",
  "./fonts/noto-sans-bengali-bengali-600-normal.woff2",
  "./fonts/noto-sans-devanagari-devanagari-400-normal.woff2",
  "./fonts/noto-sans-devanagari-devanagari-600-normal.woff2",
  "./fonts/noto-sans-kannada-kannada-400-normal.woff2",
  "./fonts/noto-sans-kannada-kannada-600-normal.woff2",
  "./fonts/noto-sans-latin-400-normal.woff2",
  "./fonts/noto-sans-latin-600-normal.woff2",
  "./fonts/noto-sans-malayalam-malayalam-400-normal.woff2",
  "./fonts/noto-sans-malayalam-malayalam-600-normal.woff2",
  "./fonts/noto-sans-oriya-oriya-400-normal.woff2",
  "./fonts/noto-sans-oriya-oriya-600-normal.woff2",
  "./fonts/noto-sans-tamil-tamil-400-normal.woff2",
  "./fonts/noto-sans-tamil-tamil-600-normal.woff2",
  "./fonts/noto-sans-telugu-telugu-400-normal.woff2",
  "./fonts/noto-sans-telugu-telugu-600-normal.woff2"
];
self.addEventListener("install", e => { e.waitUntil(caches.open(VERSION).then(c => c.addAll(FILES)).then(() => self.skipWaiting())); });
self.addEventListener("activate", e => { e.waitUntil(caches.keys().then(ks => Promise.all(ks.filter(k => k !== VERSION).map(k => caches.delete(k)))).then(() => self.clients.claim())); });
self.addEventListener("fetch", e => {
  if (e.request.method !== "GET") return;
  e.respondWith(caches.match(e.request, { ignoreSearch: true }).then(r => r || fetch(e.request).then(res => {
    const copy = res.clone(); caches.open(VERSION).then(c => c.put(e.request, copy)); return res;
  }).catch(() => e.request.mode === "navigate" ? caches.match("./index.html") : Response.error())));
});
