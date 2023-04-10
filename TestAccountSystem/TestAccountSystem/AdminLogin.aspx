<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="TestAccountSystem.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="Keywords" content="船级社检验计费管理系统" />
    <meta name="description" content="船级社检验计费管理系统" />
    <meta name="author" content="" />
    <title>船级社检验计费管理系统 </title>
    <link href="StyleSheet/AdminloginResource/css/main.css" rel="stylesheet" type="text/css" />
    <script src="StyleSheet/AdminloginResource/js/jQuery.js" type="text/javascript"></script>
    <script src="StyleSheet/AdminloginResource/js/fun.base.js" type="text/javascript"></script>
    <script src="StyleSheet/AdminloginResource/js/script.js" type="text/javascript"></script>
    <link href="StyleSheet/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="StyleSheet/UserTheme.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/WebForms/jquery.min.js"></script>

</head>
<body style="background: url(StyleSheet/AdminloginResource/images/pbgpic1.png) top center no-repeat; background-size: cover; #fff;">
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <%--登录div开始 --%>
                    <div class="login" id="loginDiv">
                        <div class="box png" style="background: url(StyleSheet/AdminloginResource/images/login.png) center top no-repeat;">
                            <div class="logo png">
                            </div>
                            <div class="input">
                                <div class="log form-horizontal">
                                    <div class="form-group" style="margin-bottom: 5px; margin-top: 5px;">
                                        <label runat="server" class="control-label col-xs-4 col-xs-offset-1 no-padding-left no-padding-right" for="txtName">账户：</label>
                                        <div class="col-xs-7 no-padding-left no-padding-right">
                                            <asp:TextBox runat="server" class="form-control input-xs" ID="txtName" placeholder="请输入账户"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group" style="margin-bottom: 5px; margin-top: 5px;">
                                        <label runat="server" class="control-label col-xs-4 col-xs-offset-1 no-padding-left no-padding-right" for="txtPwd">密码：</label>
                                        <div class="col-xs-7 no-padding-left no-padding-right">
                                            <asp:TextBox runat="server" TextMode="Password" class="form-control input-xs" ID="txtPwd" placeholder="请输入密码"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group" style="margin-bottom: 5px; margin-top: 5px;">
                                        <label runat="server" class="control-label col-xs-4 col-xs-offset-1 no-padding-left no-padding-right" for="txtCode">验证码：</label>
                                        <div class="col-xs-4   no-padding-left no-padding-right">
                                            <asp:TextBox runat="server" class="form-control input-xs" ID="txtCode" placeholder="请输入验证码"></asp:TextBox>
                                        </div>
                                        <div class="col-xs-3 ">
                                            <img src="CodeValidate.aspx" alt="验证码" height="30" style="cursor: pointer;" title="看不清可单击图片刷新" onclick="this.src='CodeValidate.aspx?id='+Math.random();" runat="server" id="CodeImage" />
                                        </div>
                                    </div>
                                    <div class="form-group" style="margin-bottom: 5px; margin-top: 2px; margin-left: 90px">
                                        <%--<div class="col-xs-9 text-left">--%>
                                        <asp:Label ID="message" runat="server" ForeColor="#FF3300" Text=" "></asp:Label>
                                        <%--</div>--%>
                                    </div>
                                    <div class="form-group" style="margin-bottom: 15px; margin-left: 90px; margin-top: 10px">
                                        <asp:Button ID="btnLogin" runat="server" class="btn btn-default btn-sm" OnClick="btnLogin_Click" Text=" 登 录 " Width="70" />
                                        <asp:Button ID="btnReset" runat="server" class="btn btn-default btn-sm" OnClick="btnReset_Click1" Text=" 重 置 " Width="70" />
                                        <input type="button" name="name" class="btn btn-default btn-sm" value="注 册" style="width: 70px" onclick="tiaozhuan()" />
                                    </div>
                                    <span style="color: blue; margin-left: 290px"><a href="javascript:void(0)" onclick="forgetPwd()">?忘记密码</a></span>
                                </div>
                            </div>
                        </div>
                        <div class="footer">
                        </div>
                    </div>
                    <%--登录div结尾 --%>

                    <%-- 注册div开始--%>
                    <div class="login" style="display: none" id="registerDiv">
                        <div class="box png" style="background: url(StyleSheet/AdminloginResource/images/login.png) center top no-repeat;">
                            <div class="logo png">
                            </div>
                            <div class="input">
                                <div class="log form-horizontal">
                                    <div class="form-group" style="margin-bottom: 5px; margin-top: 5px;">
                                        <label runat="server" class="control-label col-xs-4 col-xs-offset-1 no-padding-left no-padding-right" for="txtName">账户：</label>
                                        <div class="col-xs-7 no-padding-left no-padding-right">
                                            <asp:TextBox runat="server" class="form-control input-xs" ID="TextBox1" placeholder="请输入账户"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group" style="margin-bottom: 5px; margin-top: 5px;">
                                        <label runat="server" class="control-label col-xs-4 col-xs-offset-1 no-padding-left no-padding-right" for="txtPwd">密码：</label>
                                        <div class="col-xs-7 no-padding-left no-padding-right">
                                            <asp:TextBox runat="server" TextMode="Password" class="form-control input-xs" ID="TextBox2" placeholder="请输入密码"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group" style="margin-bottom: 5px; margin-top: 5px;">
                                        <label runat="server" class="control-label col-xs-4 col-xs-offset-1 no-padding-left no-padding-right" for="txtPwd">确认密码：</label>
                                        <div class="col-xs-7 no-padding-left no-padding-right">
                                            <asp:TextBox runat="server" TextMode="Password" class="form-control input-xs" ID="TextBox6" placeholder="请再次输入密码"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group" style="margin-bottom: 5px; margin-top: 5px;">
                                        <label runat="server" class="control-label col-xs-4 col-xs-offset-1 no-padding-left no-padding-right" for="txtName">邮箱：</label>
                                        <div class="col-xs-7 no-padding-left no-padding-right">
                                            <asp:TextBox runat="server" class="form-control input-xs" ID="TextBox3" placeholder="请输入邮箱"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group" style="margin-bottom: 5px; margin-top: 5px;">
                                        <div class="col-xs-3 text-right">
                                        </div>
                                        <div class="col-xs-9 text-left">
                                            <asp:Label ID="Label1" runat="server" ForeColor="#FF3300" Text=" "></asp:Label>
                                        </div>
                                    </div>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <span style="color: red; margin-left: 20px" id="span1"></span>
                                    <div class="form-group" style="margin-bottom: 15px; margin-left: 90px">

                                        <input type="button" name="name" value="注 册" onclick="register()" class="btn btn-default btn-sm" />
                                        <input type="button" name="name" value="取 消" class="btn btn-default btn-sm" onclick="cancel()" />
                                    </div>

                                </div>
                            </div>
                            <div class="footer">
                            </div>
                        </div>
                    </div>
                    <%-- 注册div结尾--%>

                    <%-- 找回密码div开始--%>
                    <div class="login" id="forgetDiv" style="display: none">
                        <div class="box png" style="background: url(StyleSheet/AdminloginResource/images/login.png) center top no-repeat;">
                            <div class="logo png">
                            </div>
                            <div class="input">
                                <div class="log form-horizontal">
                                    <div class="form-group" style="margin-bottom: 5px; margin-top: 5px;">
                                        <label runat="server" class="control-label col-xs-4 col-xs-offset-1 no-padding-left no-padding-right" for="txtName">邮箱：</label>
                                        <div class="col-xs-7 no-padding-left no-padding-right">
                                            <asp:TextBox runat="server" class="form-control input-xs" ID="TextBox5" placeholder="请输入邮箱"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group" style="margin-bottom: 5px; margin-top: 2px; margin-left: 90px">
                                        <%--<div class="col-xs-9 text-left">--%>
                                        <asp:Label ID="Label2" runat="server" ForeColor="#FF3300" Text=" "></asp:Label>
                                        <%--</div>--%>
                                    </div>
                                    <div class="form-group" style="margin-bottom: 15px; margin-left: 90px; margin-top: 10px">

                                        <input type="button" name="name" class="btn btn-default btn-sm" value="重置密码" style="width: 70px" onclick="forget()" />
                                        <input type="button" name="name" class="btn btn-default btn-sm" value="返回登录" style="width: 70px" onclick="forgetFanhui()" />
                                    </div>
                                    <span style="color: red; font-size: larger; margin-left: 90px" id="forgetSpan">注意：请到邮箱查看重置密码！</span>
                                </div>
                            </div>
                        </div>
                        <div class="footer">
                        </div>
                    </div>
                    <%-- 找回密码div结尾--%>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
