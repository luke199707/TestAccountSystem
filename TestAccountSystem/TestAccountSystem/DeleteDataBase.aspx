<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminCenter.Master" AutoEventWireup="true" CodeBehind="DeleteDataBase.aspx.cs" Inherits="TestAccountSystem.DeleteDataBase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <asp:UpdatePanel runat="server" ID="UpdatePanel2">
        <ContentTemplate>
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="fa fa-home fa-fw home-icon"></i><a href="#">数据库维护</a> </li>
                    <li class="active">删除数据库</li>
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
             
              
                        <asp:Panel ID="PanelDelete" runat="server">
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
                                        请选择要删除的目标数据库：
                                    </label>
                                </div>
                                <div class="col-xs-4 text-left">
                                    <asp:DropDownList ID="ddlDeleteDataBase" runat="server" class="form-control" AutoPostBack="True"
                                        OnSelectedIndexChanged="ddlDeleteDataBase_SelectedIndexChanged">
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
                                    <asp:TextBox ID="txtDeleteName" runat="server" class="form-control input-sm" disabled></asp:TextBox>
                                </div>
                            </div>
                            <div class="row" style="margin-bottom: 10px;">
                                <div class="col-xs-4 text-right">
                                    <label class="control-label">
                                        备份创建时间：
                                    </label>
                                </div>
                                <div class="col-xs-4 text-left">
                                    <asp:TextBox ID="txtDeleteCreateTime" runat="server" class="form-control input-sm"
                                        disabled></asp:TextBox>
                                </div>
                            </div>
                            <div class="row" style="margin-bottom: 10px;">
                                <div class="col-xs-4 text-right">
                                    <asp:Button ID="btnDelete" runat="server" Text="删除备份" class="btn btn-primary btn-sm"
                                        OnClientClick="javascript:return confirm('你确定要删除该备份吗?');" OnClick="btnDelete_Click" />
                                </div>
                                <div class="col-xs-4 text-left">
                                    <asp:Label ID="LabelDeleteTip" runat="server" Text="" ForeColor="Red"></asp:Label>
                                </div>
                            </div>
                        </asp:Panel>
                        <!-- PAGE CONTENT ENDS -->
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
 

  
  
        

       
</asp:Content>
