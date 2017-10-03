var obj = JSON.parse('{"ad_networks":[{"name":"AMR","status":true,"pod":"AMRSDK","version":"1.3"},{"name":"Adcolony","status":false,"pod":"AMRAdapterAdcolony","version":"3.2"},{"name":"Admob & AdX","status":false,"pod":"AMRAdapterAdmob","version":"7.24"},{"name":"Admost","status":false,"pod":"AMRAdapterAdmost","version":"1.0"},{"name":"Amazon","status":false,"pod":"AMRAdapterAmazon","version":"2.2"},{"name":"Applovin","status":false,"pod":"AMRAdapterApplovin","version":"4.3"},{"name":"Appnext","status":false,"pod":"AMRAdapterAppnext","version":"1.8"},{"name":"Avocarrot","status":false,"pod":"AMRAdapterAvocarrot","version":"4.5"},{"name":"Chartboost","status":false,"pod":"AMRAdapterChartboost","version":"6.6"},{"name":"Facebook","status":false,"pod":"AMRAdapterFacebook","version":"4.25"},{"name":"Flurry","status":false,"pod":"AMRAdapterFlurry","version":"8.1"},{"name":"Fyber","status":false,"pod":"AMRAdapterFyber","version":"8.15"},{"name":"InLoco","status":false,"pod":"AMRAdapterInloco","version":"2.2"},{"name":"InMobi","status":false,"pod":"AMRAdapterInmobi","version":"6.2"},{"name":"Ironsource","status":false,"pod":"AMRAdapterIronsource","version":"6.6"},{"name":"Leadbolt","status":false,"pod":"AMRAdapterLeadbolt","version":"8.0"},{"name":"Loopme","status":false,"pod":"AMRAdapterLoopme","version":"6.3"},{"name":"Mobfox","status":false,"pod":"AMRAdapterMobfox","version":"3.1"},{"name":"Mobusi","status":false,"pod":"AMRAdapterMobusi","version":"2.3"},{"name":"Mopub","status":false,"pod":"AMRAdapterMopub","version":"4.13"},{"name":"Nativex","status":false,"pod":"AMRAdapterNativex","version":"5.5"},{"name":"Nexage","status":false,"pod":"AMRAdapterNexage","version":"6.4"},{"name":"Pubnative","status":false,"pod":"AMRAdapterPubnative","version":"1.4"},{"name":"Revmob","status":false,"pod":"AMRAdapterRevmob","version":"9.2"},{"name":"Smaato","status":false,"pod":"AMRAdapterSmaato","version":"8.0"},{"name":"Startapp","status":false,"pod":"AMRAdapterStartapp","version":"3.4"},{"name":"Tapjoy","status":false,"pod":"AMRAdapterTapjoy","version":"11.11"},{"name":"Tappx","status":false,"pod":"AMRAdapterTappx","version":"3.0"},{"name":"Unity","status":false,"pod":"AMRAdapterUnity","version":"2.1"},{"name":"Vungle","status":false,"pod":"AMRAdapterVungle","version":"5.1"}]}');

var htmlString = "";

var arrayAppGradlePackages = [];


fillAdNetworkList(obj);

var htmlPodFile = "source \'https:\/\/github.com\/CocoaPods\/Specs.git\'\r\nplatform :ios, \'7.0\'\r\n\r\nuse_frameworks!\r\n\r\ntarget \'MyAwesomeTarget\' do\r\n#core SDK\r\npod \'AMRSDK\', \'~&gt; 1.2\'\r\n#mediation adapters\n";

fillPodFileCode();


function toggleAdNetworkStatus(adNetworkName) {
    var i = getPositionOfAdNetworkOnJSONArray(adNetworkName);
    if (obj.ad_networks[i].status == true) {
        removeAdNetworkToPodFile(i);
    } else {
        addAdNetworkToPodFile(i);
    }
}

function addAdNetworkToPodFile(i) {
    obj.ad_networks[i].status = true;
    fillAdNetworkList(obj);
    fillPodFileCode();
}

function removeAdNetworkToPodFile(i) {
    obj.ad_networks[i].status = false;
    fillAdNetworkList(obj);
    fillPodFileCode();
}

function getPositionOfAdNetworkOnJSONArray(adNetworkName) {
    for (var i = 0; i < obj.ad_networks.length; i++) {
        if (obj.ad_networks[i].name === adNetworkName) {
            return i;
        }
    }
    return null;
}

function fillAdNetworkList() {
    htmlString = '<div class="btn-group" style="margin:8px;" id="btn-group-network-AMR"> <button type="button" id="btn-name-network-AMR" class="btn btn-success">AMR</button>  </div>&nbsp;';
    for (var i = 1; i < obj.ad_networks.length; i++) {
        htmlString = htmlString + '<div class="btn-group" style="margin:8px; id="btn-group-network-' + obj.ad_networks[i].name + '"> <button type="button" id="btn-name-network-' + obj.ad_networks[i].name + '" class="btn btn-default">' + obj.ad_networks[i].name + '</button> <button type="button" id="btn-icon-network-' + obj.ad_networks[i].name + '" onclick="toggleAdNetworkStatus(\'' + obj.ad_networks[i].name + '\');" class="btn btn-';

        obj.ad_networks[i].status ? htmlString = htmlString + "danger" : htmlString = htmlString + "success";
        htmlString = htmlString + ' dropdown-toggle"> <span class="fa fa-';

        obj.ad_networks[i].status ? htmlString = htmlString + "minus" : htmlString = htmlString + "plus";
        htmlString = htmlString + '"></span> </button> </div>'
    }
    $("#adnetwork-button-list").html(htmlString);
}


function fillPodFileCode() {

    $('#file-pod').html("source \'https:\/\/github.com\/CocoaPods\/Specs.git\'\r\nplatform :ios, \'7.0\'\r\n\r\nuse_frameworks!\r\n\r\ntarget \'MyAwesomeTarget\' do\r\n#core SDK\r\npod \'"+obj.ad_networks[0].pod+"\', \'~&gt; "+ obj.ad_networks[0].version+"\'\r\n#mediation adapters\n");

    for (var i = 1; i < obj.ad_networks.length; i++) {
        if (obj.ad_networks[i].pod && obj.ad_networks[i].status == true) {
                $('#file-pod').append("pod \'"+ obj.ad_networks[i].pod+"\', \'~&gt; "+obj.ad_networks[i].version +"\'\r\n");
        }
    }

    $('#file-pod').append("\nend");

}
