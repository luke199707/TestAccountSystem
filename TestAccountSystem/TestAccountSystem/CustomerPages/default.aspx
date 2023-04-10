<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="TestAccountSystem.CustomerPages._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>默认页面</title>
    <link rel="stylesheet" type="text/css" href="css/css.css" />
    <script src="../Scripts/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center; padding-top: 50px">
            <span style="font-family: 'Microsoft YaHei'; font-size: xx-large; color: red;">尊敬的客户，请您完善公司信息</span>
        </div>
        <%--    <div>
            客户信息更新页面
        </div>--%>
        <div id="pageAll">
            <div class="page ">
                <!-- 修改密码页面样式 -->
                <div class="bacen">
                    <input type="hidden" name="hiddenpwd" value="<%=model.pwd %>" />
                    <input type="hidden" name="hiddenEmail" value="<%=model.email %>" />
                    <div class="bbD">
                        *公司代码：<input type="text" class="input3"
                            onblur="checkpwd1()" id="txtId" name="txtId" value="" disabled="disabled" />
                        <img class="imga"
                            src="img/ok.png" /><img class="imgb" src="img/no.png" />
                    </div>
                    <div class="bbD">
                        *公司名称：<input type="text" class="input3"
                            onblur="checkpwd2()" id="txtName" name="txtName" value="" disabled="disabled" />
                    </div>
                    <div class="bbD">
                        *公司地址：<input type="text" class="input3" onblur="checkpwd3()"
                            id="txtAddress" name="txtAddress" value="" disabled="disabled" />
                        <img class="imga" src="img/ok.png" /><img
                            class="imgb" src="img/no.png" />
                    </div>
                    <div class="bbD">
                        *开户银行：<input type="text" class="input3" onblur="checkpwd3()"
                            id="txtBank" name="txtBank" value="" disabled="disabled" />
                    </div>
                    <div class="bbD">
                        *银行账号：<input type="text" class="input3" onblur="checkpwd3()"
                            id="txtBankAccount" name="txtBankAccount" value="" disabled="disabled" />
                        <img class="imga" src="img/ok.png" /><img
                            class="imgb" src="img/no.png" />
                    </div>
                    <div class="bbD">
                        *公司法人：<input type="text" class="input3" onblur="checkpwd3()"
                            id="txtPerson" name="txtPerson" value="" disabled="disabled" />
                    </div>
                    <div class="bbD">
                        *联系电话：<input type="text" class="input3" onblur="checkpwd3()"
                            id="txtPhone" name="txtPhone" value="" disabled="disabled" />
                    </div>
                    <div class="bbD" id="bbd1" style="display: none">
                        <span style="color: red"><%=strMsg %></span>
                        <p class="bbDP">
                            <input type="submit" name="name" value="保存" style="width: 50px; height: 30px" />
                            <a style="width: 50px; height: 30px" href="javascript:void(0)" onclick="txtUnAble()">取消</a><%--<a href="../AdminLogin.aspx">../AdminLogin.aspx</a>--%>
                        </p>
                    </div>
                    <div class="bbD" id="bbd2">
                        <span style="color: red"><%=strMsg %></span>
                        <p class="bbDP">
                            <input type="button" name="name" value="添加" style="width: 50px; height: 30px" onclick="xiugai()" />
                        </p>
                    </div>
                </div>
                <!-- 修改密码页面样式end -->
            </div>
        </div>
    </form>
</body>
<script type="text/javascript">
    function cancel() {
        parent.location.assign('../AdminLogin.aspx');
    }
    function xiugai() {
        $("#bbd2").hide();
        $("#bbd1").show();
        txtAble();
    }
    function txtAble() {
        $("#txtId").removeAttr("disabled", "disabled");
        $("#txtName").removeAttr("disabled", "disabled");
        $("#txtAddress").removeAttr("disabled", "disabled");
        $("#txtBank").removeAttr("disabled", "disabled");
        $("#txtBankAccount").removeAttr("disabled", "disabled");
        $("#txtPerson").removeAttr("disabled", "disabled");
        $("#txtPhone").removeAttr("disabled", "disabled");
    }
    function txtUnAble() {
        $("#bbd2").show();
        $("#bbd1").hide();
        $("#txtId").attr("disabled", "disabled");
        $("#txtName").attr("disabled", "disabled");
        $("#txtAddress").attr("disabled", "disabled");
        $("#txtBank").attr("disabled", "disabled");
        $("#txtBankAccount").attr("disabled", "disabled");
        $("#txtPerson").attr("disabled", "disabled");
        $("#txtPhone").attr("disabled", "disabled");
    }
</script>
</html>
