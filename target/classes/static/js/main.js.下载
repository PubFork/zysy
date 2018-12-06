/**
 * 2015/12/27.
 * main.js 测试阶段 务必每个页面于jQuery.js之后引入
 * vx
 */

var Example = (function () {
    var elem,
        hideHandler,
        that = {};

    that.init = function (options) {
        elem = $(options.selector);

    };

    that.show = function (text) {
        clearTimeout(hideHandler);
        elem.find("span").html(text);
        elem.delay(300).fadeIn().delay(1500).fadeOut();
    };

    return that;
}());

var jb = '<script type="text/javascript" src="',
    je = '"><\/script>',
    js_ur = [
        '/Style/bootstrap/js/bootstrap.min.js',
        '/Style/bootstrap/js/bootstrap-datetimepicker.min.js',
        '/Style/bootstrap/js/locales/bootstrap-datetimepicker.zh-CN.js',
        '/Style/bootstrap/js/bootbox.js',
    ];
document.write(jb + js_ur.join(je + jb) + je);

jQuery(function () {

    var moodmessage = jQuery(".warpbox .moodmessage").html();
    jQuery(".moodform .moodmessage").focusin(function () {
        jQuery(this).html('');
    });

    jQuery(".moodform .moodmessage").focusout(function () {
        if (jQuery.trim(jQuery(this).html()) == '') {
            jQuery(this).html(moodmessage);
        }
    });
    bootbox.setLocale('zh_CN');
    Example.init({
        "selector": ".divfixbox"
    });

    jQuery(".moodform .moodbtn").click(function () {
        var message = jQuery.trim(jQuery(".warpbox .moodmessage").val());
        if (message != '' && message != moodmessage) {
            jQuery.post('/Doing/send.html', {message: message}, function (result) {
                if (result == 1) {
                    Example.show('^_^ 您的心情已经发布啦');
                    jQuery(".adminzy .adminmood").html(message);
                    jQuery(".moodform .moodmessage").val('');
                } else {
                    Example.show('(；′⌒`)您的心情暂时不能发布');
                }
            });
        } else {
            Example.show('T.T 还能不能好好发心情了');
        }
    });

    jQuery("body").delegate('a', 'click', function () {
        if (jQuery(this).attr('href') == '#') {
            //bootbox.alert('该功能暂未开放！');
            bootbox.alert({
                size: 'small',
                message: '该功能暂未开放，敬请期待！'
            });
            return false;
        }
    });

    jQuery(".leftside .admininfor p").each(function (e) {
        jQuery(this).find(".addfriend").click(function () {
            var uid = jQuery(this).data('uid');
            bootbox.addLocale('myfriend', {
                OK: '确认',
                CANCEL: '取消',
                CONFIRM: '发送附言'
            });

            bootbox.setLocale('myfriend');
            bootbox.prompt({
                title: "发送好友附言",
                callback: function (result) {
                    if (result === null) {
                        Example.show("(；′⌒`) 你还没考虑好加他（她）为您的好友");
                    } else {
                        jQuery.post('/Friend/friend_request.html', {uid: uid, ftext: result}, function (result) {
                            if (result == 1) {
                                Example.show("O(∩_∩)O~好友请求发送成功");
                            } else {
                                Example.show("正在等待对方处理，请稍后再试");
                                console.log(result);
                            }
                        });
                    }
                }
            });
            bootbox.removeLocale('myfriend');
        });

        jQuery(this).find(".delfriend").click(function () {
            var uid = jQuery(this).data('uid');
            bootbox.confirm({
                size: 'small',
                message: '确定删除该好友！？',
                callback: function (result) {
                    if (result == true) {
                        jQuery.post('/Friend/delete.html', {fuid: uid}, function (result) {
                            Example.show('删除好友成功');
                            location.href = location.href;
                        });
                    }
                }
            });
        });
    });

    jQuery(".warpbox .friendlist li").each(function (e) {
        jQuery(this).find("._refuse").click(function () {
            var fuid = jQuery(this).data('fuid');
            bootbox.confirm({
                size: 'small',
                message: '确定忽略当前请求！？',
                callback: function (result) {
                    if (result == true) {
                        jQuery.post('/Friend/refuse.html', {fuid: fuid}, function (result) {
                            Example.show('已忽略');
                            jQuery(".warpbox .friendlist li:eq(" + e + ")").remove();
                        });
                    }
                }
            });
        });
        jQuery(this).find("._agreed").click(function () {
            var fuid = jQuery(this).data('fuid');
            bootbox.confirm({
                size: 'small',
                message: '确定添加该用户为好友！？',
                callback: function (result) {
                    if (result == true) {
                        jQuery.post('/Friend/agreed.html', {fuid: fuid}, function (result) {
                            Example.show('添加好友成功');
                            jQuery(".warpbox .friendlist li:eq(" + e + ")").remove();
                        });
                    }
                }
            });
        });
        jQuery(this).find("._delete").click(function () {
            var fuid = jQuery(this).data('fuid');
            bootbox.confirm({
                size: 'small',
                message: '确定删除该好友！？',
                callback: function (result) {
                    if (result == true) {
                        jQuery.post('/Friend/delete.html', {fuid: fuid}, function (result) {
                            Example.show('删除好友成功');
                            jQuery(".warpbox .friendlist li:eq(" + e + ")").remove();
                        });
                    }
                }
            });
        });
    });

});

function bootIFrame(title, url, width, height) {
    bootbox.dialog({
        title: title,
        className: 'boot-in-dialog',
        message: '<iframe src="' + url + '" width="' + width + '" height="' + height + '" scrolling="no" marginwidth="0" marginheight="0" frameborder="0">' + '</iframe>'

    });
}