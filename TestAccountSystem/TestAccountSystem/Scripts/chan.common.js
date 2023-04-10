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
                    "../AjaxRequest.aspx",
                    { Type: type },
                    function (result) {
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

                        UpdateDateTime();//异步加载会有延迟，只有加载完成后再显示
                    },
                    "json");

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
});


//var timerRunning = false;

//var bj_Hour = 0;
//var bj_Minute = 0;
//var bj_Second = 0;
//var bj_Month = 0;
//var bj_Day = 0;
//var bj_Year = 0;

//var fg_Hour = 0;
//var fg_Minute = 0;
//var fg_Second = 0;
//var fg_Month = 0;
//var fg_Day = 0;
//var fg_Year = 0;

//function checkDateTime() {

//    var type = "GetBeiJingTime";
//    $.post(
//                    "../AjaxRequest.aspx",
//                    { Type: type },
//                    function (result) {
//                        //$("#bj_time").text(result[0].Hour + ":" + result[0].Minute + ":" + result[0].Second + "," + result[0].Month + "/" + result[0].Day);
//                        //$("#fg_time").text(result[1].Hour + ":" + result[1].Minute + ":" + result[1].Second + "," + result[1].Month + "/" + result[1].Day);
//                        bj_Hour = result[0].Hour;
//                        bj_Minute = result[0].Minute;
//                        bj_Second = result[0].Second;
//                        bj_Year = result[0].Year;
//                        bj_Month = result[0].Month;
//                        bj_Day = result[0].Day;

//                        fg_Hour = result[1].Hour;
//                        fg_Minute = result[1].Minute;
//                        fg_Second = result[1].Second;
//                        fg_Year = result[1].Year;
//                        fg_Month = result[1].Month;
//                        fg_Day = result[1].Day;
//                    },
//                    "json");

//    updatetime = setTimeout("checkDateTime()", 1000);
//    timerRunning = true;
//}

//function UpdateDateTime() {
//    if (timerRunning) {
//        clearTimeout(updatetime);
//        timerRunning = false;
//    }
//    bj_Second++;
//    if (bj_Second == 60) { bj_Second = 0; bj_Minute++; }
//    if (bj_Minute == 60) { bj_Minute = 0; bj_Hour++; }
//    if (bj_Hour == 24) { bj_Hour = 0; bj_Day++; }
//    if (bj_Month == 1 || bj_Month == 3 || bj_Month == 5 || bj_Month == 7 || bj_Month == 8 || bj_Month == 10 || bj_Month == 12) {
//        if (bj_Day == 32) {
//            bj_Day = 1;
//            if (bj_Month == 12) {
//                bj_Month = 1;
//                bj_Year++;
//            } else {
//                bj_Month++;
//            }
//        }
//    } else if (bj_Month == 4 || bj_Month == 6 || bj_Month == 9 || bj_Month == 11) {
//        if (bj_Day == 31) {
//            bj_Day = 1; bj_Month++;
//        }
//    } else if (bj_Month == 2) {
//        if ((bj_Year % 4 == 0 && bj_Year % 100 != 0) || (bj_Year % 100 == 0 && bj_Year % 400 == 0)) {
//            //是闰年，2月有29天
//            if (bj_Day == 30) {
//                bj_Month++;
//                bj_Day = 1;
//            }
//        } else {
//            //不是闰年，2月有28天
//            if (bj_Day == 29) {
//                bj_Month++;
//                bj_Day = 1;
//            }
//        }
//    }


//    fg_Second++;
//    if (fg_Second == 60) { fg_Second = 0; fg_Minute++; }
//    if (fg_Minute == 60) { fg_Minute = 0; fg_Hour++; }
//    if (fg_Hour == 24) { fg_Hour = 0; fg_Day++; }
//    if (fg_Month == 1 || fg_Month == 3 || fg_Month == 5 || fg_Month == 7 || fg_Month == 8 || fg_Month == 10 || fg_Month == 12) {
//        if (fg_Day == 32) {
//            fg_Day = 1;
//            if (fg_Month == 12) {
//                fg_Month = 1;
//                fg_Year++;
//            } else {
//                fg_Month++;
//            }
//        }
//    } else if (fg_Month == 4 || fg_Month == 6 || fg_Month == 9 || fg_Month == 11) {
//        if (fg_Day == 31) {
//            fg_Day = 1; fg_Month++;
//        }
//    } else if (fg_Month == 2) {
//        if ((fg_Year % 4 == 0 && fg_Year % 100 != 0) || (fg_Year % 100 == 0 && fg_Year % 400 == 0)) {
//            //是闰年，2月有29天
//            if (fg_Day == 30) {
//                fg_Month++;
//                fg_Day = 1;
//            }
//        } else {
//            //不是闰年，2月有28天
//            if (fg_Day == 29) {
//                fg_Month++;
//                fg_Day = 1;
//            }
//        }
//    }

