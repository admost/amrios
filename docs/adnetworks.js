var obj;
var obj14;
var htmlString = "";
var htmlPodFile = "";
var arrayAppGradlePackages = [];

function amrInitPage(adNetworkJson, ios14json) {
  obj = adNetworkJson;
  obj14 = ios14json;
  fillAdNetworkList(obj);
  htmlPodFile = "source \'https:\/\/github.com\/CocoaPods\/Specs.git\'\r\nplatform :ios, \'8.0\'\r\n\r\nuse_frameworks!\r\n\r\ntarget \'MyAwesomeTarget\' do\r\n#core SDK\r\npod \'AMRSDK\', \'~&gt; 1.2\'\r\n#mediation adapters\n";
  fillPodFileCode();

}


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
    fillIos14FileCode();
}

function removeAdNetworkToPodFile(i) {
    obj.ad_networks[i].status = false;
    fillAdNetworkList(obj);
    fillPodFileCode();
    fillIos14FileCode();
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
    $('#file-pod').html("source \'https:\/\/github.com\/CocoaPods\/Specs.git\'\r\nplatform :ios, \'8.0\'\r\n\r\nuse_frameworks!\r\n\r\ntarget \'MyAwesomeTarget\' do\r\n#core SDK\r\npod \'"+obj.ad_networks[0].pod+"\', \'~&gt; "+ obj.ad_networks[0].version+"\'\r\n#mediation adapters\n");

    for (var i = 1; i < obj.ad_networks.length; i++) {
        if (obj.ad_networks[i].pod && obj.ad_networks[i].status == true && document.getElementById("file-pod").innerHTML.indexOf(obj.ad_networks[i].pod) == -1) {
          $('#file-pod').append("pod \'"+ obj.ad_networks[i].pod+"\', \'~&gt; "+obj.ad_networks[i].version +"\'\r\n");
        }
    }

    $('#file-pod').append("\nend");
}

function fillIos14FileCode(){
    var finalValues = [];

    //$('#file-ios-14').text("<key>SKAdNetworkItems</key>");    
    for (var i = 1; i < obj.ad_networks.length; i++) {
        if(obj.ad_networks[i].status == true){
            for(var j = 0 ; j<obj14.length;j++){
                if(obj14[j].name == obj.ad_networks[i].name){
                    for(k = 0; k < obj14[j].skAdNetwork.length;k++){
                        if(!includesUpper(finalValues,obj14[j].skAdNetwork[k])){//if(!finalValues.includes(obj14[j].skAdNetwork[k])){
                            finalValues.push(obj14[j].skAdNetwork[k]);
                        }
                    }
                }
            }            
        }
    }

    var finalXMLStr =  "<key>SKAdNetworkItems</key>\n<array>\n"//"<key>SKAdNetworkItems</key><array>";

    for(var i=0 ; i<finalValues.length ; i++){
        finalXMLStr+="\t<dict>\n\t\t<key>SKAdNetworkIdentifier</key>\n\t\t<string>"+ finalValues[i] + "</string>\n\t</dict>\n";
    }

    finalXMLStr+="</array>\n"

    $('#file-ios-14').text(finalXMLStr);    
}

function includesUpper(arr,item)
{
    for(var i=0;i<arr.length;i++){
        if(arr[i].toUpperCase() == item.toUpperCase()) return true;
    }
    return false;
}