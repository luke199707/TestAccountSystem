<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminCenter.Master" AutoEventWireup="true" CodeBehind="InspectionStatusManagementForm.aspx.cs" Inherits="TestAccountSystem.AdminPages.InspectionStatusManagementForm" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <link href="../StyleSheet/fancybox2.1.5/source/jquery.fancybox.css" rel="stylesheet"
        type="text/css" />
    <script src="../StyleSheet/fancybox2.1.5/source/jquery.fancybox.js" type="text/javascript"></script>
    <script type="text/javascript">      
        function open(param) {
            $.fancybox.open({
                href: 'ShowDialog.aspx' + param,
                type: 'iframe',
                padding: 3,
                width: 1500
            });
        };        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="fa fa-home fa-fw home-icon"></i><a href="#">检验登记单管理</a></li>
                    <li>检验日志管理</li>
                </ul>
            </div>
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
                    <asp:TemplateField HeaderText="船只登记编号" SortExpression="ShipRegistrationNumber">
                        <ItemTemplate>
                            <asp:Literal ID="LiteralShipRegistrationNumber" runat="server" Text='<%#Eval("ShipRegistrationNumber")%>'></asp:Literal>
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
                    <asp:TemplateField HeaderText="申请人" SortExpression="Remark">
                        <ItemTemplate>
                            <%#Eval("Remark")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:HyperLinkField DataNavigateUrlFields="RegisterNumber" Visible="false" DataNavigateUrlFormatString="ShowRegisterInfo.aspx?RegisterNumber={0}&type=InspectionStatusManagementForm" HeaderText="详细信息" Text="详细信息" />
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnQueryLog" Visible="false" runat="server" CommandArgument='<%# Bind("RegisterNumber") %>' OnClick="btnQueryLog_Click">查看日志</asp:LinkButton>
                            <asp:LinkButton ID="btnAddLog" Visible="false" runat="server" CommandArgument='<%# Bind("RegisterNumber") %>' OnClick="btnAddLog_Click">添加日志</asp:LinkButton>
                            <asp:LinkButton ID="btnStart" Visible="false" runat="server" CommandArgument='<%# Bind("RegisterNumber") %>' OnClick="btnStart_Click">开始验船</asp:LinkButton>
                            <asp:LinkButton ID="btnEnd" Visible="false" runat="server" CommandArgument='<%# Bind("RegisterNumber") %>' OnClick="btnEnd_Click">验船完成</asp:LinkButton>
                            <%--<div class="col-xs-6">
                                <asp:Button Visible="false" class="btn btn-success btn-xs" ID="btnAddLog" runat="server" CommandArgument='<%# Bind("RegisterNumber") %>' OnClick="btnAddLog_Click" Text="添加检验日志"></asp:Button>
                            </div>
                            <div class="row">
                                <div class="col-xs-6">
                                    <asp:Button ID="btnStart" Visible="false" runat="server" Text="开始验船" class="btn btn-success btn-xs" CommandArgument='<%# Bind("RegisterNumber") %>' OnClick="btnStart_Click" />
                                </div>

                                <div class="col-xs-6">
                                    <asp:Button ID="btnEnd" Visible="false" runat="server" Text="验船完毕" class="btn btn-danger btn-xs" CommandArgument='<%# Bind("RegisterNumber") %>' OnClick="btnEnd_Click" />
                                </div>
                            </div>--%>
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
            <%--订单日志信息--%>
           <%-- <br />
            <div runat="server" id="LogDiv" visible="false">
                <asp:Label ID="Label1" runat="server" Text="检验日志信息" CssClass="label label-primary label-lg"></asp:Label>
                <asp:GridView ID="gdvLogDetail" runat="server" AutoGenerateColumns="false" AllowSorting="true"
                    class="table table-bordered table-hover" Width="100%" OnSorting="gdvLogDetail_Sorting" OnDataBound="gdvLogDetail_DataBound" ShowHeaderWhenEmpty="True">
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
                        <asp:TemplateField HeaderText="检验日志编号" SortExpression="LogNumber">
                            <ItemTemplate>
                                <asp:Literal ID="LiteralLogNumber" runat="server" Text='<%#Eval("LogNumber")%>'></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="检验订单编号" SortExpression="RegisterNumber">
                            <ItemTemplate>
                                <asp:Literal ID="LiteralRegisterNumber" runat="server" Text='<%#Eval("RegisterNumber")%>'></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="检验人" SortExpression="Inspector">
                            <ItemTemplate>
                                <asp:Literal ID="LiteralInspector" runat="server" Text='<%#Eval("Inspector")%>'></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="地点" SortExpression="Location">
                            <ItemTemplate>
                                <asp:Literal ID="LiteralLocation" runat="server" Text='<%#Eval("Location")%>'></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="时间" SortExpression="Time">
                            <ItemTemplate>
                                <asp:Literal ID="LiteralTime" runat="server" Text='<%#Eval("Time")%>'></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="检验内容" SortExpression="InspectionContent">
                            <ItemTemplate>
                                <asp:Literal ID="LiteralInspectionContent" runat="server" Text='<%#Eval("InspectionContent")%>'></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="备注" SortExpression="Remark">
                            <ItemTemplate>
                                <%#Eval("Remark")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="操作">
                            <ItemTemplate>
                                <div class="row">
                                    <div class="col-xs-6">
                                        <asp:Button ID="btnEdit" runat="server" Text="编辑" class="btn btn-success btn-xs" CommandArgument='<%# Bind("ID") %>' OnClick="btnEdit_Click" />
                                    </div>

                                    <div class="col-xs-6">
                                        <asp:Button ID="btnDel" runat="server" Text="删除" class="btn btn-danger btn-xs" CommandArgument='<%# Bind("ID") %>' OnClick="btnDel_Click" OnClientClick=" return confirm('是否删除此记录？')" />
                                    </div>
                                </div>
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
            </div>--%>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
