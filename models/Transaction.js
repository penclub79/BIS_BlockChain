var mongoose = require('mongoose');
var Schema = mongoose.Schema;
var autoIncrement = require('mongoose-auto-increment');

// 트랜잭션 스키마를 정의한다.
var TransactionSchema = new Schema({
    blockHash : String,
    user_id : String,
    name : String,
    from : String,
    to : String,
    ether : String,
    t_hash : String,
    gas : String,
    gasPrice : String,
    input : String,
    r : String,
    s : String,
    v : String,
    transactionIndex : String,
    Nonce : String,
    created_at : {
        type : Date,
        default : Date.now()
    }
});

// 회원정보 id 자동증가
TransactionSchema.plugin( autoIncrement.plugin,
    {
        model : "transaction",
        field : "id",
        startAt : 1
    }
);

// numberFormat 적용
TransactionSchema.virtual('getDate').get(function(){

    // 변수 date에 Date객체를 생성하고 해당 스키마의 create_at라는 데이터를 받아온다.
    var date = new Date(this.created_at);
    // 받아온 값을 return
    return {
        year : date.getFullYear(),
        month : date.getMonth()+1,
        day : date.getDate()
    };
});


module.exports = mongoose.model('transaction', TransactionSchema);

