<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminCenter.Master" AutoEventWireup="true" CodeBehind="BusinessTypeManagementForm.aspx.cs" Inherits="TestAccountSystem.AdminPages.BusinessTypeManagementForm" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb">
            <li><i class="fa fa-home fa-fw home-icon"></i><a href="#">检验项目管理</a></li>
            <li>检验业务设置</li>
        </ul>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="row form-horizontal" style="margin-bottom: 5px;">
                            <div class="col-xs-2 text-right">
                                <label class="control-label" for="txtBusinessNumber">业务代码：</label>
                            </div>
                            <div class="col-xs-4" style="padding-left: 0px;">
                                <asp:TextBox ID="txtBusinessNumber" runat="server" class="form-control input-sm"></asp:TextBox>
                            </div>
                            <div class="col-xs-2 text-right">
                                <label class="control-label" for="txtBusinessName">业务名称：</label>
                            </div>
                            <div class="col-xs-4" style="padding-left: 0px;">
                                <asp:TextBox ID="txtBusinessName" runat="server" class="form-control input-sm"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row form-horizontal" style="margin-bottom: 5px;">
                            <div class="col-xs-2 text-right">
                                <label class="control-label" for="txtK1">K1：</label>
                            </div>
                            <div class="col-xs-4 text-left" style="padding-left: 0px;">
                                <asp:TextBox ID="txtK1" runat="server" class="form-control input-sm"></asp:TextBox>
                            </div>
                            <div class="col-xs-2 text-right">
                                <label class="control-label" for="txtC1">C1：</label>
                            </div>
                            <div class="col-xs-4 text-left" style="padding-left: 0px;">
                                <asp:TextBox ID="txtC1" runat="server" class="form-control input-sm"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row form-horizontal" style="margin-bottom: 5px;">
                            <div class="col-xs-2 text-right">
                                <label class="control-label" for="txtK2">K2：</label>
                            </div>
                            <div class="col-xs-4 text-left" style="padding-left: 0px;">
                                <asp:TextBox ID="txtK2" runat="server" class="form-control input-sm"></asp:TextBox>
                            </div>
                            <div class="col-xs-2 text-right">
                                <label class="control-label" for="txtC2">C2：</label>
                            </div>
                            <div class="col-xs-4 text-left" style="padding-left: 0px;">
                                <asp:TextBox ID="txtC2" runat="server" class="form-control input-sm"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row form-horizontal" style="margin-bottom: 5px;">
                            <div class="col-xs-2 text-right">
                                <label class="control-label" for="txtK3">K3：</label>
                            </div>
                            <div class="col-xs-4 text-left" style="padding-left: 0px;">
                                <asp:TextBox ID="txtK3" runat="server" class="form-control input-sm"></asp:TextBox>
                            </div>
                            <div class="col-xs-2 text-right">
                                <label class="control-label" for="txtC3">C3：</label>
                            </div>
                            <div class="col-xs-4 text-left" style="padding-left: 0px;">
                                <asp:TextBox ID="txtC3" runat="server" class="form-control input-sm"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row form-horizontal" style="margin-bottom: 5px;">
                            <div class="col-xs-2 text-right">
                                <label class="control-label" for="txtK4">K4：</label>
                            </div>
                            <div class="col-xs-4 text-left" style="padding-left: 0px;">
                                <asp:TextBox ID="txtK4" runat="server" class="form-control input-sm"></asp:TextBox>
                            </div>
                            <div class="col-xs-2 text-right">
                                <label class="control-label" for="txtC4">C4：</label>
                            </div>
                            <div class="col-xs-4 text-left" style="padding-left: 0px;">
                                <asp:TextBox ID="txtC4" runat="server" class="form-control input-sm"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row form-horizontal" style="margin-bottom: 5px;">
                            <div class="col-xs-2 text-right">
                                <label class="control-label" for="txtK5">K5：</label>
                            </div>
                            <div class="col-xs-4 text-left" style="padding-left: 0px;">
                                <asp:TextBox ID="txtK5" runat="server" class="form-control input-sm"></asp:TextBox>
                            </div>
                            <div class="col-xs-2 text-right">
                                <label class="control-label" for="txtC5">C5：</label>
                            </div>
                            <div class="col-xs-4 text-left" style="padding-left: 0px;">
                                <asp:TextBox ID="txtC5" runat="server" class="form-control input-sm"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row form-horizontal" style="margin-bottom: 5px;">
                            <div class="col-xs-2 text-right">
                                <label class="control-label" for="txtRemark">备注：</label>
                            </div>
                            <div class="col-xs-4 text-left" style="padding-left: 0px;">
                                <asp:TextBox ID="txtRemark" runat="server" class="form-control input-sm"></asp:TextBox>
                            </div>
                        </div>
                        <div class="space-4">
                        </div>
                        <div class="row no-margin">
                            <div class="col-xs-4 col-xs-offset-4 text-center">
                                <div class="btn-group">
                                    <asp:Button ID="btnAdd" runat="server" Text="添加" OnClick="btnAdd_Click" class="btn btn-default btn-sm" />
                                    <asp:Button ID="btnCertain" runat="server" Text="确定" OnClick="btnCertain_Click1" class="btn btn-default btn-sm" />
                                    <asp:Button ID="btnAddCancel" runat="server" Text="取消" OnClick="btnAddCancel_Click" class="btn btn-default btn-sm" />
                                    <asp:Button ID="btnUpdate" runat="server" Text="修改" OnClick="btnUpdate_Click" class="btn btn-default btn-sm" />
                                    <asp:Button ID="btnSave" runat="server" Text="保存" OnClick="btnSave_Click" class="btn btn-default btn-sm" />
                                    <asp:Button ID="btnUpdateCancel" runat="server" Text="取消" OnClick="btnUpdateCancel_Click" class="btn btn-default btn-sm" />
                                    <asp:Button ID="btnDel" runat="server" Text="删除" OnClick="btnDel_Click" OnClientClick="javascript:return confirm('是否删除该项？');" class="btn btn-default btn-sm" />
                                </div>
                            </div>
                        </div>
                        <div class="space-4">
                        </div>
                        <div class="row no-margin">
                            <asp:Literal ID="hiddenid" runat="server" Visible="false"></asp:Literal>
                            <asp:GridView ID="gdvBusiness" runat="server" AutoGenerateColumns="false" AllowSorting="true"
                                class="table table-bordered table-hover" OnRowCommand="GridViewDepart_RowCommand"
                                OnRowDataBound="GridViewDepart_RowDataBound" Width="100%"
                                OnSorting="grid_Sorting">
                                <RowStyle BackColor="#f9f9f9" HorizontalAlign="Center" VerticalAlign="Top" />
                                <AlternatingRowStyle BackColor="White" HorizontalAlign="Center" VerticalAlign="Top" />
                                <Columns>
                                    <asp:TemplateField HeaderText="序号" SortExpression="ID">
                                        <ItemTemplate>
                                            <asp:Button ID="btnDetail" CommandName="btnDetailCommand" CommandArgument='<%#Eval("ID") %>' runat="server" Text="详细信息" Style="display: none;" />
                                            <asp:Literal ID="LiteralIndex" runat="server" Text="<%# Container.DataItemIndex+1 +(AspNetPager1.CurrentPageIndex-1)*AspNetPager1.PageSize %>"></asp:Literal>
                                            <asp:Literal ID="LiteralId" runat="server" Text='<%#Eval("ID") %>' Visible="false"></asp:Literal>
                                            <asp:Literal ID="LiteralCode" runat="server" Text='<%#Eval("BusinessNumber") %>' Visible="false"></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="业务代码" SortExpression="BusinessNumber">
                                        <ItemTemplate>
                                            <%#Eval("BusinessNumber")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="业务名称" SortExpression="BusinessName">
                                        <ItemTemplate>
                                            <%#Eval("BusinessName")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="K1" SortExpression="K1">
                                        <ItemTemplate>
                                            <asp:Literal ID="LiteralK1" runat="server" Text='<%#Eval("K1")%>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="K2" SortExpression="K2">
                                        <ItemTemplate>
                                            <asp:Literal ID="LiteralK2" runat="server" Text='<%#Eval("K2")%>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="K3" SortExpression="K3">
                                        <ItemTemplate>
                                            <asp:Literal ID="LiteralK3" runat="server" Text='<%#Eval("K3")%>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="K4" SortExpression="K4">
                                        <ItemTemplate>
                                            <asp:Literal ID="LiteralK4" runat="server" Text='<%#Eval("K4")%>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="K5" SortExpression="K5">
                                        <ItemTemplate>
                                            <asp:Literal ID="LiteralK5" runat="server" Text='<%#Eval("K5")%>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="C1" SortExpression="C1">
                                        <ItemTemplate>
                                            <asp:Literal ID="LiteralC1" runat="server" Text='<%#Eval("C1")%>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="C2" SortExpression="C2">
                                        <ItemTemplate>
                                            <asp:Literal ID="LiteralC2" runat="server" Text='<%#Eval("C2")%>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="C3" SortExpression="C3">
                                        <ItemTemplate>
                                            <asp:Literal ID="LiteralC3" runat="server" Text='<%#Eval("C3")%>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="C4" SortExpression="C4">
                                        <ItemTemplate>
                                            <asp:Literal ID="LiteralC4" runat="server" Text='<%#Eval("C4")%>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="C5" SortExpression="C5">
                                        <ItemTemplate>
                                            <asp:Literal ID="LiteralC5" runat="server" Text='<%#Eval("C5")%>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="备注" SortExpression="Remark">
                                        <ItemTemplate>
                                            <%#Eval("Remark")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="row no-margin dataTables_wrapper_row">
                            <div class="col-xs-9 text-left">
                                <webdiyer:AspNetPager ID="AspNetPager1" runat="server" Width="100%" CssClass="pages"
                                    FirstPageText="首页" LastPageText="尾页" PrevPageText="上页" NextPageText="下页" CurrentPageButtonClass="cpb"
                                    AlwaysShow="true" ShowCustomInfoSection="Left" ShowPageIndexBox="always" PageIndexBoxType="DropDownList"
                                    CustomInfoHTML="第<font color='red'><b>%currentPageIndex%</b></font>页，共%PageCount%页，共<font color='red'><b>%RecordCount%</b></font>条记录"
                                    OnPageChanged="AspNetPager1_PageChanged" PageSize="10">
                                </webdiyer:AspNetPager>
                            </div>
                            <div class="col-xs-3 text-right">
                                每页显示记录数：
                                <asp:DropDownList ID="ddlpagesize" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlpagesize_SelectedIndexChanged">
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>50</asp:ListItem>
                                    <asp:ListItem>100</asp:ListItem>
                                    <asp:ListItem>200</asp:ListItem>
                                </asp:DropDownList>
                                条
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
