//按enter键,阻止提交订单
function doClick(event) {
    //    if ($.trim($('#' + buttonId + '').val()) == '') {  
    //        shorError();  
    //        return;  
    //    }  
    var key;

    if (window.event)
        key = window.event.keyCode;     //IE  
    else
        key = event.which;     //firefox  

    if (key == 13) {
        //                if ($.trim($('#btnVerificationCode').val()) == '') {  
        //                    shorError();  
        //                }  
        try {
            if (window.event) {//ie  
                window.event.keyCode = 0
                window.event.returnValue = false;
            }
            else {//firefox  
                return false;
            }
        }
        catch (ex) {
        }
    }
}
function AddFavorite(sURL, sTitle) {
    try {
        window.external.addFavorite(sURL, sTitle);
    }
    catch (e) {
        try {
            window.sidebar.addPanel(sTitle, sURL, "");
        }
        catch (e) {
            alert("加入收藏失败，请使用Ctrl+D进行添加");
        }

    }
}
//设为首页 <a onclick="SetHome(this,window.location)">设为首页</a>
function SetHome(obj, vrl) {
    try {
        obj.style.behavior = 'url(#default#homepage)'; obj.setHomePage(vrl);
    }
    catch (e) {
        if (window.netscape) {
            try {
                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
            }
            catch (e) {
                alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。");
            }
            var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
            prefs.setCharPref('browser.startup.homepage', vrl);
        }
    }
}


$(document).ready(function () {

    var timerRunning = false;

    var bj_Hour = 0;
    var bj_Minute = 0;
    var bj_Second = 0;
    var bj_Month = 0;
    var bj_Day = 0;
    var bj_Year = 0;

    var fg_Hour = 0;
    var fg_Minute = 0;
    var fg_Second = 0;
    var fg_Month = 0;
    var fg_Day = 0;
    var fg_Year = 0;

    function checkDateTime() {

        var type = "GetBeiJingTime";
        $.post(
                    "AjaxRequest.aspx",
                    { Type: type },
                    function (result) {
                        //$("#bj_time").text(result[0].Hour + ":" + result[0].Minute + ":" + result[0].Second + "," + result[0].Month + "/" + result[0].Day);
                        //$("#fg_time").text(result[1].Hour + ":" + result[1].Minute + ":" + result[1].Second + "," + result[1].Month + "/" + result[1].Day);
                        bj_Hour = result[0].Hour;
                        bj_Minute = result[0].Minute;
                        bj_Second = result[0].Second;
                        bj_Year = result[0].Year;
                        bj_Month = result[0].Month;
                        bj_Day = result[0].Day;

                        fg_Hour = result[1].Hour;
                        fg_Minute = result[1].Minute;
                        fg_Second = result[1].Second;
                        fg_Year = result[1].Year;
                        fg_Month = result[1].Month;
                        fg_Day = result[1].Day;

                        UpdateDateTime();
                    },
                    "json");

        //updatetime = setTimeout("checkDateTime()", 1000);
        //updatetime = setInterval(UpdateDateTime, 1000);
        //timerRunning = true;
    }

    function UpdateDateTime() {
        if (timerRunning) {
            clearTimeout(updatetime);
            timerRunning = false;
        }

        var bj_today = new Date(bj_Year, bj_Month, bj_Day, bj_Hour, bj_Minute, bj_Second);
        var fg_today = new Date(fg_Year, fg_Month, fg_Day, fg_Hour, fg_Minute, fg_Second);


        $("#bj_time").text(addZero(bj_today.getHours()) + ":" + addZero(bj_today.getMinutes()) + ":" + addZero(bj_today.getSeconds()) + "," + addZero(bj_today.getMonth()) + "/" + addZero(bj_today.getDate()));
        $("#fg_time").text(addZero(fg_today.getHours()) + ":" + addZero(fg_today.getMinutes()) + ":" + addZero(fg_today.getSeconds()) + "," + addZero(fg_today.getMonth()) + "/" + addZero(fg_today.getDate()));

        bj_today = new Date(bj_Year, bj_Month, bj_Day, bj_Hour, bj_Minute, ++bj_Second);
        fg_today = new Date(fg_Year, fg_Month, fg_Day, fg_Hour, fg_Minute, ++fg_Second);

        bj_Year = bj_today.getFullYear();
        bj_Month = bj_today.getMonth();
        bj_Day = bj_today.getDate();
        bj_Hour = bj_today.getHours();
        bj_Minute = bj_today.getMinutes();
        bj_Second = bj_today.getSeconds();

        fg_Year = fg_today.getFullYear();
        fg_Month = fg_today.getMonth();
        fg_Day = fg_today.getDate();
        fg_Hour = fg_today.getHours();
        fg_Minute = fg_today.getMinutes();
        fg_Second = fg_today.getSeconds();

        updatetime = setInterval(arguments.callee, 1000);
        timerRunning = true;
    }

    function addZero(num, end) {
        return num < 10 ? "0" + num : num;
    }



    checkDateTime();
    //UpdateDateTime();
});