<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminCenter.Master" AutoEventWireup="true" CodeBehind="ShowOpinionDialog.aspx.cs" Inherits="TestAccountSystem.AdminPages.ShowOpinionDialog" %>

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
                            申请单位：</label>
                        <div class="col-xs-11">
                            <asp:TextBox ID="txtCompany" runat="server" class="form-control" Width="90%" Height="35px" Wrap="True" Style="overflow-y: visible" />
                        </div>
                    </div>
                    <div class="form-group" runat="server" id="divSurveyor" visible="false">
                        <label for="txtQuestion" class="col-xs-1 control-label" style="padding-right: 0px;">
                            审核人：</label>
                        <div class="col-xs-11">
                            <asp:TextBox ID="txtSurveyor" runat="server" class="form-control" Width="90%" Height="35px" Wrap="True" Style="overflow-y: visible" disabled />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="内容" class="col-xs-1 control-label" style="padding-right: 0px;">
                            审核意见：</label>
                        <div class="col-xs-11">
                            <%--<div id="editor"></div>不知道怎么取值--%>
                            <asp:TextBox ID="txtReason" PlaceHolder="请填写审核不通过的原因" class="form-control" runat="server" TextMode="MultiLine" Width="90%" Height="200px" Wrap="True" Style="overflow-y: visible"></asp:TextBox>
                            <%-- <CKEditor:CKEditorControl ID="ckEditor" BasePath="~/ckeditor/" FilebrowserImageUploadUrl="ckeditor/ImageUpload.ashx"  runat="server"></CKEditor:CKEditorControl>--%>
                        </div>
                    </div>
                </div>
                <%--   <div class="space-4">
                </div>
                          <div class="row no-margin-left no-margin-right">
                    <div class="col-xs-12 form-horizontal">
                        <div class="form-group">
                            <div class="col-xs-12 no-padding-left no-padding-right">
                                <asp:Label ID="Label1" runat="server" Text="检验进度信息" CssClass="label label-primary label-lg"></asp:Label>
                    
                        
                            </div>
                        </div>
                    </div>
                </div>--%>
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
