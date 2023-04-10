<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminCenter.Master" AutoEventWireup="true" CodeBehind="ShowPayerDialog.aspx.cs" Inherits="TestAccountSystem.AdminPages.ShowPayerDialog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="fa fa-home fa-fw home-icon"></i><a href="#">主页</a> </li>

                </ul>
            </div>
            <div class="page-content">
                <div class="row no-margin form-horizontal">
                    <br />
                    <br />
                    <div class="form-group">
                        <label for="txtQuestion" class="col-xs-1 control-label" style="padding-right: 0px;">
                            登记单编号：</label>
                        <div class="col-xs-11">
                            <asp:TextBox ID="txtId" runat="server" class="form-control" Width="90%" Height="35px" Wrap="True" Style="overflow-y: visible" />
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="txtQuestion" class="col-xs-1 control-label" style="padding-right: 0px;">
                            船只登记编号：</label>
                        <div class="col-xs-11">
                            <asp:TextBox ID="txtShip" runat="server" class="form-control" Width="90%" Height="35px" Wrap="True" Style="overflow-y: visible" />
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="txtQuestion" class="col-xs-1 control-label" style="padding-right: 0px;">
                            申请单位：</label>
                        <div class="col-xs-11">
                            <asp:TextBox ID="txtCompany" runat="server" class="form-control" Width="90%" Height="35px" Wrap="True" Style="overflow-y: visible" />
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="txtMoney" class="col-xs-1 control-label" style="padding-right: 0px;">
                            缴费总金额：</label>
                        <div class="col-xs-11">
                            <asp:TextBox ID="txtMoney" runat="server" class="form-control" Width="90%" Height="35px" Wrap="True" Style="overflow-y: visible" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtQuestion" class="col-xs-1 control-label" style="padding-right: 0px;">
                            缴费人：</label>
                        <div class="col-xs-11">
                            <asp:TextBox ID="txtPayer" runat="server" class="form-control" Width="90%" Height="35px" Wrap="True" Style="overflow-y: visible" />
                        </div>
                    </div>
                     <div class="form-group" runat="server" id="divTime" visible="false">
                        <label for="txtTime" class="col-xs-1 control-label" style="padding-right: 0px;">
                            缴费日期：</label>
                        <div class="col-xs-11">
                            <asp:TextBox ID="txtTime" runat="server" class="form-control" Width="90%" Height="35px" Wrap="True" Style="overflow-y: visible" disabled/>
                        </div>
                    </div>
                    <div class="form-group" runat="server" id="divPeople" visible="false">
                        <label for="txtPeople" class="col-xs-1 control-label" style="padding-right: 0px;">
                            收费人：</label>
                        <div class="col-xs-11">
                            <asp:TextBox ID="txtPeople" runat="server" class="form-control" Width="90%" Height="35px" Wrap="True" Style="overflow-y: visible" disabled/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="内容" class="col-xs-1 control-label" style="padding-right: 0px;">
                            备注：</label>
                        <div class="col-xs-11">
                            <%--<div id="editor"></div>不知道怎么取值--%>
                            <asp:TextBox ID="txtRemark" PlaceHolder="请填写备注信息" class="form-control" runat="server" TextMode="MultiLine" Width="90%" Height="200px" Wrap="True" Style="overflow-y: visible"></asp:TextBox>
                            <%-- <CKEditor:CKEditorControl ID="ckEditor" BasePath="~/ckeditor/" FilebrowserImageUploadUrl="ckeditor/ImageUpload.ashx"  runat="server"></CKEditor:CKEditorControl>--%>
                        </div>
                    </div>
                </div>              
                <div class="row no-margin-left no-margin-right">
                    <div class="col-xs-12 text-center" style="margin-top: 20px;">
                        <div class="btn-group">
                            <asp:Button ID="btnSave" runat="server" Text="保 存" class="btn btn-primary" OnClick="btnSave_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
