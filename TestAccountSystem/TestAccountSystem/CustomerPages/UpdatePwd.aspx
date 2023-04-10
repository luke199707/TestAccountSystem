<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminCenter.Master" AutoEventWireup="true" CodeBehind="UpdatePwd.aspx.cs" Inherits="TestAccountSystem.CustomerPages.UpdatePwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
        <ContentTemplate>
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="fa fa-home fa-fw home-icon"></i><a href="#">个人信息管理</a> </li>
                    <li class="active">修改密码</li>
                </ul>
            </div>
            <%--<div class="page-content" style="padding: 20px 20px 24px">
                <div class="row">
                    <div class="form-group ">--%>

            <div class="form-group">
                <br />
                <br />
                <br />
                <label class="col-xs-4 control-label text-right" for="txtParentName">旧密码：</label>
                <div class="col-xs-5" style="padding-left: 0px;">
                    <asp:TextBox ID="txtOldPwd" TextMode="Password" runat="server" class="form-control" placeholder="请输入旧密码"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="col-xs-4 control-label text-right" for="txtParentName">新密码：</label>
                    <div class="col-xs-5" style="padding-left: 0px;">
                        <asp:TextBox ID="txtNewPwd1" TextMode="Password" runat="server" class="form-control" placeholder="请输入新密码"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-4 control-label text-right" for="txtParentName">确认密码：</label>
                    <div class="col-xs-5" style="padding-left: 0px;">
                        <asp:TextBox ID="txtNewPwd2" TextMode="Password" runat="server" class="form-control" placeholder="再次输入新密码"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group" style="margin-bottom: 20px">
                    <div class="row no-margin">
                        <div class="col-md-12 text-center">
                            <div class="btn-group" style="margin-top: 20px">
                                <asp:Button ID="btnUpdate" class="btn btn-default btn-sm" runat="server" Text="修改" OnClick="btnUpdate_Click" />
                                <asp:Button ID="btnReset" class="btn btn-default btn-sm" runat="server" Text="清空" OnClick="btnReset_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
