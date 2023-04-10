<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminCenter.Master" AutoEventWireup="true" CodeBehind="InspectionChargeForm.aspx.cs" Inherits="TestAccountSystem.AdminPages.InspectionChargeForm" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../StyleSheet/fancybox2.1.5/source/jquery.fancybox.css" rel="stylesheet"
        type="text/css" />
    <script src="../StyleSheet/fancybox2.1.5/source/jquery.fancybox.js" type="text/javascript"></script>
    <script type="text/javascript">      
        function open(param) {
            $.fancybox.open({
                href: 'ShowPayerDialog.aspx' + param,
                type: 'iframe',
                padding: 3,
                width: 1500
            });
        };
        function AfterSelectProject() {
            $.fancybox.close();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="breadcrumbs" id="commonDiv" runat="server"><%--id="breadcrumbs"--%>
        <ul class="breadcrumb">
            <li><i class="fa fa-home fa-fw home-icon"></i><a href="#">检验计费管理</a> </li>
            <li class="active">检验收费</li>
        </ul>
    </div>
    <div class="breadcrumbs" id="customerDiv" runat="server" visible="false">
        <ul class="breadcrumb">
            <li><a href="#">检验登记单管理</a> </li>
            <li class="active">收费明细</li>
        </ul>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="grid" />
        </Triggers>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnExport" />
        </Triggers>
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
            <div class="text-right">
                <asp:Button ID="btnExport" runat="server" Text="导出收费明细" class="btn btn-default" OnClick="btnExport_Click" OnClientClick="return confirm('确认导出信息？\n继续导出请单击确认按钮，稍后可点击页面底部的导出文件查看详情。')" />
            </div>
            <asp:Literal ID="hiddenid" runat="server" Visible="false"></asp:Literal>
            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false" AllowSorting="true"
                class="table table-bordered table-hover" Width="100%" OnSorting="grid_Sorting" ShowHeaderWhenEmpty="True" OnDataBound="grid_DataBound">
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
                    <asp:TemplateField HeaderText="申请人" SortExpression="Remark">
                        <ItemTemplate>
                            <%#Eval("Remark")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="开单日期" SortExpression="OrderDate">
                        <ItemTemplate>
                            <asp:Literal ID="LiteralOrderDate" runat="server" Text='<%#Eval("OrderDate")%>'></asp:Literal>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="检验登记单状态" SortExpression="Status">
                        <ItemTemplate>
                            <asp:Literal ID="LiteralStatus" runat="server" Text='<%#Eval("Status")%>'></asp:Literal>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="检验费用" SortExpression="Amount">
                        <ItemTemplate>
                            <asp:Literal ID="LiteralAmount" runat="server" Text='<%#Eval("Amount")%>'></asp:Literal>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="计费操作员" SortExpression="BusinessName">
                        <ItemTemplate>
                            <%#Eval("BusinessName")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:HyperLinkField DataNavigateUrlFields="RegisterNumber" DataNavigateUrlFormatString="ShowRegisterInfo.aspx?RegisterNumber={0}&type=InspectionChargeForm" HeaderText="详细信息" Text="详细信息" Visible="false"/>
                    <%--<asp:TemplateField HeaderText="收费">
                        <ItemTemplate>
                            <asp:Button ID="btnCharge" Visible="false" runat="server" Text="收费" CommandArgument='<%# Bind("RegisterNumber") %>' OnClick="btnCharge_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnCharge" Visible="false" runat="server" CommandArgument='<%# Bind("RegisterNumber") %>' OnClick="btnCharge_Click">收费</asp:LinkButton>
                            <asp:LinkButton ID="btnExportOne" Visible="false" runat="server" CommandArgument='<%# Bind("RegisterNumber") %>' OnClick="btnExportOne_Click">导出</asp:LinkButton>
                           <%-- <asp:Button ID="btnCharge" Visible="false" runat="server" Text="收费" class="btn btn-success btn-xs" CommandArgument='<%# Bind("RegisterNumber") %>' OnClick="btnCharge_Click" />
                            <asp:Button ID="btnExportOne" Visible="false" runat="server" Text="导出" class="btn btn-success btn-xs" CommandArgument='<%# Bind("RegisterNumber") %>' OnClick="btnExportOne_Click" />--%>
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
