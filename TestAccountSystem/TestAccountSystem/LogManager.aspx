<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminCenter.Master" AutoEventWireup="true" CodeBehind="LogManager.aspx.cs" Inherits="TestAccountSystem.LogManager" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
        <Triggers>
            <asp:PostBackTrigger ControlID="btnExport" />
        </Triggers>
        <ContentTemplate>
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="fa fa-home fa-fw home-icon"></i><a href="#">日志管理</a> </li>
                    <li class="active">系统日志</li>
                </ul>
            </div>
            <div class="page-content" style="padding: 20px 20px 24px">
                <div class="row">
                    <div class="form-group">
                        <div class="col-xs-1" style="padding-left: 0px; padding-right: 0px;">
                            <asp:Literal ID="queryCondition" runat="server" Visible="false"></asp:Literal>
                            <asp:Literal ID="IRid" runat="server" Visible="false"></asp:Literal>
                        </div>
                    </div>
                    <div class="form-group ">
                        <label for="butApproxSearch" class="col-xs-1 control-label no-padding-right">&nbsp;&nbsp;&nbsp;&nbsp;日志查询：</label>
                        <div class="col-xs-4">
                            <asp:TextBox ID="TextBox1" class=" form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-xs-1 no-padding-left no-padding-right">
                            <asp:Button ID="btnSearch" runat="server" class="btn btn-default" Text="搜索" OnClick="btnSearch_Click" />
                        </div>
                        <asp:TextBox ID="txtId" runat="server" Visible="false"></asp:TextBox>
                        <asp:TextBox ID="txtRoleId" runat="server" Visible="false"></asp:TextBox>
                    </div>
                    
                    <div class="text-right">
                        <div class="btn-group">
                       <%--  <div class="text-right">--%>
                            <asp:Button ID="btnExport" runat="server" Text="导出全部日志" class="btn btn-default  btn-sm"
                                OnClick="btnExport_Click" OnClientClick="return confirm('确认导出信息？\n继续导出请单击确认按钮，稍后可点击页面底部的导出文件查看详情。')"/>
                            <%-- <asp:Button ID="btnPrint" runat="server" Text="打印" class="btn btn-default  btn-sm"
                                OnClick="btnPrint_Click" />--%>

                            <asp:Literal ID="ltConditon" runat="server" Visible="false"></asp:Literal>
                        </div>
                    </div>
                    
                    <div id="gridview" style="padding-top: 20px; margin-left: 0px; padding-left: 0px">
                        <asp:GridView ID="gvTable" runat="server" AutoGenerateColumns="false" AllowSorting="true" class="table table-bordered table-hover" Width="100%" DataKeyNames="ID" OnSorting="gvTable_Sorting" OnRowCommand="gvTable_RowCommand" OnRowDataBound="gvTable_RowDataBound">
                            <%--添加的 --%>
                            <RowStyle BackColor="#f9f9f9" HorizontalAlign="Center" VerticalAlign="Top" Font-Size="Small" />
                            <AlternatingRowStyle BackColor="White" HorizontalAlign="Center" VerticalAlign="Top" />
                            <%--添加的 --%>
                            <Columns>
                                <asp:TemplateField Visible="false">
                                    <ItemTemplate>
                                        <%#Eval("Id")%>
                                        <input type="hidden" name="name" value="" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="序号" SortExpression="ID" ItemStyle-Width="50">
                                    <ItemTemplate>

                                        <asp:Literal ID="LiteralIndex" runat="server" Text="<%# Container.DataItemIndex+1 +(AspNetPager1.CurrentPageIndex-1)*AspNetPager1.PageSize %>"></asp:Literal>
                                        <asp:Literal ID="LiteralId" runat="server" Text='<%#Eval("Id") %>' Visible="false"></asp:Literal>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="操作人" SortExpression="Name">
                                    <ItemTemplate>
                                        <%#Eval("Name") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="角色" SortExpression="Remark">
                                    <ItemTemplate>
                                        <%#Eval("Remark") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="IP地址" SortExpression="Ip">
                                    <ItemTemplate>
                                        <%#Eval("Ip") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="操作类型" SortExpression="Operation">
                                    <ItemTemplate>
                                        <%#Eval("Operation")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="操作时间" SortExpression="Time1">
                                    <ItemTemplate>
                                        <%#Eval("Time1")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="操作">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnDel" runat="server" CommandArgument='<%#Eval("Id") %>' CommandName="btnDel" OnClientClick="return confirm('确认删除此条记录？');">删除</asp:LinkButton>
                                       <%-- <a href="javascript:void(0);" onclick="del(<%#Eval("Id") %>);">删除</a>--%>
                                        <asp:Button ID="btnDetail" CommandName="btnDetailCommand" CommandArgument='<%#Eval("Id") %>' runat="server" Text="详细信息" Style="display: none;" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>

                        </asp:GridView>
                    </div>
                    <div class="row dataTables_wrapper_row" style="margin-right: 0px; margin-left: 0px">
                        <div class="col-xs-9 text-left " <%--style="margin-top:10px;"--%>>
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
                        <%--OnSelectedIndexChanged="ddlpagesize_SelectedIndexChanged"--%>
                        <%--  <asp:ListItem>5</asp:ListItem>--%>
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
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">
        function resetPwd(id) {
            if (confirm("确定要重置此用户的密码吗？")) {
                $.post("handler/resetPwd.ashx", { "Id": id }, function (data) {
                    if (data == "ok") {
                        alert('此用户密码重置成功了！');
                    } else {
                        alert('此用户密码重置失败了！');
                    }
                });

            } else {
                return false;
            }
        }

        function del(id) {
            if (confirm("确定要删除此条记录吗？")) {
                $.post("handler/logDel.ashx", { "Id": id }, function (data) {
                    if (data == "ok") {
                        location.href = "LogManager.aspx";
                    } else {
                        alert('删除记录失败！');
                    }
                });

            } else {
                return false;
            }
        }
    </script>
</asp:Content>