<script type="text/javascript">
    function forgetFanhui() {
        $("#forgetSpan").text("注意：请到邮箱查看重置密码！");
        $("#TextBox5").val("");
        $("#TextBox4").val("");
        $("#forgetDiv").hide();
        $("#loginDiv").show();
    }
    function forgetPwd() {
        $("#loginDiv").hide();
        $("#forgetDiv").show();
    }
    function txtClear() {
        $("#TextBox1").val("");
        $("#TextBox2").val("");
        $("#TextBox3").val("");
        $("#TextBox6").val("");
    }
    function tiaozhuan() {
        //   alert(111);
        $("#loginDiv").hide();
        $("#registerDiv").show();
    }
    function cancel() {
        $("#span1").text("");
        $("#registerDiv").hide();
        $("#loginDiv").show();
    }
    function register() {
        var name = $("#TextBox1").val();
        var pwd = $("#TextBox2").val();
        var email = $("#TextBox3").val();
        var pwd2 = $("#TextBox6").val();
        if (pwd != pwd2) {
            $("#TextBox6").val("");
            $("#span1").text("两次密码不一致！");
            return;
        }
        $.post("handler/register.ashx", { "name": name, "pwd": pwd, "email": email }, function (data) {
            // alert(data);
            if (data == "ok") {
                txtClear();
                cancel();
                alert('注册成功,请前往邮箱验证！');
            }
            else if (data == "nono") {
                txtClear();
                //alert('文本框不能为空！');
                $("#span1").text("文本框不能为空！");
            }
            else if (data == "exists") {
                txtClear();
                // alert('用户名重复,注册失败！');
                $("#span1").text("用户名重复,注册失败！");
            }
            else if (data =="existsEmail") {
                $("#span1").text("邮箱重复,注册失败！");
            }
            else {
                txtClear();
                // alert('注册失败！');
                $("#span1").text("注册失败！");
            }
        });
    }
    //忘记密码
    function forget() {
       // var username = $("#TextBox4").val();
        var email = $("#TextBox5").val();
        if (email == "") {
            $("#forgetSpan").text("email不能为空，请输入！");
            return;
        }
        $.post("handler/forgetPwd.ashx", {  "email": email }, function (data) {
           // alert(data);
            if (data == "no") {
                $("#forgetSpan").text("密码重置失败！");
                $("#TextBox5").val("");
              //  $("#TextBox4").val("");
            } else {
                $("#forgetSpan").text("重置密码成功，已发送至您的邮箱！");
            }
        });
    }
</script>
</html>
