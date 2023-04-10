<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminCenter.Master" AutoEventWireup="true" CodeBehind="StatisticsInfo.aspx.cs" Inherits="TestAccountSystem.AdminPages.StatisticsInfo" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="fa fa-home fa-fw home-icon"></i><a href="#">查询统计</a></li>
                    <li>统计</li>
                    <asp:Literal ID="LiteralCondition" runat="server" Visible="false"></asp:Literal>
                    <asp:Literal ID="LiteralTimeCondition" runat="server" Visible="false"></asp:Literal>
                </ul>
            </div>
            <div class="page-content">
                <div class="col-xs-12">
                    <h5 class="text-primary">请输入查询条件：</h5>
                    <div class="col-xs-12 form-horizontal">
                        <div  class="form-group" style="margin-bottom: 5px;" >
                            <div id="surveyorDiv" runat="server" visible="false">
                                <label class="col-xs-1 control-label no-padding-right">验船师：</label>
                                <div class="col-xs-4 input-group " style="float: left;">
                                    <asp:DropDownList ID="ddlSurveyor" class="form-control" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlSurveyor_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div id="financeDiv" runat="server" visible="false">
                                <label class="col-xs-1 control-label no-padding-right">财务：</label>
                                <div class="col-xs-4 input-group " style="float: left;">
                                    <asp:DropDownList ID="ddlCashier" class="form-control" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlCashier_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <label class="col-xs-1 control-label no-padding-right">成交总金额：</label>
                            <div class="col-xs-4 input-group" style="float: left;">
                                <asp:TextBox ID="txtmoney" class="form-control" runat="server" placeholder="显示总金额" disabled></asp:TextBox>
                            </div>
                        </div>
                        <%--      <div id="financeDiv" class="form-group" style="margin-bottom: 5px;" runat="server" visible="false">
                            <label class="col-xs-1 control-label no-padding-right">财务：</label>
                            <div class="col-xs-4 input-group " style="float: left;">
                                <asp:DropDownList ID="ddlCashier" class="form-control" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlCashier_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                            <label class="col-xs-1 control-label no-padding-right">收费总金额：</label>
                            <div class="col-xs-4 input-group" style="float: left;">
                                <asp:TextBox ID="TextBox1" class="form-control" runat="server" placeholder="显示总金额" disabled></asp:TextBox>
                            </div>
                        </div>--%>
                        <div class="form-group">
                            <label class="col-xs-1 control-label no-padding-right">开始时间：</label>
                            <div class="col-xs-4 input-group " style="float: left;">
                                <asp:TextBox ID="txtStartTime" class="form-control" runat="server" placeholder="起始时间" onclick="WdatePicker()"></asp:TextBox>
                                <span class=" input-group-addon">
                                    <i class=" fa fa-calendar fa-fw"></i>
                                </span>
                            </div>
                            <label class="col-xs-1 control-label no-padding-right">结束时间：</label>
                            <div class="col-xs-4 input-group" style="float: left;">
                                <asp:TextBox ID="txtEndTime" class="form-control" runat="server" onclick="WdatePicker()" placeholder="截止时间"></asp:TextBox>
                                <span class=" input-group-addon">
                                    <i class=" fa fa-calendar fa-fw"></i>
                                </span>
                            </div>
                            <div class="col-xs-2  btn-group">
                                <asp:Button ID="btnQueryAll" runat="server" Text="搜索信息" class="btn btn-default" OnClick="btnQueryAll_Click" />
                            </div>
                        </div>
                        <br />
                    </div>
                </div>
                <div class="row no-margin">
                    <asp:Literal ID="hiddenid" runat="server" Visible="false"></asp:Literal>
                    <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false" AllowSorting="true"
                        class="table table-bordered table-hover" Width="100%" ShowHeaderWhenEmpty="True" OnSorting="grid_Sorting">
                        <RowStyle BackColor="#f9f9f9" HorizontalAlign="Center" VerticalAlign="Top" />
                        <AlternatingRowStyle BackColor="White" HorizontalAlign="Center" VerticalAlign="Top" />
                        <Columns>
                            <asp:TemplateField HeaderText="序号" SortExpression="ID">
                                <ItemTemplate>
                                    <asp:Button ID="btnDetail" CommandName="btnDetailCommand" CommandArgument='<%#Eval("ID") %>' runat="server" Text="详细信息" Style="display: none;" />
                                    <asp:Literal ID="LiteralIndex" runat="server" Text="<%# Container.DataItemIndex+1 +(AspNetPager1.CurrentPageIndex-1)*AspNetPager1.PageSize %>"></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="检验登记单编号" SortExpression="RegisterNumber">
                                <ItemTemplate>
                                    <asp:Literal ID="LiteralRegisterNumber" runat="server" Text='<%#Eval("RegisterNumber")%>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="船只登记编号" SortExpression="ShipRegistrationNumber">
                                <ItemTemplate>
                                    <asp:Literal ID="LiteralShipRegistrationNumber" runat="server" Text='<%#Eval("ShipRegistrationNumber")%>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="申请单位" SortExpression="ApplicantCompany">
                                <ItemTemplate>
                                    <asp:Literal ID="LiteralApplicantCompany" runat="server" Text='<%#Eval("ApplicantCompany")%>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="开单日期" SortExpression="OrderDate">
                                <ItemTemplate>
                                    <asp:Literal ID="LiteralOrderDate" runat="server" Text='<%#Eval("OrderDate")%>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="验船师" SortExpression="Surveyor">
                                <ItemTemplate>
                                    <asp:Literal ID="LiteralSurveyor" runat="server" Text='<%#Eval("Surveyor")%>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="检验登记单状态" SortExpression="Status">
                                <ItemTemplate>
                                    <asp:Literal ID="LiteralStatus" runat="server" Text='<%#Eval("Status")%>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="收费金额" SortExpression="Amount">
                                <ItemTemplate>
                                    <%#Eval("Amount")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="收费人" SortExpression="cashier">
                                <ItemTemplate>
                                    <%#Eval("cashier")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:HyperLinkField DataNavigateUrlFields="RegisterNumber" DataNavigateUrlFormatString="ShowRegisterInfo.aspx?RegisterNumber={0}&type=RegistrationStatisticForm" Text="详细信息" HeaderText="操作" />

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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
