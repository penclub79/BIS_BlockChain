var mongoose = require('mongoose');
var Schema = mongoose.Schema;
var autoIncrement = require('mongoose-auto-increment');

// 트랜잭션 스키마를 정의한다.
var TransactionSchema = new Schema({

    t_hash : String,
    block_No : String,
    IPFS_hash : String,
    from : String,
    to : String,
    ether : String,
    gas_price : String,
    Nonce : String,
    time : {
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
TransactionSchema.virtual('getAmountFormat').get(function(){
    // 1000원을 1,000원으로 바꿔준다.
    return new Intl.NumberFormat().format(this.price);
});


module.exports = mongoose.model('transaction', TransactionSchema);

