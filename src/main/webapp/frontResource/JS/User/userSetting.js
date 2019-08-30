$(document).ready( function() {
    $('#userPwd').on("click",function(event) {
        var uNewPassword1 = $('#uNewPassword1').val();
        var uNewPassword2 = $('#uNewPassword2').val();
        if(uNewPassword1.length < 6) {
            $('#updateUserPwdMessage').addClass("alert-warning");
            $('#updateUserPwdMessage').text("新密码长度应大于6！");

        } else if(uNewPassword1 !== uNewPassword2) {
            $('#updateUserPwdMessage').addClass("alert-warning");
            $('#updateUserPwdMessage').text("两次输入的密码不同！");

        }

        else {
            var uId = $('#uId').val();
            $.ajax({
                type: 'POST',
                url: '/YourAnswer/api/userPwd',
                data: {
                    "uId": $('#uId').val(),
                    "uEmail": $('#uEmail').val(),
                    "uPassword": $('#uPassword').val(),
                    "uNewPassword1": $('#uNewPassword1').val()

                },
                success: function (data) {


                    if (data.resultCode==200) {
                        $('#updateUserPwdMessage').addClass("alert-warning");
                        $('#updateUserPwdMessage').text("更改密码成功！");

                    } else {
                        $('#updateUserPwdMessage').addClass("alert-warning");
                        $('#updateUserPwdMessage').text("更改密码失败！");
                    }
                },
                error: function () {
                    $('#updateUserPwdMessage').addClass("alert-warning");
                    $('#updateUserPwdMessage').text("更改密码失败！");
                }
            })
        }

    });


    $('#userSetting').on("click",function(event) {
        var uId = $('#uId').val();
        $.ajax({
            type: 'POST',
            url: '/YourAnswer/api/userSetting',
            data: {
                "uId":$('#uId').val(),
                "uTel":$('#uTel').val(),
                "uName": $('#uName').val(),
                "uWord": $('#uWord').val(),
                "uResidence": $('#uResidence').val(),
                "uProfession": $('#uProfession').val()

            },
            success: function (data) {
                //alert(1);
                var flag = data.flag;
                if(flag) {
                    window.location.href = "/YourAnswer/user/" + uId;
                }
            },
            error: function () {
                $('#updateUserMessage').addClass("alert-warning");
                $('#updateUserMessage').text("修改失败！");
            }
        })
    });


    $('#btnTest').on("click",function() {
        this.$avatarModal = $("body").find('#avatar-modal');
        this.$avatarForm = this.$avatarModal.find('.avatar-form');
        var url = this.$avatarForm.attr('action');
        alert(url);
    })

});

$(function () {
    $("#uploadImg").click(function() {
        $("#file").click();
    });
});
