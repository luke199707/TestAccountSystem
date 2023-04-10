<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminCenter.Master" AutoEventWireup="true" CodeBehind="RegistrationStatisticForm.aspx.cs" Inherits="TestAccountSystem.AdminPages.RegistrationStatisticForm" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="fa fa-home fa-fw home-icon"></i><a href="#">检验登记单管理</a></li>
                    <li>检验登记单统计</li>
                    <asp:Literal ID="LiteraShip" runat="server" Visible="false"></asp:Literal>
                    <asp:Literal ID="LiteraDDLState" runat="server" Visible="false"></asp:Literal>
                </ul>
            </div>
            <!-- .breadcrumb -->
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <h5 class="text-primary">请输入查询条件：</h5>

                        <div class="row form-horizontal" style="margin-bottom: 5px;">
                            <label class="col-xs-1 control-label no-padding-right">船只登记号：</label>
                            <div class="col-xs-4 input-group" style="float: left;">
                                <asp:TextBox ID="txtShipRegistrationNumber" class="form-control" runat="server" placeholder="请输入船只登记编号"></asp:TextBox>
                            </div>
                            <div class="form-group" style="margin-bottom: 5px;">

                                <label class="col-xs-1 control-label no-padding-right">检验登记单状态：</label>
                                <div class="col-xs-4 input-group " style="float: left;">
                                    <asp:DropDownList ID="ddlState" class="form-control" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                                        <asp:ListItem Text="请选择" Selected="True" Value="" />
                                        <asp:ListItem Text="待审核" Value="待审核" />
                                        <asp:ListItem Text="待计费" Value="待计费" />
                                        <asp:ListItem Text="待缴费" Value="待缴费" />
                                        <asp:ListItem Text="待验船" Value="待验船" />
                                        <asp:ListItem Text="验船中" Value="验船中" />
                                        <asp:ListItem Text="完成" Value="完成" />
                                    </asp:DropDownList>
                                </div>
                                <div class="col-xs-2  btn-group" style="width: 100px; height: 32px;">
                                    <asp:Button ID="btnSerach" runat="server" Text="搜索信息" class="btn btn-default" OnClick="btnSerach_Click" />
                                </div>


                            </div>

                        </div>
                        <div class="space-4"></div>

                        <div class="space-8"></div>
                        <div class="row no-margin">
                            <asp:Literal ID="hiddenid" runat="server" Visible="false"></asp:Literal>
                            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false" AllowSorting="true"
                                class="table table-bordered table-hover" Width="100%" OnSorting="grid_Sorting" ShowHeaderWhenEmpty="True">
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
                                    <asp:TemplateField HeaderText="申请项目" SortExpression="ApplicationProject">
                                        <ItemTemplate>
                                            <asp:Literal ID="LiteralStatus" runat="server" Text='<%#Eval("ApplicationProject")%>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="检验费用" SortExpression="Amount">
                                        <ItemTemplate>
                                            <asp:Literal ID="LiteralApplicant" runat="server" Text='<%#Eval("Amount")%>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="计费人" SortExpression="BusinessName">
                                        <ItemTemplate>
                                            <asp:Literal ID="LiteralBusinessName" runat="server" Text='<%#Eval("BusinessName")%>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="收费人" SortExpression="cashier">
                                        <ItemTemplate>
                                            <asp:Literal ID="LiteralBusinessName" runat="server" Text='<%#Eval("cashier")%>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="验船师" SortExpression="Surveyor">
                                        <ItemTemplate>
                                            <asp:Literal ID="LiteralSurveyor" runat="server" Text='<%#Eval("Surveyor")%>'></asp:Literal>
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

                        <!-- PAGE CONTENT ENDS -->
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
