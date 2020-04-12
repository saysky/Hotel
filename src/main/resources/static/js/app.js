function initMenus() {
    $.ajax({
        type: 'GET',
        url: '/admin/currentMenus',
        async: false,
        success: function (data) {
            if (data.code == 0) {
                showMsg(data.msg, "error", 1000);
            } else {
                var content = ' <li class="header">HEADER</li>';
                $.each(data.result, function (index, value) {
                    if (value.childPermissions != null) {
                        content += '<li class="treeview">' +
                            '   <a data-pjax="true" href="' + value.url + '">' +
                            '   <i class="' + value.icon + '"></i>' +
                            '   <span>' + value.name + '</span>' +
                            '   <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>' +
                            '   </a>';
                        content += '<ul class="treeview-menu">';
                        $.each(value.childPermissions, function (index2, value2) {
                            content +=
                                '    <li>' +
                                '        <a data-pjax="true" href="' + value2.url + '">' +
                                '            <i class="' + value2.icon + '"></i>' + value2.name +
                                '        </a>' +
                                '     </li>';
                        });
                        content += '</ul></li>';

                    } else {
                        content += '<li>' +
                            '   <a data-pjax="true" href="' + value.url + '">' +
                            '   <i class="' + value.icon + '"></i>' +
                            '   <span>' + value.name + '</span>' +
                            '   </a>' +
                            '</li>';
                    }
                    ;
                })
                $('.sidebar-menu').html(content);
            }

        }
    });
}

function getLoginUser() {
    $.ajax({
        type: 'GET',
        url: '/admin/currentUser',
        async: false,
        success: function (data) {
            if (data.code == 0) {
                showMsg(data.msg, "error", 1000);
            } else {
                var user = data.result;
                $(".loginUserAvatar").attr("src", user.userAvatar);
                $(".loginUserDisplayName").html(user.userDisplayName);
            }

        }
    });
};

initMenus();
getLoginUser();

$(document).ready(function () {
    if ($(window).width() < 1024) {
        if ($('body').hasClass('layout-boxed')) {
            $('body').removeClass('layout-boxed');
        }
        if ($('body').hasClass('sidebar-collapse')) {
            $('body').removeClass('sidebar-collapse');
        }
    }
    initMenu();
});

/**
 * https://github.com/JpressProjects/jpress/blob/master/jpress-web/src/main/resources/static/admin/js/jpressadmin.js
 */
function initMenu() {
    var pathName = location.pathname;
    $(".sidebar-menu").children().each(function () {
        var li = $(this);
        li.find('a').each(function () {
            var href = $(this).attr("href");
            if (pathName == href) {
                li.addClass("active");
                $(this).parent().addClass("active");
            } else {
                //li.removeClass("active");
                $(this).parent().removeClass("active");
            }
        });
    });
}


$(document).on('pjax:clicked', function () {
    $('.content-wrapper').html("");
});

$(document).on('pjax:complete', function () {
    initMenu();
});

/**
 * 提示框
 * @param text
 * @param icon
 * @param hideAfter
 */
function showMsg(text, icon, hideAfter) {
    if (heading == undefined) {
        var heading = "提示";
    }
    $.toast({
        text: text,
        heading: heading,
        icon: icon,
        showHideTransition: 'fade',
        allowToastClose: true,
        hideAfter: hideAfter,
        stack: 1,
        position: 'top-center',
        textAlign: 'left',
        loader: true,
        loaderBg: '#ffffff'
    });
}

function showMsgAndReload(text, icon, hideAfter) {
    if (heading == undefined) {
        var heading = "提示";
    }
    $.toast({
        text: text,
        heading: heading,
        icon: icon,
        showHideTransition: 'fade',
        allowToastClose: true,
        hideAfter: hideAfter,
        stack: 1,
        position: 'top-center',
        textAlign: 'left',
        loader: true,
        loaderBg: '#ffffff',
        afterHidden: function () {
            window.location.reload();
        }
    });
}

function showMsgAndRedirect(text, icon, hideAfter, redirectUrl) {
    if (heading == undefined) {
        var heading = "提示";
    }
    $.toast({
        text: text,
        heading: heading,
        icon: icon,
        showHideTransition: 'fade',
        allowToastClose: true,
        hideAfter: hideAfter,
        stack: 1,
        position: 'top-center',
        textAlign: 'left',
        loader: true,
        loaderBg: '#ffffff',
        afterHidden: function () {
            window.location.href = redirectUrl;
        }
    });
}


/**
 * 全选和反选
 * @constructor
 */
function doCheck() {
    var ch = document.getElementsByName("ids");
    if (document.getElementById("allSelect").checked == true) {
        for (var i = 0; i < ch.length; i++) {
            ch[i].checked = true;
        }
    } else {
        for (var i = 0; i < ch.length; i++) {
            ch[i].checked = false;
        }
    }
}

/**
 * 提交客房
 * @param status 客房状态
 */
function push(status) {
    const id = $('#postId').val();
    const postTitle = $('#postTitle').val();
    const cateId = $('#cateId').val();
    const postThumbnail = $('#postThumbnail').val();
    const price = $('#price').val();
    const postContent = $("#postContent").val();
    const postEditor = $("#edit").froalaEditor('html.get');
    const number = $('#number').val();
    if(postTitle == null || cateId == null || cateId == null || postThumbnail == null || price == null || postContent == null || number == null || postEditor == null) {
        showMsg("请输入完整信息", "info", 2000);
        return;
    }

    $.ajax({
        type: 'POST',
        url: '/admin/post/save',
        async: false,
        data: {
            'id': id,
            'postStatus': status,
            'postTitle': postTitle,
            'postContent': postContent,
            'cateId': cateId,
            'postThumbnail': postThumbnail,
            'price': price,
            'number': number,
            'postEditor': postEditor
        },
        success: function (data) {
            if (data.code == 1) {
                if(status == 1) {
                    showMsg("操作成功", "success", 2000);
                } else {
                    showMsgAndRedirect("操作成功", "success", 1000, "/admin/post");
                }
            } else {
                showMsg(data.msg, "error", 2000);

            }
        }
    });
}


function getLoginRole() {
    $.ajax({
        type: 'GET',
        url: '/admin/currentRole',
        async: false,
        success: function (data) {
            if (data.code == 0) {
                showMsg(data.msg, "error", 1000);
            } else {
                let role = data.result;
                if(role == 'customer') {
                    $(".role-customer-hide").hide();
                }
            }

        }
    });
};
getLoginRole();