/*------------------------------------------------------------------
* Project:        Hotux
* Author:         CN-InfoTech
* URL:            hthttps://themeforest.net/user/cn-infotech
* Created:        01/08/2020
-------------------------------------------------------------------*/


(function ($) {


    "use strict";

    /*======== Doucument Ready Function =========*/
    jQuery(document).ready(function () {
        //CACHE JQUERY OBJECTS
        //  $("#status").fadeOut();
        // $("#preloader").delay(200).fadeOut("slow");
        // $("body").delay(200).css({ "overflow": "visible" });

        // $("#preloader").delay(10).fadeOut("slow");
        $("body").css({"overflow": "visible"});


        /* Init Wow Js */
        new WOW().init();

    });


    // Mouse-enter dropdown
    $('#navbar li').on('mouseenter', function () {
        $(this).find('ul').first().stop(true, true)
            .delay(350)
            .slideDown(500, 'easeInOutQuad');
    });
    // Mouse-leave dropdown
    $('#navbar li').on('mouseleave', function () {
        $(this).find('ul').first().stop(true, true)
            .delay(100)
            .slideUp(150, 'easeInOutQuad');
    });

    $(window).scroll(() => {
        if ($(window).scrollTop() > 10) {
            $('.navigation').addClass('navbar-sticky');
        } else {
            $('.navigation').removeClass('navbar-sticky');
        }
    });

    /* ------------------------------------------------------------------------ */
    /* BACK TO TOP
  /* ------------------------------------------------------------------------ */

    $(document).on('click', '#back-to-top, .back-to-top', () => {
        $('html, body').animate({scrollTop: 0}, '500');
        return false;
    });
    $(window).on('scroll', () => {
        if ($(window).scrollTop() > 500) {
            $('#back-to-top').fadeIn(200);
        } else {
            $('#back-to-top').fadeOut(200);
        }
    });

    jQuery(document).ready(() => {
        jQuery('.js-video-button').modalVideo({channel: 'vimeo'});
    });


    $('.review-slider').slick({
        infinite: true,
        slidesToShow: 2,
        slidesToScroll: 1,
        arrows: false,
        dots: true,
        autoplay: true,
        responsive: [
            {
                breakpoint: 1000,
                settings: {
                    slidesToShow: 1
                }
            }
        ]
    });

    $('.review-slider1').slick({
        infinite: true,
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        dots: false,
        autoplay: true,
    });


    $('.award-slider').slick({
        infinite: true,
        slidesToShow: 4,
        slidesToScroll: 1,
        arrows: false,
        dots: false,
        autoplay: true,
        responsive: [
            {
                breakpoint: 1000,
                settings: {
                    slidesToShow: 2
                }
            },
            {
                breakpoint: 500,
                settings: {
                    slidesToShow: 1
                }
            }
        ]
    });

    $('.team-slider').slick({
        infinite: true,
        slidesToShow: 3,
        slidesToScroll: 1,
        arrows: false,
        dots: false,
        autoplay: true,
        responsive: [
            {
                breakpoint: 1000,
                settings: {
                    slidesToShow: 2
                }
            },
            {
                breakpoint: 600,
                settings: {
                    slidesToShow: 1
                }
            }
        ]
    });

    $('.gallery-slider').slick({
        infinite: true,
        slidesToShow: 6,
        slidesToScroll: 1,
        arrows: false,
        dots: false,
        autoplay: true,
        responsive: [
            {
                breakpoint: 1000,
                settings: {
                    slidesToShow: 4
                }
            },
            {
                breakpoint: 500,
                settings: {
                    slidesToShow: 2
                }
            }
        ]
    });

    $('.slider-store').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        fade: true,
        asNavFor: '.slider-thumbs',
    });

    $('.slider-thumbs').slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        asNavFor: '.slider-store',
        dots: false,
        centerMode: true,
        arrows: true,
        focusOnSelect: true,
    });

    $('.slider-for').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: true,
        fade: true,
        autoplay: true,
        asNavFor: '.slider-nav',
    });
    $('.slider-nav').slick({
        slidesToShow: 5,
        slidesToScroll: 1,
        asNavFor: '.slider-for',
        dots: false,
        centerMode: true,
        autoplay: true,
        focusOnSelect: true,
    });


    // Date Picker
    $('#datepicker, #check-datepicker').datepicker();

    // selectPicker
    $('.selectpicker').selectpicker();

    // Nice Select JS
    $('.niceSelect').niceSelect();

    // accordian

    if ($('.accrodion-grp').length) {
        const accrodionGrp = $('.accrodion-grp');
        accrodionGrp.each(function () {
            const accrodionName = $(this).data('grp-name');
            const Self = $(this);
            const accordion = Self.find('.accrodion');
            Self.addClass(accrodionName);
            Self.find('.accrodion .accrodion-content').hide();
            Self.find('.accrodion.active').find('.accrodion-content').show();
            accordion.each(function () {
                $(this).find('.accrodion-title').on('click', function () {
                    if ($(this).parent().hasClass('active') === false) {
                        $(`.accrodion-grp.${accrodionName}`).find('.accrodion').removeClass('active');
                        $(`.accrodion-grp.${accrodionName}`).find('.accrodion').find('.accrodion-content').slideUp();
                        $(this).parent().addClass('active');
                        $(this).parent().find('.accrodion-content').slideDown();
                    }
                });
            });
        });
    }

    $("#contactform").validate({
        submitHandler: function () {

            $.ajax({
                url: 'mail/contact.php',
                type: 'POST',
                data: {
                    fname: $('input[name="first_name"]').val(),
                    lname: $('input[name="last_name"]').val(),
                    email: $('input[name="email"]').val(),
                    phone: $('input[name="phone"]').val(),
                    comments: $('textarea[name="comments"]').val(),
                },
                success: function (result) {
                    $('#contactform-error-msg').html(result);
                    $("#contactform")[0].reset();
                }
            });

        }
    });

    /*= ======= Isotope Filter Script ========= */

    const mt_personal = window.mt_personal || {};
    const $win = $(window);

    mt_personal.Isotope = function () {
        // 4 column layout
        const isotopeContainer = $('.isotopeContainer');
        if (!isotopeContainer.length || !jQuery().isotope) return;
        $win.on('load', () => {
            isotopeContainer.isotope({
                itemSelector: '.isotopeSelector',
            });
            $('.mt_filter').on('click', 'a', function (e) {
                $('.mt_filter ul li').find('.active').removeClass('active');
                $(this).addClass('active');
                const filterValue = $(this).attr('data-filter');
                isotopeContainer.isotope({filter: filterValue});
                e.preventDefault();
            });
        });
    };

    mt_personal.Isotope();


    // Range sliders activation
    $('.range-slider-ui').each(function () {
        const minRangeValue = $(this).attr('data-min');
        const maxRangeValue = $(this).attr('data-max');
        const minName = $(this).attr('data-min-name');
        const maxName = $(this).attr('data-max-name');
        const unit = $(this).attr('data-unit');

        $(this).slider({
            range: true,
            min: minRangeValue,
            max: maxRangeValue,
            values: [minRangeValue, maxRangeValue],
            slide(event, ui) {
                event = event;
                const currentMin = parseInt(ui.values[0], 10);
                const currentMax = parseInt(ui.values[1], 10);
                $(this).children('.min-value').text(`${currentMin} ${unit}`);
                $(this).children('.max-value').text(`${currentMax} ${unit}`);
                $(this).children('.current-min').val(currentMin);
                $(this).children('.current-max').val(currentMax);
            },
        });
    });

    $('#counter-block').ready(() => {
        $('.room').animationCounter({
            start: 0,
            end: 264,
            step: 2,
            delay: 10,
        });
        $('.staff').animationCounter({
            start: 12,
            end: 575,
            step: 2,
            delay: 15,
        });
        $('.restaurant').animationCounter({
            start: 25,
            end: 487,
            step: 2,
            delay: 12,
        });
        $('.award').animationCounter({
            start: 25,
            end: 320,
            step: 1,
            delay: 11,
        });
    });

    $(document).ready(() => {
        loopcounter('coming-counter');
    });


    window.FPConfig = {
        delay: 0,
        ignoreKeywords: [],
        maxRPS: 3,
        hoverDelay: 50,
    };


    niceSelect_destroy();

}(jQuery));

