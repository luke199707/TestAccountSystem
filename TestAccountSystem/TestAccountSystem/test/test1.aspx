<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test1.aspx.cs" Inherits="TestAccountSystem.test.test1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript">
        function checkform() {
            var strs = document.getElementById("FileUpload1").value;
            if (strs == "") {
                alert("请选择要上传的图片!");
                return false;
            }

            var n1 = strs.lastIndexOf('.') + 1;
            var fileExt = strs.substring(n1, n1 + 3).toLowerCase()
            if (fileExt != "jpeg" && fileExt != "png" && fileExt != "jpg") {
                alert('目前系统仅支持jpeg、jpg、png后缀的文件上传!');
                return false;
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <div>
            <asp:Button ID="Button1" runat="server" Text="Button" OnClientClick="checkform();" />
        </div>
    </form>
</body>
</html>
