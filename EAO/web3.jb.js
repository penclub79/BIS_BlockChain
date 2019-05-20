class JB {
    constructor(provider, port, abi, addr) {
        Web3 = require('web3');
        this.provider = 'http://'.concat(provider, ':', port);
        this.web3 = new Web3(new Web3.providers.HttpProvider(this.provider));
        this.contract = this.web3.eth.contract(abi).at(addr);
    }

    unlockAccount(account, passphrase, callback) {
        $.ajax({
            url: this.provider,
            type: 'post',
            datatype: 'application/json',
            contentType: 'application/json',
            dataType: 'JSON',
            data: JSON.stringify({
                id: 8,
                jsonrpc: '2.0',
                method: 'personal_unlockAccount',
                params: [account, passphrase]
            }),
            success: function(data) {
                if(data.result == true) {
                    callback(null);
                } else {
                    callback('fail auth');
                }
            },
            error: function(error) {
                callback(error);
            }
        });
    }

    sendData() {

        bxfXmlSaveCspPrepare();
        bxfSearchTextPrepare();

        var inXML = $('#inXMLcontent').val();
        var calXML= $('#calXMLcontent').val();
        var apiKey= '5acda40a5de6a72c70b12679';
        var prams = 'apiKey='+apiKey+'&s_inXML='+inXML+'&s_calXML='+calXML;
        var url = 'http://xmlapi.datafarm.co.kr/soaxmlEngineApi.jsp';
        var client = new XMLHttpRequest();

        client.onreadystatechange = function(){
            if(client.readyState == 4 && client.status == 200) {
                // console.log(client.responseText);
                var result = client.responseText;
                createFile(result);
            }
        }
        client.open("POST",url,true) ;
        
        client.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        // client.setHeader("Access-Control-Allow-Origin", "*");

        client.send(prams);
        // console.log(client.responseText);
    }
    
    checkXml(callback) {
       var url = window.location.pathname;
       var xhttp = new XMLHttpRequest();
       xhttp.open('GET', url.substring(url.lastIndexOf('/')+1), true);
       xhttp.send();
       
       xhttp.onreadystatechange = function(){
          if(this.readyState == 4) {
             if(this.status == 200) {
                var xmlHash = jb.web3.sha3(xhttp.responseText.trim());
                
                console.log(xmlHash);
                if(jb.contract.getContract(xmlHash)[1] != url.substring(url.lastIndexOf('/')+1)) {
                   alert('변조된 계약서입니다.');
                }
            }
          }
       }
    };
}

var abi = [{"constant":false,"inputs":[{"name":"_contractFile","type":"string"},{"name":"_contractHash","type":"bytes32"}],"name":"issue","outputs":[],"payable":false,"type":"function","stateMutability":"nonpayable"},{"constant":true,"inputs":[],"name":"getContracts","outputs":[{"name":"","type":"bytes32[]"}],"payable":false,"type":"function","stateMutability":"view"},{"constant":true,"inputs":[{"name":"_contractHash","type":"bytes32"}],"name":"getContract","outputs":[{"name":"","type":"address"},{"name":"","type":"string"},{"name":"","type":"bytes32"}],"payable":false,"type":"function","stateMutability":"view"}];
var addr = '0x618CD4dCB28C6a93e55A95AFc66C6850E19648BE';
var jb = new JB('220.76.95.91', 8546, abi, addr);

function saveSoaxml() {
    alert($('#account').val());
    alert($('#passphrase').val());
   jb.unlockAccount($('#account').val(), $('#passphrase').val(), function(error) {
      if(error == 'fail auth') {
         alert('인증정보가 올바르지 않습니다.');
      } else if(error) {
         throw error;
      } else {   
            jb.sendData();
      }
   });
}

function createFile(xmlString){
    var xmlResult = xmlString.trim();

    // var path = 'C://DEV//3kbicas_Source//BIS_BlockChain//EAO//';
    var curlDate = new Date();
    var fileName = curlDate.getFullYear().toString()+pad((curlDate.getMonth()+1).toString(),2)+pad(curlDate.getDate().toString(),2)+
                   pad(curlDate.getHours(),2)+pad(curlDate.getMinutes(),2)+pad(curlDate.getSeconds(),2)+'.xml';
    var fullPath = fileName;

    if(isIE()){
        var blob = new Blob([xmlResult], { type: "text/plain", endings: "native" });
        
        window.navigator.msSaveBlob(blob, fullPath);
    }else{
        var blob = new Blob([xmlResult], { type: 'text/plain' });
        
        ///////1.
        // objURL = window.URL.createObjectURL(blob);
        // // 이전에 생성된 메모리 해제
        // if (window.__Xr_objURL_forCreatingFile__) {
        //     window.URL.revokeObjectURL(window.__Xr_objURL_forCreatingFile__);
        // }
        // window.__Xr_objURL_forCreatingFile__ = objURL;
        // var a = document.createElement('a');
        // a.download= fullPath;
        // a.href = objURL;
        // a.click();
        

        //////2.
        var a  = document.createElement("a"),
          url  = window.URL.createObjectURL(blob);
        a.href = url;
        a.target='_blank';
        a.download = fullPath;
        a.click();

        
    }
}

function isIE() {
    return (navigator.appName === 'Netscape' && navigator.userAgent.search('Trident') !== -1) ||
        navigator.userAgent.toLowerCase().indexOf("msie") !== -1;
}

function pad(n, width) {
    n = n + '';//string 변환
    return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
}

$(function(){
    // alert("$(function()");
   if($('#account')[0] !== undefined) {
      $('#account').autocomplete({
         source: jb.web3.eth.accounts
      });
   }else{
        alert('account를 찾을 수 없습니다');
    }
});