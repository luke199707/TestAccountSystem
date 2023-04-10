<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Top.aspx.cs" Inherits="TestAccountSystem.AdminLayout.Top" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="author" content="ChenZhen" />
    <title></title>
    <link href="../StyleSheet/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="../StyleSheet/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet"  type="text/css" />
    <link href="../StyleSheet/AdminTheme.css" rel="stylesheet" type="text/css" />
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
        <script src="Scripts/html5shiv/3.7.0/html5shiv.min.js"></script>
        <script src="Scripts/respond.min.js"></script>
    <![endif]-->
    <script src="../Scripts/jquery-1.11.2.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="navbar navbar-default" id="navbar" style="background-color:#579EC8">
        <div class="navbar-container no-padding-left no-padding-right" id="navbar-container">
            <div class="navbar-header pull-left" style="height: 45px">
                <a class="navbar-brand"><i class=" " style="font-style: normal;"> 船级社检验计费管理系统 </i> </a>
            </div>
            <div class="navbar-header pull-right">
                <ul class="nav ace-nav">
                    <li class="light-blue"><a href="#"><span><i class="fa fa-user fa-fw "></i>欢迎您, <%=adminUser %> </span>
                    </a></li>
                    <li class="light-blue"><a href="#"><span><i class="fa fa-calendar fa-fw"></i>&nbsp;<label id="lbSystemTime" runat="server"></label></span></a></li>
                    <li class="light-blue">
                        <asp:LinkButton ID="lbLogout" runat="server" OnClick="lbLogout_Click"><span><i class="fa fa-power-off fa-fw "></i> 退出</span></asp:LinkButton>&nbsp;&nbsp;
                    </li>
                </ul>
            </div>
        </div>
    </div>
    </form>
</body>
</html>

