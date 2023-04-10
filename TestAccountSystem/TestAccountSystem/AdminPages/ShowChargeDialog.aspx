<%@  Language="C#" MasterPageFile="~/AdminPages/AdminCenter.Master" AutoEventWireup="true" CodeBehind="ShowChargeDialog.aspx.cs" Inherits="TestAccountSystem.AdminPages.ShowChargeDialog" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="fa fa-home fa-fw home-icon"></i><a href="#">主页</a> </li>
                    <li class="active">
                        <label id="lbRoleName" runat="server">检验项目详细内容</label>
                    </li>
                </ul>
            </div>

            <div class="page-content">

                <div class="space-4">
                </div>
                <div class="row no-margin-left no-margin-right">
                    <div class="col-xs-12 form-horizontal">
                        <div class="form-group">
                            <div class="col-xs-12 no-padding-left no-padding-right">
                               <%-- <asp:Label ID="Label1" runat="server" Text="检验登记单编号:" CssClass="label label-primary label-lg"></asp:Label>--%>
                               <span class="label label-primary label-lg">检验登记单编号: <%=_registerNum %></span>
                                <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false" AllowSorting="true"
                                    class="table table-bordered table-hover" Width="100%" OnSorting="grid_Sorting" OnDataBound="grid_DataBound" ShowHeaderWhenEmpty="True">
                                    <RowStyle BackColor="#f9f9f9" HorizontalAlign="Center" VerticalAlign="Top" />
                                    <AlternatingRowStyle BackColor="White" HorizontalAlign="Center" VerticalAlign="Top" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" SortExpression="ID">
                                            <ItemTemplate>
                                                <asp:Button ID="btnDetail" CommandName="btnDetailCommand" CommandArgument='<%#Eval("ID") %>' runat="server" Text="详细信息" Style="display: none;" />
                                                <asp:Literal ID="LiteralIndex" runat="server" Text="<%# Container.DataItemIndex+1 +(AspNetPager2.CurrentPageIndex-1)*AspNetPager2.PageSize %>"></asp:Literal>
                                                <asp:Literal ID="LiteralId" runat="server" Text='<%#Eval("ID") %>' Visible="false"></asp:Literal>
                                                <asp:Literal ID="LiteralCode" runat="server" Text='<%#Eval("RegisterNumber") %>' Visible="false"></asp:Literal>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                       <%-- <asp:TemplateField HeaderText="检验登记单编号" SortExpression="RegisterNumber">
                                            <ItemTemplate>
                                                <asp:Literal ID="LiteralRegisterNumber" runat="server" Text='<%#Eval("RegisterNumber")%>'></asp:Literal>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="检验项目名称" SortExpression="ProjectName">
                                            <ItemTemplate>
                                                <asp:Literal ID="LiteralProjectName" runat="server" Text='<%#Eval("ProjectName")%>'></asp:Literal>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="检验项目代码" SortExpression="ProjectNumber">
                                            <ItemTemplate>
                                                <asp:Literal ID="LiteralProjectNumber" runat="server" Text='<%#Eval("ProjectNumber")%>'></asp:Literal>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="业务名称" SortExpression="BusinessName">
                                            <ItemTemplate>
                                                <asp:Literal ID="LiteralBusinessName" runat="server" Text='<%#Eval("BusinessName")%>'></asp:Literal>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="业务代码" SortExpression="BusinessNumber">
                                            <ItemTemplate>
                                                <asp:Literal ID="LiteralBusinessNumber" runat="server" Text='<%#Eval("BusinessNumber")%>'></asp:Literal>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField HeaderText="计费单位" SortExpression="BillingUnit">
                                            <ItemTemplate>
                                                <asp:Literal ID="LiteralBillingUnit" runat="server" Text='<%#Eval("BillingUnit")%>'></asp:Literal>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="单位价格" SortExpression="BillingPrice">
                                            <ItemTemplate>
                                                <asp:Literal ID="LiteralBillingPrice" runat="server" Text='<%#Eval("BillingPrice")%>'></asp:Literal>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="数量" SortExpression="Quantity">
                                            <ItemTemplate>
                                                <asp:Literal ID="LiteralQuantity" runat="server" Text='<%#Eval("Quantity")%>'></asp:Literal>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="金额" SortExpression="Amount">
                                            <ItemTemplate>
                                                <asp:Literal ID="LiteralAmount" runat="server"></asp:Literal>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="申请人" SortExpression="Remark">
                                            <ItemTemplate>
                                                <%#Eval("Remark")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--         <asp:TemplateField HeaderText="操作" SortExpression="">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnDetail" runat="server" CommandName="btnDetail" CommandArgument='<%#Eval("RegisterNumber") %>'>详细内容</asp:LinkButton>
                                                <asp:Button ID="btnExportOnly" Visible="false" class="btn btn-success btn-xs" runat="server" CommandArgument='<%#Eval("RegisterNumber") %>' Text="导出" OnClick="btnExportOnly_Click" />
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                    </Columns>
                                </asp:GridView>
                                <div class="row no-margin dataTables_wrapper_row">
                                    <div class="col-xs-9 text-left">
                                        <webdiyer:AspNetPager ID="AspNetPager2" runat="server" Width="100%" CssClass="pages"
                                            FirstPageText="首页" LastPageText="尾页" PrevPageText="上页" NextPageText="下页" CurrentPageButtonClass="cpb"
                                            AlwaysShow="true" ShowCustomInfoSection="Left" ShowPageIndexBox="always" PageIndexBoxType="DropDownList"
                                            CustomInfoHTML="第<font color='red'><b>%currentPageIndex%</b></font>页，共%PageCount%页，共<font color='red'><b>%RecordCount%</b></font>条记录"
                                            OnPageChanged="AspNetPager2_PageChanged" PageSize="5">
                                        </webdiyer:AspNetPager>
                                    </div>
                                    <div class="col-xs-3 text-right">
                                        每页显示记录数：
                                <asp:DropDownList ID="ddlpagesize2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlpagesize2_SelectedIndexChanged">
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>50</asp:ListItem>
                                    <asp:ListItem>100</asp:ListItem>
                                </asp:DropDownList>
                                        条
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%-- <div class="row no-margin-left no-margin-right">
                    <div class="col-xs-12 text-center" style="margin-top: 20px;">
                        <div class="btn-group">
                            <asp:Button ID="btnSave" runat="server" Text="保存分配方案" class="btn btn-primary" OnClick="btnSave_Click" />                          
                        </div>
                    </div>
                </div>--%>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
