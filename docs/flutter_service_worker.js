'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "4e7f985b9121c853422fbf8947fd5962",
"assets/assets/fastgood.jpg": "2e8cf9a1dc4543f4b3826ce231cfdbae",
"assets/assets/paul.jpg": "2a9ac3e6bb48234d9cac90b410f99bd2",
"assets/assets/sissy.jpg": "93f7e6ea8c3b8272bd903e9aa9499c5a",
"assets/assets/tibo.jpg": "7c3746d31cba6e767dd39bf714e935df",
"assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/LICENSE": "df5f1c5202cc0cffcb6d8e560c180595",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "70f4b0dc217479eeab3174a29c5eb91d",
"/": "70f4b0dc217479eeab3174a29c5eb91d",
"main.dart.js": "f7b645a063bfb3830fc32ae3528d894d",
"manifest.json": "1ee08bb2d562b62bf02b4066fc438880"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
