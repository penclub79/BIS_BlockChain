var mongoose = require('mongoose');
var Schema = mongoose.Schema;
var autoIncrement = require('mongoose-auto-increment');

// 트랜잭션 스키마를 정의한다.
var RequestSchema = new Schema({
    user_id : String,
    form_type: String,
    form_name: String,
    name : String,
    created_at : {
        type : Date,
        default : Date.now()
    },
    fee_yn : {
        type: String,
        default: 'N'
    },
    accept_yn : {
        type: String,
        default: 'N'
    }
});

// 회원정보 id 자동증가
RequestSchema.plugin( autoIncrement.plugin,
    {
        model : "requestdetail",
        field : "seq",
        startAt : 1
    }
);

// numberFormat 적용
RequestSchema.virtual('getDate').get(function(){

    // 변수 date에 Date객체를 생성하고 해당 스키마의 create_at라는 데이터를 받아온다.
    var date = new Date(this.created_at);
    // 받아온 값을 return
    return {
        year : date.getFullYear(),
        month : date.getMonth()+1,
        day : date.getDate(),
        hour : date.getHours(),
        minute : date.getMinutes(),
        second : date.getSeconds(),
    };
});


module.exports = mongoose.model('requestdetail', RequestSchema);