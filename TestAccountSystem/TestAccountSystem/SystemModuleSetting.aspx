<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminCenter.Master" AutoEventWireup="true" CodeBehind="SystemModuleSetting.aspx.cs" Inherits="TestAccountSystem.SystemModuleSetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%--   <form id="form1" runat="server">
       <asp:ScriptManager runat="server" ID="ScriptManager1">
        </asp:ScriptManager>--%>
    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
        <ContentTemplate>
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="fa fa-home fa-fw home-icon"></i><a href="#">权限管理</a> </li>
                  <%--  <li class="active">权限管理 </li>--%>
                    <li class="active">系统模块设置</li>
                </ul>
            </div>
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="row">
                            <div class="col-xs-3 col-xs-offset-2">
                                <div class="panel panel-default" style="min-height: 400px;">
                                    <div class="panel-body">
                                        <asp:Panel ID="panelUser" runat="server" ScrollBars="Auto">
                                            <asp:TreeView ID="TreeView1" runat="server" ShowLines="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged" NodeWrap="True" ExpandDepth="1" EnableClientScript="false">
                                                <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" VerticalPadding="2px" />
                                                <NodeStyle NodeSpacing="0px" VerticalPadding="2px" />
                                            </asp:TreeView>
                                        </asp:Panel>
                                    </div>
                                    <asp:HiddenField ID="PanelScroll" runat="server" />
                                </div>
                            </div>

                            <div class="col-xs-5 form-horizontal">
                                <asp:TextBox ID="TextBox1" runat="server" Visible="false"></asp:TextBox>
                                <div class="row form-group">

                                    <asp:Label ID="Label1" class="col-xs-2 col-xs-offset-1 control-label" runat="server" Text="">上级名称:</asp:Label>

                                    <div class="col-xs-6" style="padding-left: 0px;">
                                        <asp:TextBox ID="TextBox2" runat="server" class="form-control input-sm"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <asp:Label ID="Label2" class="col-xs-2 col-xs-offset-1 control-label" runat="server" Text="">编码:</asp:Label>

                                    <div class="col-xs-6" style="padding-left: 0px;">
                                        <asp:TextBox ID="txtCode" runat="server" class="form-control input-sm"></asp:TextBox>
                                    </div>
                                </div>


                                <div class="row form-group">
                                    <asp:Label ID="Label3" runat="server" Text="" class="col-xs-2 col-xs-offset-1 control-label">名称:</asp:Label>
                                    <div class="col-xs-6" style="padding-left: 0px;">
                                        <asp:TextBox ID="txtname" runat="server" class="form-control input-sm"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <asp:Label ID="Label4" runat="server" Text="" class="col-xs-2 col-xs-offset-1 control-label">Url:</asp:Label>
                                    <div class="col-xs-6" style="padding-left: 0px;">
                                        <asp:TextBox ID="txturl" runat="server" class="form-control input-sm"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <asp:Label ID="Label5" runat="server" Text="" class="col-xs-2 col-xs-offset-1 control-label">Css:</asp:Label>
                                    <div class="col-xs-6" style="padding-left: 0px;">
                                        <asp:TextBox ID="txtcss" runat="server" class="form-control input-sm"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <asp:Label ID="Label6" runat="server" Text="" class="col-xs-2 col-xs-offset-1 control-label">Target:</asp:Label>
                                    <div class="col-xs-6" style="padding-left: 0px;">
                                        <asp:TextBox ID="txtTarget" runat="server" class="form-control input-sm"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <asp:Label ID="Label7" runat="server" Text="" class="col-xs-2 col-xs-offset-1 control-label">序号:</asp:Label>
                                    <div class="col-xs-6" style="padding-left: 0px;">
                                        <asp:TextBox ID="TextBox8" runat="server" class="form-control input-sm"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row" style="margin-bottom: 5px; margin-top: 5px;">
                                    <div class="col-xs-6 col-xs-offset-3 text-center">
                                        <div class="btn-group">
                                            <br />
                                            <asp:Button ID="btnAdd" runat="server" Text="添加" OnClick="btnAdd_Click" class="btn btn-default btn-sm" />
                                            <asp:Button ID="btnUpdate" runat="server" Text="修改" OnClick="btnUpdate_Click" class="btn btn-default btn-sm" />
                                            <asp:Button ID="btnDel" runat="server" Text="删除" OnClick="btnDel_Click" OnClientClick="return confirm('确定删除该节点？');" class="btn btn-default btn-sm" />
                                            <asp:Button ID="btnAddSubmit" runat="server" Text="确定" OnClick="btnAddSubmit_Click" class="btn btn-default btn-sm" />
                                            <asp:Button ID="btnAddCancel" runat="server" Text="取消" OnClick="btnAddCancel_Click" class="btn btn-default btn-sm" />
                                            <asp:Button ID="btnUpSubmit" runat="server" Text="保存" OnClick="btnUpSubmit_Click" class="btn btn-default btn-sm" />
                                            <asp:Button ID="btnUpCancel" runat="server" Text="取消" OnClick="btnUpCancel_Click" class="btn btn-default btn-sm" />
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <%--    </form>--%>
    <script type="text/javascript">
        //   onclick = "SetScrollTop(0,'panelUser','PanelScroll');"
        function SetScrollTop(type, panelId, hiddenId) {
            if (type.toString() == "0") {
                $("#" + hiddenId).val($("#" + panelId).scrollTop());
            }
            else {
                $("#" + panelId).scrollTop($("#" + hiddenId).val());
                $("#" + panelId).scrollTop($("#" + hiddenId).val());
            }
        }
        $(function () {
            s("#Button4").click(function () {
                alert(111);
            });

        });


    </script>
</asp:Content>
