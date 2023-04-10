<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminCenter.Master" AutoEventWireup="true" CodeBehind="UpdateCustomerMsg.aspx.cs" Inherits="TestAccountSystem.CustomerPages.UpdateCustomerMsg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
        <ContentTemplate>
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="fa fa-home fa-fw home-icon"></i><a href="#">个人信息管理</a> </li>
                    <li class="active">信息更新</li>
                </ul>
            </div>
            <div class="form-group">
                <br />
                <br />
                <br />
                <div class="form-group">
                    <label class="col-xs-4 control-label text-right" for="txtParentName">*公司编码：</label>
                    <div class="col-xs-5" style="padding-left: 0px;">
                        <asp:TextBox ID="hiddenId" runat="server" Visible="false"></asp:TextBox>
                        <asp:TextBox ID="txtId" runat="server" class="form-control" placeholder="请输入公司编码"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-4 control-label text-right" for="txtParentName">*公司名称：</label>
                    <div class="col-xs-5" style="padding-left: 0px;">
                        <asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="请输入公司名称"></asp:TextBox>
                    </div>
                </div>
                <br />
                <div class="form-group">

                    <label class="col-xs-4 control-label text-right" for="txtParentName">*公司地址：</label>
                    <div class="col-xs-5" style="padding-left: 0px;">
                        <asp:TextBox ID="txtAddress" runat="server" class="form-control" placeholder="请输入公司地址"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <br />
                    <label class="col-xs-4 control-label text-right" for="txtParentName">*开户银行：</label>
                    <div class="col-xs-5" style="padding-left: 0px;">
                        <asp:TextBox ID="txtbank" runat="server" class="form-control" placeholder="请输入开户银行"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <br />
                    <label class="col-xs-4 control-label text-right" for="txtParentName">*银行账号：</label>
                    <div class="col-xs-5" style="padding-left: 0px;">
                        <asp:TextBox ID="txtBankAccount" runat="server" class="form-control" placeholder="请输入银行账号"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <br />
                    <label class="col-xs-4 control-label text-right" for="txtParentName">*公司法人：</label>
                    <div class="col-xs-5" style="padding-left: 0px;">
                        <asp:TextBox ID="txtPerson" runat="server" class="form-control" placeholder="请输入公司法人"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <br />
                    <label class="col-xs-4 control-label text-right" for="txtParentName">*联系电话：</label>
                    <div class="col-xs-5" style="padding-left: 0px;">
                        <asp:TextBox ID="txtPhone" runat="server" class="form-control" placeholder="请输入联系电话"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group" style="margin-bottom: 20px">
                    <div class="row no-margin">
                        <div class="col-md-12 text-center">
                            <div class="btn-group" style="margin-top: 20px">
                                <asp:Button ID="btnUpdate" class="btn btn-default btn-sm" runat="server" Text="修改" OnClick="btnUpdate_Click" />
                                <asp:Button ID="btnCertain" class="btn btn-default btn-sm" runat="server" Text="保存" OnClick="btnCertain_Click" />
                                <asp:Button ID="btnCancel" class="btn btn-default btn-sm" runat="server" Text="取消" OnClick="btnReset_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
