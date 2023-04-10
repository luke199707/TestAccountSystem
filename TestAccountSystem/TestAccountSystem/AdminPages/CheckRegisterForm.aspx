<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminCenter.Master" AutoEventWireup="true" CodeBehind="CheckRegisterForm.aspx.cs" Inherits="TestAccountSystem.AdminPages.CheckRegisterForm" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../StyleSheet/fancybox2.1.5/source/jquery.fancybox.css" rel="stylesheet"
        type="text/css" />
    <script src="../StyleSheet/fancybox2.1.5/source/jquery.fancybox.js" type="text/javascript"></script>
    <script type="text/javascript">      
        function open(param) {/*打开填写意见对话框*/
            $.fancybox.open({
                href: 'ShowOpinionDialog.aspx' + param,
                type: 'iframe',
                padding: 3,
                width: 1500
            });
        };
        function open1(param) {/*打开检验项目对话框*/
            $.fancybox.open({
                href: 'ShowChargeDialog.aspx' + param,
                type: 'iframe',
                padding: 3,
                width: 1500
            });
        };
        function AfterSelectProject() {
            $.fancybox.close();
           // window.parent.frames.location.href = "CheckRegisterForm.aspx";
          //  $.post("CheckRegisterForm.aspx", { "refresh": "ok" }, function () { });
            // window.opener.location.reload();
            // window.parent.location.href = window.opener.location.href;

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="fa fa-home fa-fw home-icon"></i><a href="#">检验登记单管理</a> </li>
                    <li class="active">检验登记单审核</li>
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
                    <asp:TemplateField HeaderText="开单日期" SortExpression="OrderDate">
                        <ItemTemplate>
                            <asp:Literal ID="LiteralOrderDate" runat="server" Text='<%#Eval("OrderDate")%>'></asp:Literal>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="审核人" SortExpression="Reviewer">
                        <ItemTemplate>
                            <asp:Literal ID="LiteralReviewer" runat="server" Text='<%#Eval("Reviewer")%>'></asp:Literal>
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
                    <asp:HyperLinkField DataNavigateUrlFields="RegisterNumber" DataNavigateUrlFormatString="ShowRegisterInfo.aspx?RegisterNumber={0}&type=CheckRegisterForm" HeaderText="详细信息" Text="详细信息" />
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnCheck" Visible="false" runat="server" CommandArgument='<%# Bind("RegisterNumber") %>' OnClick="btnCheck_Click">审核</asp:LinkButton>
                           <%-- <div class="row">--%>
                             <%--   <div class="col-xs-6" style="width: 20px; height: 20px; margin-left: 10px;">--%>
                                    <asp:LinkButton ID="btnQueryProject" runat="server" CommandArgument='<%# Bind("RegisterNumber") %>' OnClick="btnQueryProject_Click">查看检验项目</asp:LinkButton>
                                    <%--<asp:Button ID="btnQueryProject" Visible="true" runat="server" Text="查看检验项目" class="btn btn-success btn-xs" CommandArgument='<%# Bind("RegisterNumber") %>' OnClick="btnQueryProject_Click" />--%>
                             <%--   </div>--%>
                                <%--<div class="col-xs-6" style="width: 20px; height: 20px; margin-left: 50px;">
                                    <asp:LinkButton ID="btnOK" Visible="false" runat="server" CommandArgument='<%# Bind("RegisterNumber") %>' OnClick="btnOK_Click">审核通过</asp:LinkButton>
                                    <%--<asp:Button ID="btnOK" Visible="false" runat="server" Text="审核通过" class="btn btn-success btn-xs" CommandArgument='<%# Bind("RegisterNumber") %>' OnClick="btnOK_Click" />--%>
                              <%--  </div>--%>
                               <%-- <div class="col-xs-6" style="width: 20px; height: 20px; margin-left: 50px;">
                                    <asp:LinkButton ID="btnRefuse" Visible="false" runat="server" CommandArgument='<%# Bind("RegisterNumber") %>' OnClick="btnRefuse_Click">审核不通过</asp:LinkButton> 
                                    <%--<asp:Button ID="btnRefuse" Visible="false" runat="server" Text="审核不通过" class="btn btn-danger btn-xs" CommandArgument='<%# Bind("RegisterNumber") %>' OnClick="btnRefuse_Click" />--%>
                                <%--</div>--%>
                         <%--   </div>--%>
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
