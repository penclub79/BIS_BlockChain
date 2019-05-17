// Function of Ethereum Account
exports.unlockAccount = function(account, passphrase, callback){
    var client = new XMLHttpRequest();
    var inXML = $('#inXMLcontent').val();
    var calXML= $('#calXMLcontent').val();
    var apiKey= '5acda40a5de6a72c70b12679';
    var prams = 'apiKey='+apiKey+'&s_inXML='+inXML+'&s_calXML='+calXML;

    client.onreadystatechange = function(){
        if(client.readyState == 4 && client.status == 200) {
            var result = client.responseText;
            // createFile(result);
        }
    }
    client.open("POST",url,true) ;
        
    client.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

    client.send(prams);

    callback(sc_yn);

}

//authXML 엔진에 입력데이터와 구조데이터를 post방식의 파라미터로 request & response
exports.createXML = function (){

    // bxfXmlSaveCspPrepare();
    // bxfSearchTextPrepare();

    var inXML = $('#inXMLcontent').val();
    var calXML= $('#calXMLcontent').val();
    var apiKey= '5acda40a5de6a72c70b12679';
    var prams = 'apiKey='+apiKey+'&s_inXML='+inXML+'&s_calXML='+calXML;
    var url = 'http://xmlapi.datafarm.co.kr/soaxmlEngineApi.jsp';
    var client = new XMLHttpRequest();

    client.onreadystatechange = function(){
        if(client.readyState == 4 && client.status == 200) {
            var result = client.responseText;
            console.log(result);
        }
    }
    client.open("POST",url,true) ;
    
    client.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    // client.setHeader("Access-Control-Allow-Origin", "*");

    client.send(prams);
    // console.log(client.responseText);
}

function saveSoaxml(){
    unlockAccount($('#account').val(), $('#passphrase').val(), function(error){
        if(error == 'fail auth') {
            alert('인증정보가 올바르지 않습니다.');
        } else if(error) {
            throw error;
        } else {   
            createXML();
        }
    });
}

// function unlockAccount(){

// }

// function unlockAccount(){

// }

