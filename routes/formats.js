 
// var Web3 = require('web3');
// var provider = 'http://220.76.95.91:8546';
// var web3 = new Web3(new Web3.providers.HttpProvider(provider));
// var abi = [{"constant":false,"inputs":[{"name":"_contractFile","type":"string"},{"name":"_contractHash","type":"bytes32"}],"name":"issue","outputs":[],"payable":false,"type":"function","stateMutability":"nonpayable"},{"constant":true,"inputs":[],"name":"getContracts","outputs":[{"name":"","type":"bytes32[]"}],"payable":false,"type":"function","stateMutability":"view"},{"constant":true,"inputs":[{"name":"_contractHash","type":"bytes32"}],"name":"getContract","outputs":[{"name":"","type":"address"},{"name":"","type":"string"},{"name":"","type":"bytes32"}],"payable":false,"type":"function","stateMutability":"view"}];
// var contract = web3.eth.contract(abi).at(addr);

var express = require('express');
var router = express.Router();

// account app 출력(페이지 확인)
router.get('/', function(req, res){
    res.send('account app');
});

// 회원가입 페이지
router.get('/graduate', function(req, res){

    res.render('formats/BOKSOO');
});

router.post('/createXML', function(req,res){
    
    var result = req.body.path;
    // console.log(result);

    var request_detail = new Transaction({
        user_id : req.body.user_id,
        name : req.body.name,
        from : req.body.from,
        to : req.body.to,
        ether : req.body.ether,
        t_hash: req.body.t_hash,
        

        
    })


});

// 회원가입 처리 프로세스
router.post('/join', function(req, res){
    // 정의한 유저모델 형식과 동일한 데이터를 리퀘스트로 입력받는다.
    var User = new UserModel({

        user_id : req.body.user_id,
        // 비밀번호는 패스워드해쉬 라이브러리 js 파일로 암호화시킨다.
        password : passwordHash(req.body.password),
        major : req.body.major,
        blockchainid : req.body.blockchainid,
        blockchainpwd : req.body.blockchainpwd,
        user_name : req.body.user_name,
        user_phone : req.body.user_phone,
        user_sex : req.body.user_sex,
        user_birth : req.body.user_birth,
        user_email : req.body.user_email,
        user_addr : req.body.user_addr,
        user_addr2 : req.body.user_addr2,
        user_post : req.body.user_post
    });
    User.save(function(err){
        res.send('<script>alert("회원가입 성공");\
        location.href="/accounts/login";</script>');
    });
});

router.get('/success', function(req, res){
    res.send(req.user);
});

router.get('/logout', function(req, res){
    req.logout();
    res.redirect('/accounts/login');
});


module.exports = router;


