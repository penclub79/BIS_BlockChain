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

    sendData(callback) {
        // bxfXmlSaveCspPrepare();
        // bxfSearchTextPrepare();
        // $('#form[id=inXMLcontent]').val()
        // $('#form[id=calXMLcontent]').val()
    
        // var url = new URL($(location).attr('href'));
        // var form = $('form');
        // form.append($('<input/>', {
        //     name: 'account',
        //     type: 'hidden',
        //     value: $('#account').val()
        // }));
        
        // form.attr('action', './soaxmlSave.jsp');
        // form.attr('method', 'post');
        // form.submit();
        // callback(null);

        var inXML = '<root><test>H_root/test</test></root>';
        var calXML= 'H_root/test##^^##tesddddddddddddddddddddg||^^||';
        var apiKey= '5acda40a5de6a72c70b12679';
        var prams = 'apiKey='+apiKey+'&s_inXML='+inXML+'&s_calXML='+calXML;
        var url = 'http://xmlapi.datafarm.co.kr/soaxmlEngineApi.jsp';
        var req = new XMLHttpRequest();
        req.onreadystatechange = function(){
            if(req.readyState == 4 && req.status == 200) {
                alert(req.responseText);
            }
        }
        req.open("POST",url,true) ;
        req.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        req.send(prams);


        
        
        
        
    }
    
    checkXml() {
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
// var createXML = require('./index');

function saveSoaxml() {
    // alert($('#account').val());
    // alert($('#passphrase').val());
//    jb.unlockAccount($('#account').val(), $('#passphrase').val(), function(error) {
//       if(error == 'fail auth') {
//          alert('인증정보가 올바르지 않습니다.');
//       } else if(error) {
//          throw error;
//       } else {   
//             alert('성공적으로 접근하여 락을 해제 하였습니다');
            jb.sendData();
//       }
//    });
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