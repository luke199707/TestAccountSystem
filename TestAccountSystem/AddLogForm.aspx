<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminCenter.Master" AutoEventWireup="true" CodeBehind="AddLogForm.aspx.cs" Inherits="TestAccountSystem.AdminPages.AddLogForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
         function myfunction() {
             alert(666);
         }
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li>检验登记日志添加</li>
                </ul>
            </div>
            <br />
            <asp:Literal ID="hiddenIdEdit" runat="server" Visible="false"></asp:Literal>
            <div class="row form-horizontal" style="margin-bottom: 5px;">
                <div class="col-xs-3  text-right">
                    <label class="control-label" for="txtLogNumber">检验日志编号：</label>
                </div>
                <div class="col-xs-7" style="padding-left: 0px;">
                    <asp:TextBox ID="txtLogNumber" runat="server" class="form-control input-sm" ReadOnly="true"></asp:TextBox>
                </div>
            </div>
            <div class="row form-horizontal" style="margin-bottom: 5px;">
                <div class="col-xs-3 text-right">
                    <label class="control-label" for="txtRegisterNumber">检验订单编号：</label>
                </div>
                <div class="col-xs-7" style="padding-left: 0px;">
                    <asp:TextBox ID="txtRegisterNumber" runat="server" class="form-control input-sm" ReadOnly="true"></asp:TextBox>
                </div>
            </div>
            <div class="row form-horizontal" style="margin-bottom: 5px;">
                <div class="col-xs-3 text-right">
                    <label class="control-label" for="txtInspector">检验人：</label>
                </div>
                <div class="col-xs-7 text-left" style="padding-left: 0px;">
                    <asp:TextBox ID="txtInspector" runat="server" class="form-control input-sm" ReadOnly="true"></asp:TextBox>
                </div>
            </div>
            <div class="row form-horizontal" style="margin-bottom: 5px;">
                <div class="col-xs-3 text-right">
                    <label class="control-label" for="txtLocation">地点：</label>
                </div>
                <div class="col-xs-7" style="padding-left: 0px;">
                    <asp:TextBox ID="txtLocation" runat="server" class="form-control input-sm" TabIndex="2"></asp:TextBox>
                </div>
            </div>
            <div class="row form-horizontal" style="margin-bottom: 5px;">
                <div class="col-xs-3 text-right">
                    <label class="control-label" for="txtRemark">上传图片：</label>
                </div>
                <div class="col-xs-7" style="padding-left: 0px;">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
               <%--     <asp:TextBox ID="txtRemark" runat="server" class="form-control input-sm" TabIndex="2"></asp:TextBox>--%>
                </div>
            </div>
            <div class="row form-horizontal" style="margin-bottom: 5px;">
                <div class="col-xs-3 text-right">
                    <label class="control-label" for="txtInspectionContent">检验内容：</label>
                </div>
                <div class="col-xs-7 text-left" style="padding-left: 0px;">
                    <asp:TextBox ID="txtInspectionContent" runat="server" class="form-control input-sm" Rows="10" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row form-horizontal" style="margin-bottom: 5px;">
                <div class="col-xs-7 col-xs-offset-3">
                    <asp:Button ID="btnSave" runat="server" Text="保存" CssClass="btn btn-success btn-block btn-lg" OnClick="btnSave_Click" OnClientClick="myfunction();"/>

                </div>
            </div>
            <div class="row form-horizontal" style="margin-bottom: 5px;">
                <div class="col-xs-7 col-xs-offset-3">
                    <asp:Button ID="btnUpdate" runat="server" Text="保存" CssClass="btn btn-success btn-block btn-lg" OnClick="btnUpdate_Click" />
                </div>
                <div class="col-xs-7 col-xs-offset-3">
                    <asp:Button ID="btnReturn" runat="server" Text="返回" CssClass="btn btn-danger btn-block btn-lg" OnClick="btnReturn_Click" />
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
