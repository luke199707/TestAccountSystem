<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminCenter.Master"
    AutoEventWireup="true" CodeBehind="BackUpDataBase.aspx.cs" Inherits="TestAccountSystem.BackUpDataBase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel2">
        <ContentTemplate>
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="fa fa-home fa-fw home-icon"></i><a href="#">数据库维护</a> </li>
                    <li class="active">备份数据库</li>
                </ul>
            </div>
            <!-- .breadcrumb -->
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-12 text-center">
                                <h4>
                                    <strong>
                                        <asp:Literal ID="LiteralTop" runat="server"></asp:Literal></strong>
                                </h4>
                            </div>
                        </div>
                        <asp:Panel ID="PanelBackUp" runat="server">
                            <div class="row" style="margin-bottom: 10px;">
                                <div class="col-xs-12 text-left">
                                    <label class="control-label">
                                        1、备份数据库的名称是按照当时备份的时间来进行命名的；
                                    </label>
                                </div>
                            </div>
                            <div class="row" style="margin-bottom: 10px;">
                                <div class="col-xs-12 text-left">
                                    <label class="control-label">
                                        2、对于不同时间的数据库应当按时进行删除操作，避免无用的数据库占用机器空间；
                                    </label>
                                </div>
                            </div>
                            <div class="row" style="margin-bottom: 10px;">
                                <div class="col-xs-2 text-right">
                                    <label class="control-label">
                                        备份数据库名称：
                                    </label>
                                </div>
                                <div class="col-xs-4 text-left">
                                    <asp:TextBox ID="txtBackUpName" runat="server" class="form-control input-sm" disabled></asp:TextBox>
                                </div>
                                <div class="col-xs-4 text-left">
                                    <asp:Button ID="btnCreateName" runat="server" class="btn btn-primary btn-sm" Text="生成备份数据库名称"
                                        OnClick="btnCreateName_Click" />
                                </div>
                            </div>
                            <div class="row" style="margin-bottom: 10px;">
                                <div class="col-xs-6 text-left">
                                </div>
                                <div class="col-xs-4 text-left">
                                    <asp:Button ID="btnBackUp" runat="server" Text="开始备份" class="btn btn-primary btn-sm"
                                        OnClientClick=" return showbackupdialog()" OnClick="btnBackUp_Click" />
                                </div>
                                <div class="col-xs-4 text-left">
                                </div>
                            </div>
                        </asp:Panel>
                        <!-- PAGE CONTENT ENDS -->
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-2 text-right">
                                <label class="control-label">
                                    现有备份数据库信息：
                                </label>
                            </div>
                            <div class="col-xs-4 text-left">
                                <asp:DropDownList ID="ddlDeleteDataBase" runat="server" class="form-control" AutoPostBack="True"
                                    OnSelectedIndexChanged="ddlDeleteDataBase_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-2 text-right">
                                <label class="control-label">
                                    备份数据库详细信息</label>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-2 text-right">
                                <label class="control-label">
                                    数据库名称：</label>
                            </div>
                            <div class="col-xs-4 text-left">
                                <asp:TextBox ID="txtDeleteName" runat="server" class="form-control input-sm" disabled></asp:TextBox>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-2 text-right">
                                <label class="control-label">
                                    备份创建时间：
                                </label>
                            </div>
                            <div class="col-xs-4 text-left">
                                <asp:TextBox ID="txtDeleteCreateTime" runat="server" class="form-control input-sm"
                                    disabled></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="modal fade" id="backupdialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog" style="width: 400px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="H1">
                        正在备份数据库！</h4>
                </div>
                <div class="modal-body">
                    <center>
                        <img src="../images/ajax-loader.gif" alt="" />
                    </center>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <script type="text/javascript">
        function showbackupdialog() {
            if (confirm('你确定要备份当前数据库吗?')) {
                var backupname = document.getElementById("<%=txtBackUpName.ClientID %>").value;
                if (backupname == "") {
                    alert('请先生成备份数据库名称！');
                    return false;
                }
                $('#backupdialog').modal('show');
            } else {
                return false;
            }
        }
        function closebackupdialog() {
            $('#backupdialog').modal('hide');
            alert('备份成功！');
        }
    </script>
</asp:Content>
