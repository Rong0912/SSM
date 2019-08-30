$(document).ready( function() {

    $('#loginMessage').addClass("alert-info");


    $('#captchaImage').click(function()
    {
        $('#captchaImage').attr("src", "captcha.form?timestamp=" + (new Date()).valueOf());
    });


    $('#login').on("click",function(event) {
        var flag = checkLogin();
        event.preventDefault();
        if(flag) {
            $.ajax({
                type: 'POST',
                url: '/YourAnswer/api/userLogin',
                data: {
                    "uEmail": $('#ulEmail').val(),
                    "uPassword": $('#ulPassword').val(),
                    "verificationCode": $('#VerificationCode').val()
                },
                success: function (data) {
                    if (data.resultCode === 200) {
                         window.location.href = "/YourAnswer/index";
                    }
                    if (data.resultCode === 300) {

                        $('#loginMessage').addClass("alert-warning");
                        $('#loginMessage').text("您已经被封号！请等待解封");
                    }
                    if (data.resultCode === 400) {
                        $('#loginMessage').addClass("alert-warning");
                        $('#loginMessage').text("邮箱或密码错误！");
                    }
                },
                error: function (e) {
                    alert('Error: ' + e);
                }
            })
        }
    });


    $('#register').on("click",function(event) {
        var flag = checkRegister();
        event.preventDefault();
        /*var radio=document.getElementsByName("uGender").innerHTML;
        for(i=0;i<radio.length;i++){
            if(radio[i].checked){
                //alert(radio[i]);
                uGender=radio[i];
            }
        }*/
        if(flag == true) {
            $.ajax({
                type: 'POST',
                url: '/YourAnswer/api/user',
                data: {
                    "uEmail": $('#urEmail').val(),
                    "uPassword": $('#urPassword').val(),
                    "uRealName": $('#uRealName').val(),
                    "uTel": $('#uTel').val(),
                    "uName": $('#uName').val(),
                    "uGender":$(':radio[name="uGender"]:checked').val()
                },
                success: function (data) {
                    if (data.resultCode === 200) {
                        window.location.href = "/YourAnswer/index";
                    }
                    if (data.resultCode === 400) {
                        $('#registerMessage').addClass("alert-warning");
                        $('#registerMessage').text("未注册成功，账号可能已存在！");
                    }
                },
                error: function (e) {
                    alert('Error: ' + e);
                }
            })
        }

    });


});

function checkLogin() {
    var ulEmail = $('#ulEmail').val();
    var ulPassword = $('#ulPassword').val();
    var verificationCode = $('#VerificationCode').val();
    if( ulEmail.length == 0 || ulPassword == 0 ) {
        $('#loginMessage').addClass("alert-warning");
        $('#loginMessage').html("账号或密码不能为空！");
        return false;
    }
    if(verificationCode.length != 4 ) {
        $('#loginMessage').addClass("alert-warning");
        $('#loginMessage').html("验证码不正确！");
        return false;
    }
    if(ulPassword.length < 6) {
        $('#loginMessage').addClass("alert-warning");
        $('#loginMessage').html("密码格式不正确!");
        return false;
    }
    return true;
}

function checkRegister() {
    if($('#urPassword').val().length<6){
        $('#registerMessage').addClass("alert-warning");
        $('#registerMessage').text("密码长度应大于6！");
        return false;

    }
    if($('#urEmail').val().length < 6  || $('#uName').val().length < 1) {
        $('#registerMessage').addClass("alert-warning");
        $('#registerMessage').text("请完整输入数据！");
        return false;
    }
    var password1 = $('#urPassword').val();
    var password2 = $('#urPassword1').val();
    if(password1 === password2) {
        return true;
    } else {
        $('#registerMessage').addClass("alert-warning");
        $('#registerMessage').text("两次输入的密码不一致！");
        return false;
    }
}