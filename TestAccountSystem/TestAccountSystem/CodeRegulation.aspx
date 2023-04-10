<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminCenter.Master" AutoEventWireup="true" CodeBehind="CodeRegulation.aspx.cs" Inherits="TestAccountSystem.CodeRegulation" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="fa fa-home fa-fw home-icon"></i><a href="#">编码管理</a> </li>
                    <li class="active">设置编码规则</li>
                </ul>
            </div>
            <!-- .breadcrumb -->
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <asp:Panel ID="PanelReceiptCodeDefine" runat="server">
                            <div class="row  no-margin">
                                <div class="col-xs-2 text-center">
                                    <label class="control-label" for="txtReceiptName">
                                        规则名称</label></div>
                                <div class="col-xs-1 text-center" style="padding-left: 0px;">
                                    <label class="control-label" for="txtReceiptPrefix">
                                        前缀</label></div>
                                <div class="col-xs-1 text-center" style="padding-left: 0px;">
                                    <label class="control-label" for="txtReceiptConnector1">
                                        连接符</label></div>
                                <div class="col-xs-2 text-center" style="padding-left: 0px;">
                                    <label class="control-label" for="ddlReceiptTimeType">
                                        日期格式</label></div>
                                <div class="col-xs-1 text-center" style="padding-left: 0px;">
                                    <label class="control-label" for="txtReceiptConnector2">
                                        连接符</label></div>
                                <div class="col-xs-2 text-center" style="padding-left: 0px;">
                                    <label class="control-label" for="txtReceiptDigitsNum">
                                        流水号位数</label></div>
                                <div class="col-xs-1 text-center" style="padding-left: 0px;">
                                    <label class="control-label" for="txtReceiptStartSerial">
                                        起始号</label></div>
                                <div class="col-xs-2 text-center" style="padding-left: 0px;">
                                    <label class="control-label" for="txtReceiptExample">
                                        示例</label></div>
                            </div>
                            <div class="row no-margin">
                                <div class="col-xs-2">
                                    <asp:TextBox ID="txtReceiptName" runat="server" class="form-control input-sm"></asp:TextBox></div>
                                <div class="col-xs-1" style="padding-left: 0px;">
                                    <asp:TextBox ID="txtReceiptPrefix" runat="server" class="form-control input-sm"></asp:TextBox></div>
                                <div class="col-xs-1" style="padding-left: 0px;">
                                    <asp:TextBox ID="txtReceiptConnector1" runat="server" class="form-control input-sm"></asp:TextBox></div>
                                <div class="col-xs-2" style="padding-left: 0px;">
                                    <asp:DropDownList ID="ddlReceiptTimeType" runat="server" class="form-control input-sm">
                                        <asp:ListItem Value="yyyyMMdd">yyyyMMdd</asp:ListItem>
                                        <asp:ListItem Value="yyyyMM"></asp:ListItem>
                                        <asp:ListItem>yyMMdd</asp:ListItem>
                                        <asp:ListItem>yyMM</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-xs-1" style="padding-left: 0px;">
                                    <asp:TextBox ID="txtReceiptConnector2" runat="server" class="form-control input-sm"></asp:TextBox></div>
                                <div class="col-xs-2" style="padding-left: 0px;">
                                    <asp:TextBox ID="txtReceiptDigitsNum" runat="server" class="form-control input-sm"></asp:TextBox></div>
                                <div class="col-xs-1" style="padding-left: 0px;">
                                    <asp:TextBox ID="txtReceiptStartSerial" runat="server" class="form-control input-sm"></asp:TextBox></div>
                                <div class="col-xs-2" style="padding-left: 0px;">
                                    <asp:TextBox ID="txtReceiptExample" runat="server" class="form-control input-sm"
                                        TabIndex="7"></asp:TextBox></div>
                                <div class="col-xs-11" style="padding-left: 0px;">
                                    <asp:TextBox ID="txtReceiptRemark" runat="server" class="form-control input-sm" Visible="false"></asp:TextBox></div>
                            </div>
                            <div class="space-4"></div>
                            <div class="row no-margin">
                                <div class="col-xs-4 col-xs-offset-4 text-center">
                                    <div class="btn-group">
                                        <asp:Button ID="btnReceiptAdd" runat="server" Text="添加" OnClick="btnReceiptAdd_Click"
                                            class="btn btn-default btn-sm" />
                                        <asp:Button ID="btnReceiptCertain" runat="server" Text="确定" OnClick="btnReceiptCertain_Click"
                                            class="btn btn-default btn-sm" />
                                        <asp:Button ID="btnReceiptAddCancel" runat="server" Text="取消" OnClick="btnReceiptAddCancel_Click"
                                            class="btn btn-default btn-sm" />
                                        <asp:Button ID="btnReceiptUpdate" runat="server" Text="修改" OnClick="btnReceiptUpdate_Click"
                                            class="btn btn-default btn-sm" />
                                        <asp:Button ID="btnReceiptSave" runat="server" Text="保存" OnClick="btnReceiptSave_Click"
                                            class="btn btn-default btn-sm" />
                                        <asp:Button ID="btnReceiptUpdateCancel" runat="server" Text="取消" OnClick="btnReceiptUpdateCancel_Click"
                                            class="btn btn-default btn-sm" />
                                        <asp:Button ID="btnReceiptDel" runat="server" Text="删除" OnClick="btnReceiptDel_Click"
                                            class="btn btn-default btn-sm" OnClientClick="return confirm('是否真的要删除该项？');" />
                                    </div>
                                </div>
                            </div>
                            <div class="space-4"></div>
                            <div class="row no-margin">
                                <div id="gridview">
                                    <asp:Literal ID="Receipthiddenid" runat="server" Visible="false"></asp:Literal>
                                    <asp:GridView ID="Receiptgrid" runat="server" AutoGenerateColumns="false" AllowSorting="true"
                                        class="table table-bordered table-hover " OnRowCommand="ReceiptgridViewDepart_RowCommand"
                                        OnRowDataBound="ReceiptgridViewDepart_RowDataBound" Width="100%" OnSorting="Receiptgrid_Sorting">
                                        <RowStyle BackColor="#f9f9f9" HorizontalAlign="Center" VerticalAlign="Top" />
                                        <AlternatingRowStyle BackColor="White" HorizontalAlign="Center" VerticalAlign="Top" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="序号" SortExpression="ID" >
                                                <ItemTemplate>
                                                    <asp:Button ID="btnDetail" CommandName="btnDetailCommand" CommandArgument='<%#Eval("ID") %>'  runat="server" Text="详细信息" Style="display: none;" />
                                                    <asp:Literal ID="LiteralId" runat="server" Text='<%#Eval("ID") %>' Visible="false"></asp:Literal>
                                                    <asp:Literal ID="LiteralIndex" runat="server" Text="<%# Container.DataItemIndex+1 +(AspNetPager1Receipt.CurrentPageIndex-1)*AspNetPager1Receipt.PageSize %>"></asp:Literal>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="规则名称" SortExpression="Name" ItemStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <%#Eval("Name")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="编码前缀" SortExpression="Prefix" >
                                                <ItemTemplate>
                                                    <%#Eval("Prefix")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="连接符" SortExpression="Connector1" >
                                                <ItemTemplate>
                                                    <%#Eval("Connector1")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="日期格式" SortExpression="TimeType" >
                                                <ItemTemplate>
                                                    <%#Eval("TimeType")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="连接符" SortExpression="Connector2" >
                                                <ItemTemplate>
                                                    <%#Eval("Connector2")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="流水号位数" SortExpression="DigistNum" >
                                                <ItemTemplate>
                                                    <%#Eval("DigistNum")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="起始流水号" SortExpression="StartSerial" >
                                                <ItemTemplate>
                                                    <%#Eval("StartSerial")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="示例" SortExpression="Example" ItemStyle-HorizontalAlign="Left" >
                                                <ItemTemplate>
                                                    <%#Eval("Example")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="row no-margin dataTables_wrapper_row">
                                <div class="col-xs-9 text-left">
                                    <webdiyer:AspNetPager ID="AspNetPager1Receipt" runat="server" Width="100%" CssClass="pages"
                                        FirstPageText="首页" LastPageText="尾页" PrevPageText="上页" NextPageText="下页" CurrentPageButtonClass="cpb"
                                        AlwaysShow="true" ShowCustomInfoSection="Left" ShowPageIndexBox="always" PageIndexBoxType="DropDownList"
                                        CustomInfoHTML="第<font color='red'><b>%currentPageIndex%</b></font>页，共%PageCount%页，共<font color='red'><b>%RecordCount%</b></font>条记录"
                                        OnPageChanged="AspNetPager1Receipt_PageChanged" PageSize="10">
                                    </webdiyer:AspNetPager>
                                </div>
                                <div class="col-xs-3 text-right">
                                    每页显示记录数：
                                    <asp:DropDownList ID="ddlReceiptpagesize" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlReceiptpagesize_SelectedIndexChanged">
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>20</asp:ListItem>
                                        <asp:ListItem>50</asp:ListItem>
                                        <asp:ListItem>100</asp:ListItem>
                                        <asp:ListItem>200</asp:ListItem>
                                    </asp:DropDownList>
                                    条
                                </div>
                            </div>
                        </asp:Panel>
                        <!-- PAGE CONTENT ENDS -->
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
