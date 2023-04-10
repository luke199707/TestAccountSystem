<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminCenter.Master" AutoEventWireup="true" CodeBehind="InspectionBillingForm.aspx.cs" Inherits="TestAccountSystem.AdminPages.InspectionBillingForm" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../StyleSheet/fancybox2.1.5/source/jquery.fancybox.css" rel="stylesheet"
        type="text/css" />
    <script src="../StyleSheet/fancybox2.1.5/source/jquery.fancybox.js" type="text/javascript"></script>
    <script type="text/javascript">      
        function open(param) {
            $.fancybox.open({
                href: 'ShowChargeDialog.aspx' + param,
                type: 'iframe',
                padding: 3,
                width: 1500
            });
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb">
            <li><i class="fa fa-home fa-fw home-icon"></i><a href="#">计费管理</a> </li>
            <li class="active">检验计费</li>
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
            <br />
            <asp:Literal ID="hiddenRegisterNumber" runat="server" Visible="false"></asp:Literal>
            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false" AllowSorting="true"
                class="table table-bordered table-hover" Width="100%" OnSorting="grid_Sorting" ShowHeaderWhenEmpty="True" OnDataBound="grid_DataBound" OnRowCommand="grid_RowCommand" OnRowDataBound="grid_RowDataBound">
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
                    <asp:TemplateField HeaderText="船舶登记号" SortExpression="ShipRegistrationNumber">
                        <ItemTemplate>
                            <asp:Literal ID="LiteralShipRegistrationNumber" runat="server" Text='<%#Eval("ShipRegistrationNumber")%>'></asp:Literal>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--<asp:TemplateField HeaderText="业务类型" SortExpression="BusinessName">
                        <ItemTemplate>
                            <asp:Literal ID="LiteralBusinessName" runat="server" Text='<%#Eval("BusinessName")%>'></asp:Literal>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText="申请单位" SortExpression="ApplicantCompany">
                        <ItemTemplate>
                            <asp:Literal ID="LiteralApplicantCompany" runat="server" Text='<%#Eval("ApplicantCompany")%>'></asp:Literal>
                        </ItemTemplate>
                    </asp:TemplateField>
                   <%-- <asp:TemplateField HeaderText="公司法人" SortExpression="Applicant">
                        <ItemTemplate>
                            <asp:Literal ID="LiteralApplicant" runat="server" Text='<%#Eval("Applicant")%>'></asp:Literal>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText="开单日期" SortExpression="OrderDate">
                        <ItemTemplate>
                            <asp:Literal ID="LiteralOrderDate" runat="server" Text='<%#Eval("OrderDate")%>'></asp:Literal>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="检验总费用" SortExpression="Amount">
                        <ItemTemplate>
                            <asp:Literal ID="LiteralAmount" runat="server" Text='<%#Eval("Amount")%>'></asp:Literal>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="验船师" SortExpression="Surveyor">
                        <ItemTemplate>
                            <asp:Literal ID="LiteralSurveyor" runat="server" Text='<%#Eval("Surveyor")%>'></asp:Literal>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="订单状态" SortExpression="Status">
                        <ItemTemplate>
                            <asp:Literal ID="LiteralStatus" runat="server" Text='<%#Eval("Status")%>'></asp:Literal>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="申请人" SortExpression="Remark">
                        <ItemTemplate>
                            <%#Eval("Remark")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%-- <asp:TemplateField HeaderText="计费操作人" SortExpression="BusinessName">
                        <ItemTemplate>
                            <%#Eval("BusinessName")%>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    <asp:HyperLinkField DataNavigateUrlFields="RegisterNumber" DataNavigateUrlFormatString="ShowRegisterInfo.aspx?RegisterNumber={0}&type=InspectionBillingForm" HeaderText="详细信息" Text="详细信息" />
                    <asp:TemplateField HeaderText="操作" >
                        <ItemTemplate>
                            <asp:LinkButton ID="btnQueryProject" runat="server" CommandArgument='<%# Bind("RegisterNumber") %>' OnClick='btnQueryProject_Click'>查看检验项目</asp:LinkButton>
                            <asp:LinkButton ID="btnBilling" Visible="false" runat="server" CommandArgument='<%# Bind("RegisterNumber") %>' OnClick="btnBilling_Click">开始计费</asp:LinkButton>
                           <%-- <asp:Button ID="btnBilling" class="btn btn-success btn-xs" runat="server" Text="计费" CommandArgument='<%# Bind("RegisterNumber") %>' Visible="false" OnClick="btnBilling_Click" />--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
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
            <br />
            <div id="detailDiv" visible="false" runat="server">
                <asp:Label ID="Label1" runat="server" Text="订单检验项目信息" CssClass="label label-primary label-lg"></asp:Label>
                <asp:GridView ID="gdvDetail" runat="server" AutoGenerateColumns="false" AllowSorting="true"
                    class="table table-bordered table-hover" Width="100%" OnSorting="gdvDetail_Sorting" ShowHeaderWhenEmpty="True" OnDataBound="gdvDetail_DataBound">
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
                        <asp:TemplateField HeaderText="申请人" SortExpression="Remark">
                            <ItemTemplate>
                                <%#Eval("Remark")%>
                            </ItemTemplate>
                        </asp:TemplateField>
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
                                    <asp:ListItem>200</asp:ListItem>
                                </asp:DropDownList>
                        条
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