//    // var today = new Date(bj_Year, bj_Month, bj_Day, bj_Hour, bj_Minute, bj_Second);


//    $("#bj_time").text(addZero(bj_Hour) + ":" + addZero(bj_Minute) + ":" + addZero(bj_Second) + "," + addZero(bj_Month) + "/" + addZero(bj_Day));
//    $("#fg_time").text(addZero(fg_Hour) + ":" + addZero(fg_Minute) + ":" + addZero(fg_Second) + "," + addZero(fg_Month) + "/" + addZero(fg_Day));

//    updatetime = setTimeout("UpdateDateTime()", 1000);
//    timerRunning = true;
//}

//function addZero(num, end) {
//    return num < 10 ? "0" + num : num;
//}

//$(document).ready(function () {
//    checkDateTime();
//    UpdateDateTime();
//});

//var timerRunning = false;
//function checkDateTime() {
//    if (timerRunning) {
//        clearTimeout(updatetime);
//        timerRunning = false;
//    }

//    var type = "GetBeiJingTime";
//    $.post(
//                    "../AjaxRequest.aspx",
//                    { Type: type },
//                    function (result) {
//                        $("#bj_time").text(result[0].Hour + ":" + result[0].Minute + ":" + result[0].Second + "," + result[0].Month + "/" + result[0].Day);
//                        $("#fg_time").text(result[1].Hour + ":" + result[1].Minute + ":" + result[1].Second + "," + result[1].Month + "/" + result[1].Day);
//                    },
//                    "json");


//    updatetime = setTimeout("checkDateTime()", 1000);
//    timerRunning = true;
//}

//$(document).ready(function () {
//    checkDateTime();
//});

//var timerRunning = false;
//function checkDateTime() {
//    if (timerRunning) {
//        clearTimeout(updatetime);
//        timerRunning = false;
//    }
//    for (var i = 1; i <= 2; i++) {
//        var today = new Date();
//        var month = today.getMonth() + 1;
//        var date = today.getDate();
//        if (i == 2) { //法国时间
//            if ((month > 3 || month == 3 && date > 24) && (month < 10 || month == 10 && date < 24)) //夏时制 -6小时
//                today = today.dateAdd("h", -6);
//            else
//                today = today.dateAdd("h", -7);
//        }
//        var year = today.getYear() + 00;
//        month = today.getMonth() + 1;
//        date = today.getDate();
//        var day = today.getDay();
//        var hour = today.getHours();
//        var minute = today.getMinutes();
//        var second = today.getSeconds();
//        var dateTime = addZero(hour) + ":" + addZero(minute) + ":" + addZero(second) + "," + addZero(month) + "/" + addZero(date);
//        if (i == 1) //北京时间
//            $("#bj_time").text(dateTime);
//        else//法国时间
//            $("#fg_time").text(dateTime);
//    }
//    updatetime = setTimeout("checkDateTime()", 1000);
//    timerRunning = true;
//}
//function addZero(num, end) {
//    return num < 10 ? "0" + num : num;
//}
//$(document).ready(function () {
//    checkDateTime();
//});
///* 得到日期年月日等加数字后的日期 */
//Date.prototype.dateAdd = function (interval, number) {
//    var d = this;
//    var k = { 'y': 'FullYear', 'q': 'Month', 'm': 'Month', 'w': 'Date', 'd': 'Date', 'h': 'Hours', 'n': 'Minutes', 's': 'Seconds', 'ms': 'MilliSeconds' };
//    var n = { 'q': 3, 'w': 7 };
//    eval('d.set' + k[interval] + '(d.get' + k[interval] + '()+' + ((n[interval] || 1) * number) + ')');
//    return d;
//} 