/**
 * Make height equal to screen
 */

jQuery(window).on('resize load', () => {
    resize_eb_slider();
}).resize();

/**
 * Resize slider
 */

function resize_eb_slider() {
    let bodyheight = jQuery(this).height();

    if (jQuery(window).width() > 1400) {
        bodyheight *= 0.90;
        jQuery('.slider').css('height', `${bodyheight}px`);
    }
}


function niceSelect_destroy() {
    if (jQuery(window).width() < 768) {
        $('.niceSelect').niceSelect('destroy');
    } else {
        $('.niceSelect').niceSelect('udpate');
    }
}


jQuery(document).on('click', '.dark-mode a', function () {
    jQuery('body').addClass('night-mode');
});
jQuery(document).on('click', '.light-mode a', function () {
    jQuery('body').removeClass('night-mode');
});

$(document).on('click', '#btn-search', function () {
    $('#submit-search').click();
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

function checkLogin() {
    let isLogin = false;
    $.ajax({
        type: 'GET',
        url: '/checkLogin',
        async: false,
        success: function (data) {
            if (data.code == 1) {
                isLogin = true;
            } else {
                showMsg(data.msg, "error", 1000);
                $('#btn-login-model').click();
            }
        }
    });
    return isLogin;
}

let isLogin = checkLogin();
if(isLogin) {
    $('#notLoginUl').hide();
    $('#loginUl').show();
} else {
    $('#loginUl').hide();
    $('#notLoginUl').show();
}

function checkOrder() {
    let isAllowOrder = false;
    let postId = $('#postId').val();
    let startDate = $('#startDate').val();
    let quantity = $('#quantity').val();
    if (postId == null || startDate == null || quantity == null) {
        showMsg('请输入完整信息', "info", 1000);
        return;
    }
    $.ajax({
        type: 'GET',
        url: '/checkOrder',
        async: false,
        data: {
            "postId": postId,
            "startDate": startDate,
            "quantity": quantity
        },
        success: function (data) {
            if (data.code == 1) {
                isAllowOrder = true;
            } else {
                showMsg(data.msg, "error", 1000);
            }
        }
    });
    return isAllowOrder;
}

$(document).on('click', '#btn-checkout', function () {
    let isLogin = checkLogin();
    // 判断是否登录
    if (isLogin) {
        // 判断日期房间是否合法
        let isAllowOrder = checkOrder();
        if (isAllowOrder) {
            $('#submit-checkout').click();
        }
    }
});


$(document).on('click', '#btn-order', function () {
    let isLogin = checkLogin();
    if (isLogin) {
        let postId = $('#postId').val();
        let startDate = $('#startDate').val();
        let quantity = $('#quantity').val();
        let userName = $('#userName').val();
        let userDisplayName = $('#userDisplayName').val();
        let idCard = $('#idCard').val();
        let price = $('#price').val();
        if (postId == null || startDate == null || quantity == null ||
            userName == null || userDisplayName == null || idCard == null) {
            showMsg('请输入完整信息', "info", 1000);
            return;
        }

        // if(confirm('你确定是否支付'+price+'元')){
            $.ajax({
                type: 'POST',
                url: '/order',
                async: false,
                data: {
                    "postId": postId,
                    "startDate": startDate,
                    "quantity": quantity,
                    "userName": userName,
                    "userDisplayName": userDisplayName,
                    "idCard": idCard
                },
                success: function (data) {
                    if (data.code == 1) {
                        showMsgAndRedirect(data.msg, "success", 1000, "/order/" + data.result);
                    } else {
                        showMsg(data.msg, "error", 1000);
                    }
                }
            });
        }
    // }
});

