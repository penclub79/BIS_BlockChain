var express = require('express');
var router = express.Router();
var UserModel = require('../models/UserModel');
// 비밀번호를 암호화시킬 암호화 해쉬 js파일을 로드한다.
var TransactionModel = require('../models/Transaction');
// 상세 페이지를 위해 transaction DB를 로드한다.
var passwordHash = require('../libs/passwordHash');
// 로그인 설정관련 모듈
var co = require('co');
var passport = require('passport');
var LocalStrategy = require('passport-local').Strategy;
var session = require('express-session');
var loginRequired = require('../libs/loginRequired');

var paginate = require('express-paginate');

// serialize, deserialize : 실질적으로 session은 done에 담긴다.
// 시리얼, 디시리얼은 나누는 이유는 시리얼에서 아이디를 받아와서 디시리얼에서 분기정책을 정해준다.
// 로그인 성공시 먼저 실행되고 디시리얼이 실행된다. 
passport.serializeUser(function (user, done){

    console.log('serializeUser');
    done(null, user);
});
// 로그인 성공했을 때 콘솔화면에 나오는 메서드
passport.deserializeUser(function (user, done) {
    var result = user;
    result.password = user.password;
    console.log('deserializeUser');

    UserModel.findOne(
        {
            _id : user._id
        }, function(err, result){
            done(null, result);
        }
    );  
});
// 로그인 처리 프로세스 및 로그인관련 passport 정책설정
passport.use(new LocalStrategy({

    usernameField : 'user_id',
    passwordField : 'password',
    passReqToCallback : true
    }, function(req, user_id, password, done){
        
        UserModel.findOne(
            {
                user_id : user_id,
                password : passwordHash(password)
            }, function(err, user){
                
                UserModel.findOne({
                    user_id : user_id,
                    password : passwordHash(password)
                }, function(err, user){
                    
                    if(!user){
                        return done(null, false, { message : '아이디 또는 비밀번호 오류'});
                    }else{
                        return done(null, user);
                    }   
                });
            }
        );
    }
));

// account app 출력(페이지 확인)
router.get('/', function(req, res){
    res.send('account app');
});

// 회원가입 페이지
router.get('/join', function(req, res){
    res.render('accounts/join');
});

// 회원가입 처리 프로세스
router.post('/join', function(req, res){
    // 정의한 유저모델 형식과 동일한 데이터를 리퀘스트로 입력받는다
    console.log(req.body.user_id);
    var User = new UserModel({
        user_id : req.body.user_id,
        // 비밀번호는 패스워드해쉬 라이브러리 js 파일로 암호화시킨다.
        password : passwordHash(req.body.password),
        major : req.body.major,
        blockchainid : req.body.blockchainid,
        blockchainpwd : req.body.blockchainpwd,
        user_name : req.body.user_name,
        // user_phone : req.body.user_phone,
        // user_sex : req.body.user_sex,
        // user_birth : req.body.user_birth,
        // user_email : req.body.user_email,
        // user_addr : req.body.user_addr,
        // user_addr2 : req.body.user_addr2,
        // user_post : req.body.user_post
    });
    User.save(function(err){
        res.send('<script>alert("회원가입 성공");\
        location.href="/accounts/login";</script>');
    });
});

// 로그인 페이지
router.get('/login', function(req, res){
    
    res.render('accounts/login',
        {
            flashMessage : req.flash().error
        }
    );
});

// 로그인 처리 프로세스
router.post('/login', 
    passport.authenticate('local', 
        {
            failureRedirect : '/accounts/login',
            failureFlash : true
        }), function(req, res){
            res.send('<script>alert("로그인 성공");location.href="/home";</script>');
        }
);

router.get('/success', function(req, res){
    res.send(req.user);
});

router.get('/logout', function(req, res){
    req.logout();
    res.redirect('/accounts/login');
});


// GET 내 정보 수정 페이지
router.get('/myinfo', loginRequired, function(req, res){

    console.log('myinfo 페이지 경로요청');
    console.log(req.user);

    if(!req.user){

        console.log('사용자 인증불가');
        res.redirect('/accounts/login');
    }else{

        if(Array.isArray(req.user)){
            res.render('accounts/myinfo.ejs', { user : req.user[0]._id });
        }else{
            res.render('accounts/myinfo.ejs', { user : req.user });
        }
    }   
});

// POST 내 정보 수정처리
router.post('/myinfo', loginRequired, function(req, res){
    // 수정 된 내 정보 데이터 받기
        var _id = req.user._id;
        var user_id = req.body.user_id;
        // 비밀번호는 패스워드해쉬 라이브러리 js 파일로 암호화시킨다.
        var password = passwordHash(req.body.password);
        var major = req.body.major;
        var blockchainid = req.body.blockchainid;
        var blockchainpwd = passwordHash(req.body.blockchainpwd);
        var user_name = req.body.user_name;
        var user_phone = req.body.user_phone;
        var user_sex = req.body.user_sex;
        var user_birth = req.body.user_birth;
        var user_email = req.body.user_email;
        var user_addr = req.body.user_addr;
        var user_addr2 = req.body.user_addr2;
        var user_post = req.body.user_post;
    
        // 업데이트 처리 
    UserModel.update(
        // 로그인한 사용자의 몽고디비 아이디를 받는다.
        {
            _id : _id
        },
        {   // 몽고디비 아이디에 맞는 회원정보 데이터베이스를 일치하는 doc대로 수정한다.
            $set : {
                
                user_id : user_id,
                // 비밀번호는 패스워드해쉬 라이브러리 js 파일로 암호화시킨다.
                password : password,
                major : major,
                blockchainid : blockchainid,
                blockchainpwd : blockchainpwd,
                user_name : user_name,
                user_phone : user_phone,
                user_sex : user_sex,
                user_birth : user_birth,
                user_email : user_email,
                user_addr : user_addr,
                user_addr2 : user_addr2,
                user_post : user_post
            }
        }, function(err){
            // 에러가 발생하면 Error
            if(err){
                throw err;
            }else{  // 발생하지 않으면 회원정보 수정페이지로 이동한다.
                res.redirect('/accounts/myinfo');
            }
        }
    );

});

