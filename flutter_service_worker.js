'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "3664119b232335cd044f6fa2e8964284",
"version.json": "4d6afc11319f18855ec2c2f19563a194",
"index.html": "3e2a06316a9c83d3dd9889e5d95c93f8",
"/": "3e2a06316a9c83d3dd9889e5d95c93f8",
"favicon.jpeg": "aeb2a95044930cd2417bf9cd26cb5f2e",
"main.dart.js": "fe642b6f6a5b7fae5dc251b81b214ecb",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "280f273b29ce9f3cf2c2e4fbdf25c9a6",
".git/config": "2b4089fd7cd1eb931d9edd446845ec7d",
".git/objects/0d/5b4a50ac82b8af898ab1341f40cdb757c7b1db": "969f4935c70c49784656a7525df2fce1",
".git/objects/57/7946daf6467a3f0a883583abfb8f1e57c86b54": "846aff8094feabe0db132052fd10f62a",
".git/objects/03/2fe904174b32b7135766696dd37e9a95c1b4fd": "80ba3eb567ab1b2327a13096a62dd17e",
".git/objects/04/f20cb73de56ce012af0de3c55996d5fb9b2148": "9ba750d44489634379f08cbe9e333a55",
".git/objects/35/96d08a5b8c249a9ff1eb36682aee2a23e61bac": "e931dda039902c600d4ba7d954ff090f",
".git/objects/69/85cf0e6709f0aac91f87f13c0a44b6fe60696e": "5b8bfeb5a5491cc556008308d74d5a1a",
".git/objects/5f/bf1f5ee49ba64ffa8e24e19c0231e22add1631": "f19d414bb2afb15ab9eb762fd11311d6",
".git/objects/d9/3952e90f26e65356f31c60fc394efb26313167": "1401847c6f090e48e83740a00be1c303",
".git/objects/d7/7cfefdbe249b8bf90ce8244ed8fc1732fe8f73": "9c0876641083076714600718b0dab097",
".git/objects/d7/d084457a97f421cf733649f152cf9117d091c9": "e25496264c00445c89cba71ba25b3491",
".git/objects/d0/efa0a30566b41765faeb50696c3692e00d996f": "89886f96b14901db22242d19ddd69ad9",
".git/objects/da/6490c4697835bb273d3134e21022be17632bdc": "ea9a4081f4007c96e7ea45aa596f1038",
".git/objects/da/fa2ee55c968b5275a0acffc1aa177394b9174d": "73d7292c9b23bc2c6cee3d21e6ba5ebd",
".git/objects/a5/de584f4d25ef8aace1c5a0c190c3b31639895b": "9fbbb0db1824af504c56e5d959e1cdff",
".git/objects/bd/6be43d015a2a8a92db341ee519feb383a20cb4": "0df4c80430aff6e9b0cdd970bc215545",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/f3/709a83aedf1f03d6e04459831b12355a9b9ef1": "538d2edfa707ca92ed0b867d6c3903d1",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ee/124414e5717541fd7938d5d13e4a8c84fb97e6": "f0e642f3245aa65eaf549166ea81b8f4",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f2/b7560af0948756f767da26f8c43df84d7e9a1c": "496443b560f9f55486c0873d604bcbcf",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/fe/d17129e1b1f112a8d42dc3e68fe9b9f06f070e": "92ac7808ac09136dc9584b6172dec9b0",
".git/objects/20/91f4f7333708bb452d836f6c5b969e470f164e": "a6e919ac7ed6770bbe7f588abdbeabcc",
".git/objects/11/7f73e3814206ff64e53f30c7f6d368cc667070": "da666dbe62c79eaa2181c79bd9978a80",
".git/objects/11/07ce327fc584a3e25b7f43083613a740ac9d28": "429d438396c7eaba395cb65ba351b426",
".git/objects/16/a751b214fcb70d7c62615784b6b368f6357ad0": "6bcfe7694eb8054fef83520dfac4bd5e",
".git/objects/45/0400b57967394bc30f396969cc5aba5de9f69d": "d75b6aa96bacdc3e3bcd446854151676",
".git/objects/8f/6859f0439c45289e7d4c60bea30de02ec5bc9f": "40d066114de20989275aed2b0ab2bc9b",
".git/objects/8a/51a9b155d31c44b148d7e287fc2872e0cafd42": "9f785032380d7569e69b3d17172f64e8",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/26/fc29057cb1dedacf32fd8463f8f2befd54ec72": "4079f3f4887fa1d259677c63593e62db",
".git/objects/72/801054a6149431263fff2641078bb3ba2fb96c": "882e485f050b9b722de5519974ac881a",
".git/objects/44/2d292b94c1415f8beec0f9dfa87f3d4e0e4b8b": "a5ec4b0f33cbadc6278fc515a8be8d5f",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/38/7e260e470c1415084f8b993c7dae2867c6d395": "e2889a2c03f571534dee300ebe999a8a",
".git/objects/91/4a40ccb508c126fa995820d01ea15c69bb95f7": "8963a99a625c47f6cd41ba314ebd2488",
".git/objects/65/03b32b5ecf9da91a0f9e450a9f133d5651af71": "c06cdb73dd9d964be0d61d299321af4e",
".git/objects/3f/1e447bde71db132dc4aa1c493006211bead423": "8ca7bbfc673806a0f695d3accf62d6bc",
".git/objects/6d/40135524680e1b193a6e405278ef4bda943c6e": "de7f8e0bf9374a74c4763fbac2ee6592",
".git/objects/06/ea0fa87d743ac7dec66cd76077086c94c12e23": "21a48a1c00edcdb00a15773768666c62",
".git/objects/39/9469024ce3c7725a2678ea8f6fd4b6eefe5b33": "18e92d05f5211eebb9049d114ec12e91",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/dc/f83695f71da8c6278eb914cdd42692c427924e": "9ca7f32e12839dea4610032ada023058",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/a8/5fdde359629364cb2506f1b1bdd5e7bd22886d": "b15d8e6f4f0755b58d1cb09ddd390591",
".git/objects/a8/8c9340e408fca6e68e2d6cd8363dccc2bd8642": "11e9d76ebfeb0c92c8dff256819c0796",
".git/objects/b0/622379473ded55ead4aa9572b97c64d632faa6": "a7c32fbfa83a0ce71f28657ab3b79a62",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/ef/b875788e4094f6091d9caa43e35c77640aaf21": "27e32738aea45acd66b98d36fc9fc9e0",
".git/objects/c3/fe5b34523ea5565e28f3ec0a1673e77ab3198b": "6dc0bec4b543a4a54bc031bb83390461",
".git/objects/c3/182631c722457eff02e566e1040b2748d55670": "56cabcc0b17d8ae88cc35599611ee984",
".git/objects/e1/87c110b30fc37b0ce19daa089e95f141e8402c": "f102b815714f86075a06adae80909e69",
".git/objects/cd/5a004c194c19bd1332d9eae0dae39fbee93657": "ccad0676f8364abd67ca1e45d8046adb",
".git/objects/cc/fc9a97cd261807193c537769ecdd549b353415": "b7ffb470d0b14835533df8fd96ce3570",
".git/objects/e6/6849ef91357a18cdc48d49fd2cd5516329c744": "f74f2b682403b586d9fb46f99114707e",
".git/objects/f6/bc64d0520f1e1c3ab8ba690b587a17b3f42d74": "664257f15a38534a91bffb4557ea9c82",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/1b/78b7e3342fd0bc8bd409d346d409bd96524c92": "ccdee749073b81509b46b66adc6b60a8",
".git/objects/70/35c090f24b67bf59cbfb3947d89e942964924a": "7c3140e0c4bfd283678b98038150c01e",
".git/objects/4f/02e9875cb698379e68a23ba5d25625e0e2e4bc": "254bc336602c9480c293f5f1c64bb4c7",
".git/objects/15/8d053a5d099e73d96afead82a9a19b93eb8e41": "31c6dfa2b2146b9c561cc6f5f45d6b4f",
".git/objects/40/1184f2840fcfb39ffde5f2f82fe5957c37d6fa": "1ea653b99fd29cd15fcc068857a1dbb2",
".git/objects/47/7e27def711837606849fab563cfbdb195384bf": "4d307c0433b932dbb2558df97fe0fbc4",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "6aba8bdd485f198bbd789efa71c203d0",
".git/logs/refs/heads/main": "7f2d82724d2432ceec76ac66ef82b306",
".git/logs/refs/remotes/origin/main": "1ef099d4c50be49433086d74619710b0",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/main": "6209e4d85c1d7182db18029852397c3b",
".git/refs/remotes/origin/main": "6209e4d85c1d7182db18029852397c3b",
".git/index": "b9f43bce792c02f63c2296bba93ec30f",
".git/COMMIT_EDITMSG": "6825a43c6a7e37ec7ab60185d0d2f823",
"assets/AssetManifest.json": "6842abdd292a8f80aa9d016f9c3f3a06",
"assets/NOTICES": "e187d44e527aa9243e8545983d3d232b",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "a86cd9d10094d783032f893dbcf520c1",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "75397044e7e5f99df42064cdb31f6fc0",
"assets/fonts/MaterialIcons-Regular.otf": "77ddbfc139caf6dd3c2a125d6cd290cc",
"assets/assets/hole18.png": "807606106fba821b06e3acd5d588214d",
"assets/assets/hole9.png": "9cb8d188866f77b25f89c1b97faa0cd9",
"assets/assets/hole8.png": "f1ae01040914bef0efed541a2627b022",
"assets/assets/score_card.png": "a7e662bfb56e2dbfe01da15ab6bc1472",
"assets/assets/hole1.png": "1ace0dd347c45829ae446697cb9d0033",
"assets/assets/hole3.png": "23c2a337d2c7265fdfb15ec40ea2525a",
"assets/assets/hole2.png": "ac32879f4ea6df1abe3f03b8bbf317a4",
"assets/assets/hole6.png": "f0d0563d494185e6062f5c7ad54d26c7",
"assets/assets/hole7.png": "b13d2c041243a20449b3a8b7a0db8fdc",
"assets/assets/hole5.png": "192538b9910371be5e0dc4bcf07c8843",
"assets/assets/hole4.png": "30794d42fa9c320290ad6f204b2bab03",
"assets/assets/hole17.png": "38fac8bfeaab0446b196102a2fec9021",
"assets/assets/hole16.png": "9f574578e1a7d8d9f5346b41482d7395",
"assets/assets/logo.jpeg": "aeb2a95044930cd2417bf9cd26cb5f2e",
"assets/assets/hole14.png": "b66281dda6b68770d6eea3d8c42ae40a",
"assets/assets/hole15.png": "e5e478489265c1fd1f607099881398e2",
"assets/assets/hole11.png": "a715aaa2c7bd714574630e1c54a3366b",
"assets/assets/transparent.png": "9b7fe36bf2e2db62e8a5a44b16491e84",
"assets/assets/hole10.png": "70437239e01c68ddf35769a0815615be",
"assets/assets/hole12.png": "75ec12ac6326eca8fb89c75ea310ccb6",
"assets/assets/hole13.png": "2c003f76cd4d5486fa59389be896c010",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
