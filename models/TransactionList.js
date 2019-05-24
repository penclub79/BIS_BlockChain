var mongoose = require('mongoose');
var Schema = mongoose.Schema;
var autoIncrement = require('mongoose-auto-increment');

// 트랜잭션 스키마를 정의한다.
var TransactionListSchema = new Schema({
    user_id : String,
    name : String,
    from : String,
    to : String,
    ether : String,
    t_hash : String,
    created_at : {
        type : Date,
        default : Date.now()
    },
    cur_balance:String
});

// 회원정보 id 자동증가
TransactionListSchema.plugin( autoIncrement.plugin,
    {
        model : "transactionlist",
        field : "id",
        startAt : 1
    }
);

// numberFormat 적용
TransactionListSchema.virtual('getDate').get(function(){

    // 변수 date에 Date객체를 생성하고 해당 스키마의 create_at라는 데이터를 받아온다.
    var date = new Date(this.created_at);
    // 받아온 값을 return
    return {
        year : date.getFullYear(),
        month : date.getMonth()+1,
        day : date.getDate(),
        hour : date.getHours(),
        minute : date.getMinutes(),
        second : date.getSeconds()
    };
});


module.exports = mongoose.model('transactionlist', TransactionListSchema);