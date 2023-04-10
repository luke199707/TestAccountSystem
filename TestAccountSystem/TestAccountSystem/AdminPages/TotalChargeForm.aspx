<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminCenter.Master" AutoEventWireup="true" CodeBehind="TotalChargeForm.aspx.cs" Inherits="TestAccountSystem.AdminPages.TotalChargeForm" %>
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
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="breadcrumbs" id="commonDiv" runat="server">
        <%--id="breadcrumbs"--%>
        <ul class="breadcrumb">
            <li><i class="fa fa-home fa-fw home-icon"></i><a href="#">检验计费管理</a> </li>
            <li class="active">全部订单</li>
        </ul>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
             <br />
                <div class="row">
                    <asp:Literal ID="LqueryCondition" Visible="false" runat="server"></asp:Literal>
                    <div class="col-sm-2 col-sm-offset-2 form-horizontal" style="width:110px;height:32px;margin-left:50px;margin-top:7px;">
                        <asp:Label ID="labRegisterNumber" runat="server" Text="登记单编号：" CssClass="control-label "></asp:Label>
                    </div>
                    <div class="col-sm-3 text-left" style="padding-left: 0px;margin-left:10px">
                        <asp:TextBox ID="txtRegisterNumber" runat="server" CssClass="form-control" placeHolder="请输入要查询的登记单编号"></asp:TextBox>
                    </div>
                     <div class="col-sm-2 col-sm-offset-2" style="width:120px;height:32px;margin-left:50px;margin-top:7px;">
                        <asp:Label ID="Label1" runat="server" Text="收费人：" CssClass="control-label "></asp:Label>
                    </div>
                    <div class="col-sm-3 text-left" style="padding-left: 0px;">
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                    <div class="col-sm-2">
                        <asp:Button ID="btnQuery" runat="server" Text="查询" class="btn btn-primary btn-block" OnClick="btnQuery_Click" />
                    </div>
                </div>
            <br />
             <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false" AllowSorting="true"
                class="table table-bordered table-hover" Width="100%"  ShowHeaderWhenEmpty="True" OnSorting="grid_Sorting" >
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
                    <asp:TemplateField HeaderText="计费人" SortExpression="BusinessName">
                        <ItemTemplate>
                            <%#Eval("BusinessName")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="收费人" SortExpression="cashier">
                        <ItemTemplate>
                            <%#Eval("cashier")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="检验费用" SortExpression="Amount">
                        <ItemTemplate>
                            <asp:Literal ID="LiteralAmount" runat="server" Text='<%#Eval("Amount")%>'></asp:Literal>
                        </ItemTemplate>
                    </asp:TemplateField>
                  <%--  <asp:TemplateField HeaderText="缴费人" SortExpression="payer">
                        <ItemTemplate>
                            <%#Eval("payer")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="缴费日期" SortExpression="payTime">
                        <ItemTemplate>
                            <%#Eval("payTime")%>
                        </ItemTemplate>
                    </asp:TemplateField> 
                     <asp:TemplateField HeaderText="备注" SortExpression="remark1">
                        <ItemTemplate>
                            <%#Eval("remark1")%>
                        </ItemTemplate>
                    </asp:TemplateField> --%>    
                  <%--  <asp:HyperLinkField DataNavigateUrlFields="RegisterNumber" DataNavigateUrlFormatString="ShowRegisterInfo.aspx?RegisterNumber={0}&type=InspectionChargeForm" HeaderText="详细信息" Text="详细信息" Visible="false"/>--%>
                    <%--<asp:TemplateField HeaderText="收费">
                        <ItemTemplate>
                            <asp:Button ID="btnCharge" Visible="false" runat="server" Text="收费" CommandArgument='<%# Bind("RegisterNumber") %>' OnClick="btnCharge_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <asp:LinkButton ID="LbtnDetail" runat="server" CommandArgument='<%#Eval("RegisterNumber")%>' OnClick="LbtnDetail_Click">详情</asp:LinkButton>
                          <%--  <asp:Button ID="btnCharge" Visible="false" runat="server" Text="收费" class="btn btn-success btn-xs" CommandArgument='<%# Bind("RegisterNumber") %>' OnClick="btnCharge_Click" />
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
