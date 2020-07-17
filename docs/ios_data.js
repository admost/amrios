function getIosNetworks() {
  return JSON.parse(`
  {"ad_networks":
  [{"name":"AMR","status":true,"pod":"AMRSDK","version":"1.4", "minTargetSdk":"8.0"},
  {"name":"AdColony","status":false,"pod":"AMRAdapterAdcolony","version":"4.2", "minTargetSdk":"9.0"},
  {"name":"A4G","status":false,"pod":"AMRAdapterAdmob","version":"7.62", "minTargetSdk":"9.0"},
  {"name":"AdMob","status":false,"pod":"AMRAdapterAdmob","version":"7.62", "minTargetSdk":"9.0"},
  {"name":"Admost","status":false,"pod":"AMRAdapterAdmost","version":"1.3", "minTargetSdk":"8.0"},
  {"name":"Adtiming","status":false,"pod":"AMRAdapterAdtiming","version":"4.3", "minTargetSdk":"9.0"},
  {"name":"Amazon","status":false,"pod":"AMRAdapterAmazon","version":"3.1", "minTargetSdk":"9.0"},
  {"name":"AppLovin","status":false,"pod":"AMRAdapterApplovin","version":"6.13", "minTargetSdk":"9.0"},
  {"name":"Appnext","status":false,"pod":"AMRAdapterAppnext","version":"1.9", "minTargetSdk":"8.0"},
  {"name":"Appsamurai","status":false,"pod":"AMRAdapterAppsamurai","version":"1.4", "minTargetSdk":"8.0"},
  {"name":"Chartboost","status":false,"pod":"AMRAdapterChartboost","version":"8.2", "minTargetSdk":"8.0"},
  {"name":"Criteo","status":false,"pod":"AMRAdapterCriteo","version":"3.7", "minTargetSdk":"8.0"},
  {"name":"DFP","status":false,"pod":"AMRAdapterDFP","version":"7.62", "minTargetSdk":"8.0"},
  {"name":"Facebook","status":false,"pod":"AMRAdapterFacebook","version":"5.9", "minTargetSdk":"9.0"},
  {"name":"Fyber","status":false,"pod":"AMRAdapterFyber","version":"9.1", "minTargetSdk":"8.0"},
  {"name":"HyprMx","status":false,"pod":"AMRAdapterHyprmx","version":"5.3", "minTargetSdk":"8.0"},
  {"name":"InMobi","status":false,"pod":"AMRAdapterInmobi","version":"9.0", "minTargetSdk":"9.0"},
  {"name":"Inneractive","status":false,"pod":"AMRAdapterInneractive","version":"7.6", "minTargetSdk":"8.0"},
  {"name":"IronSource","status":false,"pod":"AMRAdapterIronsource","version":"6.17", "minTargetSdk":"8.0"},
  {"name":"Mintegral","status":false,"pod":"AMRAdapterMintegral","version":"6.3", "minTargetSdk":"8.0"},
  {"name":"Mobfox","status":false,"pod":"AMRAdapterMobfox","version":"4.2", "minTargetSdk":"9.0"},
  {"name":"Mopub","status":false,"pod":"AMRAdapterMopub","version":"5.12", "minTargetSdk":"9.0"},
  {"name":"MyTarget","status":false,"pod":"AMRAdapterMytarget","version":"5.7", "minTargetSdk":"9.0"},
  {"name":"Nexage(AOL)","status":false,"pod":"AMRAdapterNexage","version":"6.8", "minTargetSdk":"8.0"},
  {"name":"Ogury","status":false,"pod":"AMRAdapterOgury","version":"1.4", "minTargetSdk":"10.0"},
  {"name":"Qumpara","status":false,"pod":"AMRAdapterQumpara","version":"1.1", "minTargetSdk":"9.0"},
  {"name":"Pollfish","status":false,"pod":"AMRAdapterPollfish","version":"5.0", "minTargetSdk":"8.0"},
  {"name":"Smaato","status":false,"pod":"AMRAdapterSmaato","version":"21.1", "minTargetSdk":"9.0"},
  {"name":"StartApp","status":false,"pod":"AMRAdapterStartapp","version":"4.5", "minTargetSdk":"8.0"},
  {"name":"Tapjoy","status":false,"pod":"AMRAdapterTapjoy","version":"12.6", "minTargetSdk":"8.0"},
  {"name":"TapResearch","status":false,"pod":"AMRAdapterTapresearch","version":"2.0", "minTargetSdk":"8.0"},
  {"name":"TikTok","status":false,"pod":"AMRAdapterTiktok","version":"3.1", "minTargetSdk":"9.0"},
  {"name":"UnityAds","status":false,"pod":"AMRAdapterUnity","version":"3.4", "minTargetSdk":"9.0"},
  {"name":"Vungle","status":false,"pod":"AMRAdapterVungle","version":"6.7", "minTargetSdk":"9.0"},
  {"name":"YandexAds","status":false,"pod":"AMRAdapterYandex","version":"2.16", "minTargetSdk":"8.0"},
  {"name":"YouAppi","status":false,"pod":"AMRAdapterYouappi","version":"5.0", "minTargetSdk":"9.0"}]}`);
}
