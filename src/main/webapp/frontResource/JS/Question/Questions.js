﻿$(document).ready( function() {

    $.get('/YourAnswer/api/Questions',
        function(data,status){
            if(status && data.resultCode === 200) {
                var questions = data.value;
                showData(questions);
            }
        }
    )

    function showData(questions) {
        new Vue({
            el: '#app',
            data: {
                questions
            }
        });
        Vue.filter('time', function (value) {
            return goodTime(value);
        });

    }
});


function goodTime(str){
    var now = new Date().getTime(),
        oldTime = new Date(str).getTime(),
        difference = now - oldTime,
        result='',
        minute = 1000 * 60,
        hour = minute * 60,
        day = hour * 24,
        halfamonth = day * 15,
        month = day * 30,
        year = month * 12,

        _year = difference/year,
        _month =difference/month,
        _week =difference/(7*day),
        _day =difference/day,
        _hour =difference/hour,
        _min =difference/minute;
    if(_year>=1) {result= "发表于 " + ~~(_year) + " 年前"}
    else if(_month>=1) {result= "发表于 " + ~~(_month) + " 个月前"}
    else if(_week>=1) {result= "发表于 " + ~~(_week) + " 周前"}
    else if(_day>=1) {result= "发表于 " + ~~(_day) +" 天前"}
    else if(_hour>=1) {result= "发表于 " + ~~(_hour) +" 个小时前"}
    else if(_min>=1) {result= "发表于 " + ~~(_min) +" 分钟前"}
    else result="刚刚";
    return result;
}