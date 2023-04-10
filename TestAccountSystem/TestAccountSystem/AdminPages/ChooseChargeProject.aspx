<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminCenter.Master" AutoEventWireup="true" CodeBehind="ChooseChargeProject.aspx.cs" Inherits="TestAccountSystem.AdminPages.ChooseChargeProject" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Literal ID="errorMessages" runat="server"></asp:Literal>
    <div class="breadcrumbs" id="breadcrumbs">
        <ol class="breadcrumb">
            <%-- <li class="breadcrumb-item"><a href="RegistrationForm.aspx">登记单基本信息填写</a></li>
            <li class="breadcrumb-item"><a href="ShipInfoForm.aspx">船只基本信息填写</a></li>
            <li class="breadcrumb-item">检验项目选择</li>--%>
            <li class="breadcrumb-item"><a href="RegistrationForm.aspx">登记单基本信息填写</a></li>
            <li class="breadcrumb-item"><a href="ShipInfoForm.aspx">船只基本信息填写</a></li>
            <li class="breadcrumb-item">检验项目选择</li>
            <%--    <li class="breadcrumb-item"><a href="#">登记单基本信息填写</a></li>
            <li class="breadcrumb-item"><a href="#">船只基本信息填写</a></li>
            <li class="breadcrumb-item">检验项目选择</li>--%>
        </ol>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container">
                <div class="row">
                    <h3><span class="label label-danger">选择要检验的项目</span></h3>
                </div>
                <div class="row form-horizontal" style="margin-bottom: 5px;">
                    <div class="col-xs-2 text-right" style="width:150px;height:32px;">
                        <label class="control-label" for="txtRegisterNumber">检验登记单编号：</label>
                    </div>
                    <div class="col-xs-4" style="padding-left: 0px;">
                        <asp:TextBox ID="txtRegisterNumber" runat="server" class="form-control input-sm"></asp:TextBox>
                    </div>
                    <div class="col-xs-2 text-right">
                        <label class="control-label" for="txtBusinessNumber">业务名称：</label>
                    </div>
                    <div class="col-xs-4 text-left" style="padding-left: 0px;">
                        <asp:DropDownList ID="ddlBusinessNumber" runat="server" class="form-control input-sm" DataTextField="BusinessNumber" DataValueField="BusinessNumber" AutoPostBack="True" OnTextChanged="ddlBusinessNumber_TextChanged" AppendDataBoundItems="true">
                            <asp:ListItem Value="0">请选择</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>      
                <br />
                <div class="row no-margin">
                    <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false" AllowSorting="true"
                        class="table table-bordered table-hover" OnRowCommand="GridViewDepart_RowCommand"
                        OnRowDataBound="GridViewDepart_RowDataBound" Width="100%" OnSorting="grid_Sorting" ShowHeaderWhenEmpty="True">
                        <RowStyle BackColor="#f9f9f9" HorizontalAlign="Center" VerticalAlign="Top" />
                        <AlternatingRowStyle BackColor="White" HorizontalAlign="Center" VerticalAlign="Top" />
                        <Columns>
                            <asp:TemplateField HeaderText="序号" SortExpression="ID">
                                <ItemTemplate>
                                    <asp:Button ID="btnDetail" CommandName="btnDetailCommand" CommandArgument='<%#Eval("ID") %>' runat="server" Text="详细信息" Style="display: none;" />
                                    <asp:Literal ID="LiteralIndex" runat="server" Text="<%# Container.DataItemIndex+1 +(AspNetPager1.CurrentPageIndex-1)*AspNetPager1.PageSize %>"></asp:Literal>
                                    <asp:Literal ID="LiteralId" runat="server" Text='<%#Eval("ID") %>' Visible="false"></asp:Literal>
                                    <asp:Literal ID="LiteralCode" runat="server" Text='<%#Eval("ProjectNumber") %>' Visible="false"></asp:Literal>
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
                                    <asp:TextBox ID="txtQuantity" runat="server" Text="1"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="备注" SortExpression="Remark">
                                <ItemTemplate>
                                    <%#Eval("Remark")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox ID="cbkAddAll" runat="server" AutoPostBack="True" OnCheckedChanged="cbkAddAll_CheckedChanged" Text="全选" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbkAdd" runat="server" />
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
                     <br />
                <asp:Button ID="btnSubmit" runat="server" Text="提交" class="btn btn-primary btn-lg btn-block" OnClick="btnSubmit_Click" />          
            </div>
       
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
