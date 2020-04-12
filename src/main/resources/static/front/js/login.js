$(document).ready(function () {
    const userName = localStorage.getItem("userName");
    const userPass = localStorage.getItem("userPass");
    if (userName != null) {
        $("#userName").val(userName);
    }
    if (userPass != null) {
        $("#userPass").val(userPass);
    }
});

$('#btn-login').click(function () {
    $('#btn-login').button('loading');
    const name = $("#userName").val();
    const pwd = $("#userPass").val();
    const rememberMe = $("#rememberMe").prop("checked");
    if (name == "" || pwd == "") {
        showMsg("请输入完整信息！", "error", 1000);
        $('#btn-login').button('reset');
    } else {
        $.ajax({
            type: 'POST',
            url: '/login',
            async: false,
            data: {
                'userName': name,
                'userPass': pwd
            },
            success: function (data) {
                if (rememberMe) {
                    localStorage.setItem('userName', $("#userName").val());
                    localStorage.setItem('userPass', $("#userPass").val());
                } else {
                    localStorage.setItem('userName', '');
                    localStorage.setItem('userPass', '');
                }
                if (data.code == 1) {
                    showMsgAndReload(data.msg, "success", 1000);
                    // $('#notLoginUl').hide();
                    // $('#loginUl').show();
                } else {
                    showMsg(data.msg, "error", 1000);
                    $('#btn-login').button('reset');
                }
            }
        });
    }
})


$('#btn-register').click(function () {
    $('#btn-register').button('loading');
    const userName = $("#regUserName").val();
    const userPass = $("#regUserPass").val();
    const idCard = $("#idCard").val();
    const userDisplayName = $("#userDisplayName").val();
    if (userName == "" || userPass == "" || idCard == "" || userDisplayName == "") {
        showMsg("请输入完整信息！", "error", 1000);
        $('#btn-register').button('reset');
    } else {
        $.ajax({
            type: 'POST',
            url: '/register',
            async: false,
            data: {
                'userName': userName,
                'userPass': userPass,
                'idCard': idCard,
                'userDisplayName': userDisplayName
            },
            success: function (data) {
                if (data.code == 1) {
                    showMsgAndReload(data.msg, "success", 1000);
                } else {
                    showMsg(data.msg, "error", 1000);
                    $('#btn-register').button('reset');
                    localStorage.setItem('userName', userName);
                }
            }
        });
    }
});


$('#btn-forget').click(function () {
    const forgetUserName = $("#forgetUserName").val();
    const forgetUserPass = $("#forgetUserPass").val();
    const forgetIdCard = $("#forgetIdCard").val();
    if (forgetUserName == "" || forgetUserPass == "" || forgetIdCard == "") {
        showMsg("请输入完整信息！", "error", 1000);
    } else {
        $.ajax({
            type: 'POST',
            url: '/forget',
            async: false,
            data: {
                'userName': forgetUserName,
                'userPass': forgetUserPass,
                'idCard': forgetIdCard
            },
            success: function (data) {
                if (data.code == 1) {
                    showMsgAndReload(data.msg, "success", 2000);
                } else {
                    showMsg(data.msg, "error", 1000);
                }
            }
        });
    }
});

$('#btn-logout').click(function () {
    $.ajax({
        type: 'POST',
        url: '/logout',
        async: false,
        success: function () {
            window.location.reload();
        }
    });
});