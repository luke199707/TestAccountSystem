<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminCenter.Master" AutoEventWireup="true" CodeBehind="InspectionProjectDetailPrintingForm.aspx.cs" Inherits="TestAccountSystem.AdminPages.InspectionProjectDetailPrintingForm" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb">
            <li><a href="#">检验登记单管理</a></li>
            <li>检验项目明细打印</li>
        </ul>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container">
                <br />
                <div class="row">
                    <div class="col-sm-2 col-sm-offset-2 text-right">
                        <asp:Label ID="labRegisterNumber" runat="server" Text="请输入检验登记单编号：" CssClass="control-label "></asp:Label>
                    </div>
                    <div class="col-sm-3 text-left" style="padding-left: 0px;">
                        <asp:TextBox ID="txtRegisterNumber" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-2">
                        <asp:Button ID="btnQuery" runat="server" Text="查询" class="btn btn-primary btn-block" OnClick="btnQuery_Click" />
                    </div>
                </div>
            </div>
            <div class="space-4"></div>
            <div class="text-right">
                <asp:Button ID="btnExport" runat="server" Text="导出检验项目明细" class="btn btn-default" OnClick="btnExport_Click"/>
            </div>
            <div class="row no-margin">
                <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false" AllowSorting="true"
                    class="table table-bordered table-hover" Width="100%" OnSorting="grid_Sorting" ShowHeaderWhenEmpty="True" OnDataBound="grid_DataBound" OnRowDataBound="grid_RowDataBound">
                    <RowStyle BackColor="#f9f9f9" HorizontalAlign="Center" VerticalAlign="Top" />
                    <AlternatingRowStyle BackColor="White" HorizontalAlign="Center" VerticalAlign="Top" />
                    <Columns>
                        <asp:TemplateField HeaderText="序号" SortExpression="ID">
                            <ItemTemplate>
                                <asp:Button ID="btnDetail" CommandName="btnDetailCommand" CommandArgument='<%#Eval("ID") %>' runat="server" Text="详细信息" Style="display: none;" />
                                <asp:Literal ID="LiteralIndex" runat="server" Text="<%# Container.DataItemIndex+1 +(AspNetPager1.CurrentPageIndex-1)*AspNetPager1.PageSize %>"></asp:Literal>
                                <asp:Literal ID="LiteralId" runat="server" Text='<%#Eval("ID") %>' Visible="false"></asp:Literal>
                                <asp:Literal ID="LiteralCode" runat="server" Text='<%#Eval("RegisterNumber") %>' Visible="false"></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="检验登记单编号" SortExpression="RegisterNumber">
                            <ItemTemplate>
                                <asp:Literal ID="LiteralRegisterNumber" runat="server" Text='<%#Eval("RegisterNumber")%>'></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="业务代码" SortExpression="BusinessNumber">
                            <ItemTemplate>
                                <asp:Literal ID="LiteralBusinessNumber" runat="server" Text='<%#Eval("BusinessNumber")%>'></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="业务名称" SortExpression="BusinessName">
                            <ItemTemplate>
                                <asp:Literal ID="LiteralBusinessName" runat="server" Text='<%#Eval("BusinessName")%>'></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="检验项目代码" SortExpression="ProjectNumber">
                            <ItemTemplate>
                                <asp:Literal ID="LiteralProjectNumber" runat="server" Text='<%#Eval("ProjectNumber")%>'></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="检验项目名称" SortExpression="ProjectName">
                            <ItemTemplate>
                                <asp:Literal ID="LiteralProjectName" runat="server" Text='<%#Eval("ProjectName")%>'></asp:Literal>
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
                    <webdiyer:aspnetpager id="AspNetPager1" runat="server" width="100%" cssclass="pages"
                        firstpagetext="首页" lastpagetext="尾页" prevpagetext="上页" nextpagetext="下页" currentpagebuttonclass="cpb"
                        alwaysshow="true" showcustominfosection="Left" showpageindexbox="always" pageindexboxtype="DropDownList"
                        custominfohtml="第<font color='red'><b>%currentPageIndex%</b></font>页，共%PageCount%页，共<font color='red'><b>%RecordCount%</b></font>条记录"
                        onpagechanged="AspNetPager1_PageChanged" pagesize="10">
                </webdiyer:aspnetpager>
                </div>
                <div class="col-xs-3 text-right">
                    每页显示记录数：
                                <asp:DropDownList ID="ddlpagesize" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlpagesize_SelectedIndexChanged">
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>50</asp:ListItem>
                                    <asp:ListItem>100</asp:ListItem>
                                    <asp:ListItem>200</asp:ListItem>
                                </asp:DropDownList>
                    条
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
