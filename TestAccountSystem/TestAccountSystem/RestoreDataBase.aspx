<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminCenter.Master" AutoEventWireup="true" CodeBehind="RestoreDataBase.aspx.cs" Inherits="TestAccountSystem.RestoreDataBase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="PanelRestore" runat="server">

        <div class="breadcrumbs" id="breadcrumbs">
            <ul class="breadcrumb">
                <li><i class="fa fa-home fa-fw home-icon"></i><a href="#">数据库维护</a> </li>
                <li class="active">还原数据库</li>
            </ul>
        </div>
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
                        <div class="col-xs-4 text-right">
                            <label class="control-label">
                                请选择要还原的目标数据库：
                            </label>
                        </div>
                        <div class="col-xs-4 text-left">
                            <asp:DropDownList ID="ddlRestoreDataBase" runat="server" class="form-control" AutoPostBack="True"
                                OnSelectedIndexChanged="ddlRestoreDataBase_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-xs-4 text-right">
                            <label class="control-label">
                                备份数据库详细信息</label>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-xs-4 text-right">
                            <label class="control-label">
                                数据库名称：</label>
                        </div>
                        <div class="col-xs-4 text-left">
                            <asp:TextBox ID="txtRestoreName" runat="server" class="form-control input-sm" disabled></asp:TextBox>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-xs-4 text-right">
                            <label class="control-label">
                                备份创建时间：
                            </label>
                        </div>
                        <div class="col-xs-4 text-left">
                            <asp:TextBox ID="txtRestoreCreateTime" runat="server" class="form-control input-sm"
                                disabled></asp:TextBox>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-xs-4 text-right">
                            <asp:Button ID="btnRestore" runat="server" Text="开始还原" class="btn btn-primary btn-sm"
                                OnClientClick="return showModal();" OnClick="btnRestore_Click" />
                        </div>
                        <div class="col-xs-4 text-left">
                            <asp:Label ID="LabelRestoreTip" runat="server" Text="" ForeColor="Red"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog" style="width: 400px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="myModalLabel">正在还原数据库！</h4>
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
        function showModal() {
            if (confirm('你确定要还原数据库吗?')) {
                var ddlRestoreDataBase = document.getElementById("<%=ddlRestoreDataBase.ClientID%>");
                var selectedvalue = ddlRestoreDataBase.options[ddlRestoreDataBase.selectedIndex].text;
                if (selectedvalue == "请选择") {
                    alert('请选择要还原的数据库！');
                    return false;
                }
                $('#myModal').modal('show');
            } else {
                return false;
            }
        }
        function closeModal() {
            $('#myModal').modal('hide');
            alert('还原成功！');
        }

    </script>
</asp:Content>