// get 내 wallet보기 페이지
router.get('/wallet', loginRequired, function(req, res){

    console.log('wallet 페이지 경로요청!!!!!!!!!!!');
    console.log(req.user);

    if(!req.user){

        console.log('사용자 인증불가');
        res.redirect('/accounts/login');
    }else{

        if(Array.isArray(req.user)){
            res.render('accounts/wallet.ejs', { user : req.user[0]._id });
        }else{
            res.render('accounts/wallet.ejs', { user : req.user });
        }
    }   
});

// get 내 songguem보기 페이지
router.get('/songguem', loginRequired, function(req, res){

    console.log('songguem 페이지 경로요청');
    console.log(req.user);

    if(!req.user){

        console.log('사용자 인증불가');
        res.redirect('/accounts/login');
    }else{

        if(Array.isArray(req.user)){
            res.render('accounts/songguem.ejs', { user : req.user[0]._id });
        }else{
            res.render('accounts/songguem.ejs', { user : req.user });
        }
    }   
});

router.post('/songguem', function(req, res){
    // 정의한 유저모델 형식과 동일한 데이터를 리퀘스트로 입력받는다
    var Transaction = new TransactionModel({
        blockHash : req.body.blockHash,
        user_id : req.body.user_id,
        name : req.body.user_name,
        from : req.body.blockchainid,
        to : req.body.otherblockchainid,
        t_hash : req.body.t_hash,
        gas : req.body.gas,
        gasPrice : req.body.gasPrice,
        input : req.body.input,
        r : req.body.r,
        s : req.body.s,
        v : req.body.v,
        transactionIndex : req.body.transactionIndex,
        // Nonce : req.body.gas,
        // block_No : req.body.block_No,
        // IPFS_hash : passwordHash(req.body.IPFS_hash),
        ether : req.body.ether
        // Nonce : req.body.Nonce,
    });
    Transaction.save(function(err){
        res.send('<script>alert("내역저장 성공");\
        location.href="/accounts/songguem";</script>');
    });
});
//get 내 승인조회 보기 페이지
router.get('/studentlist', loginRequired, function(req, res){

    console.log('studentlist 페이지 경로요청');
    console.log(req.user);

    if(!req.user){

        console.log('사용자 인증불가');
        res.redirect('/accounts/login');
    }else{

        if(Array.isArray(req.user)){
            res.render('accounts/studentlist.ejs', { user : req.user[0]._id });
        }else{
            res.render('accounts/studentlist.ejs', { user : req.user });
        }
    }   
});


// 졸업증명서 호출
router.get('/graduate', function(req, res){
    console.log(req.user)
    res.render('formats/BOKSOO.ejs', { user : req.user });
});


router.post('/saveLog', function(req,res){

    var Transaction = new TransactionModel({
        user_id : req.body.user_id,
        name : req.body.name,
        // from : req.body.from,
        // to : req.body.to,
        // ether : req.body.ether,
        // t_hash: req.body.t_hash
    });
    Transaction.save(function(err){
        // res.send('<script>alert("내역저장 성공");\
        // location.href="/accounts/songguem";</script>');
    });


});
// get 내 history보기 페이지
// router.get('/history', loginRequired, transaction, function(req, res){

//     console.log('history 페이지 경로요청');
//     console.log(req.user);

//     if(!req.user){

//         console.log('사용자 인증불가');
//         res.redirect('/accounts/login');
//     }else{

//         if(Array.isArray(req.transaction)){
//             res.render('accounts/history.ejs', { user : req.transaction[0]._id });
//         }else{
//             res.render('accounts/history.ejs', { user : req.transaction });
//         }
//     }   
// });
router.get('/history', paginate.middleware(5, 50), async (req,res) => {

    if(!req.isAuthenticated()){

        res.send('<script>alert("로그인이 필요한 서비스입니다.");location.href="/accounts/login"</script>');
    }else{
        
        const [ results, itemCount ] = await Promise.all([
            // sort : minus 하면 내림차순(날짜명)이다.
            TransactionModel.find({"user_id" : req.user.user_id}).sort('-created_at').limit(req.query.limit).skip(req.skip).exec(),
            TransactionModel.count({})
        ]);
        const pageCount = Math.ceil(itemCount / req.query.limit);
        
        const pages = paginate.getArrayPages(req)( 4 , pageCount, req.query.page);

        res.render('accounts/history', 
            { 
                transaction : results , 
                pages: pages,
                pageCount : pageCount,
            });
    }
});

// GET 어드민 등록제품 상세페이지
router.get('/history/:id', function(req, res){
    
        var getData = async() => {
            // async()함수를 만들고 return반환 후 처리가 다 되면 getData().then이 실행된다.
            return {
                
                transaction : await TransactionModel.findOne( { 'id' :  req.params.id }).exec()
                // comments : await CommentsModel.find( { 'product_id' :  req.params.id }).exec(),
                // reple : await repleModel.find( { 'products_id' :  req.params.id }).exec()
            };
        };
        getData().then( function(result){
            
            res.render('accounts/historydetail', 
                { 
                    transact : result.transaction,
                    // comments : result.comments,
                    // reples : result.reple 
                });
        });
});



module.exports = router;


