<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminCenter.Master" AutoEventWireup="true" CodeBehind="roleUIInfo.aspx.cs" Inherits="TestAccountSystem.roleUIInfo" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
        <ContentTemplate>
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="fa fa-home fa-fw home-icon"></i><a href="#"><%if (_Id == "1"){%>系统用户管理 <%   } %><%else{%>权限管理<%} %></a> </li>                                                                                                                                                                              
                    <li class="active"><%if (_Id == "1") {%>角色管理<%   } %><%else{%>角色权限分配<%} %></li>                                               
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
                        <div class="col-xs-12 form-horizontal">
                            <div class="col-xs-2 text-right" style="width: 120px; height: 32px">
                                <label class="control-label" for="txtChineseName">
                                    角色查询：</label>
                            </div>
                            <%--<label for="butApproxSearch" class="col-xs-1 control-label no-padding-right">&nbsp;&nbsp;&nbsp;&nbsp;模糊查询：</label>--%>
                            <div class="col-xs-4">
                                <asp:TextBox ID="TextBox1" class=" form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-xs-1 no-padding-left no-padding-right">
                                <asp:Button ID="Button1" runat="server" class="btn btn-default" Text="搜索" OnClick="Button1_Click" />
                            </div>
                            <asp:TextBox ID="txtId" runat="server" Visible="false"></asp:TextBox>
                            <asp:TextBox ID="txtRoleId" runat="server" Visible="false"></asp:TextBox>
                            <div class="form-group" style="margin-bottom: 5px;">
                                <div class="col-xs-2 text-right" style="width: 120px; height: 32px">
                                    <label class="control-label" for="txtChineseName">
                                        角色名称：</label>
                                </div>
                                <div class="col-xs-4" style="padding-left: 0px;">
                                    <asp:TextBox ID="txtRoleName" class=" form-control input-sm" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--   <div class="col-xs-12">
                        <br />
                        <div class="form-group">
                            <label for="txtId" class="col-xs-1 control-label no-padding-right">
                                角色名称：</label><div class="col-xs-2  no-padding-left no-padding-right">
                                    <asp:TextBox ID="txtRoleName" class=" form-control" runat="server"></asp:TextBox>
                                </div>
                        </div>
                    </div>--%>
                    <div class="form-group" style="margin-bottom: 20px">
                        <div class="row no-margin">
                            <div class="col-md-12 text-center">
                                <div class="btn-group" style="margin-top: 20px">
                                    <asp:Button ID="btnAdd" class="btn btn-default btn-sm" runat="server" Text="添加" OnClick="btnAdd_Click" />
                                    <asp:Button ID="btnAddSubmit" class="btn btn-default btn-sm" runat="server" Text="提交" OnClick="btnAddSubmit_Click" />
                                    <asp:Button ID="btnAddCancel" class="btn btn-default btn-sm" runat="server" Text="取消" OnClick="btnAddCancel_Click" />
                                    <asp:Button ID="btnUpdate" class="btn btn-default btn-sm" runat="server" Text="修改" OnClick="btnUpdate_Click" />
                                    <asp:Button ID="btnUpSubmit" class="btn btn-default btn-sm" runat="server" Text="保存" OnClick="btnUpSubmit_Click" />
                                    <asp:Button ID="btnUpCancel" class="btn btn-default btn-sm" runat="server" Text="取消" OnClick="btnUpCancel_Click" />
                                    <asp:Button ID="btnDel" class="btn btn-default btn-sm" runat="server" Text="删除" OnClick="btnDel_Click" OnClientClick="return confirm('确认删除此条记录？');"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="gridview" style="padding-top: 20px; margin-left: 0px; padding-left: 0px">
                        <asp:GridView ID="gvTable" runat="server" AutoGenerateColumns="false" AllowSorting="true" class="table table-bordered table-hover" Width="100%" DataKeyNames="ID" OnSorting="gvTable_Sorting" OnRowCommand="gvTable_RowCommand" OnRowDataBound="gvTable_RowDataBound">
                            <%--添加的 --%>
                            <RowStyle BackColor="#f9f9f9" HorizontalAlign="Center" VerticalAlign="Top" Font-Size="Small" />
                            <AlternatingRowStyle BackColor="White" HorizontalAlign="Center" VerticalAlign="Top" />
                            <%--添加的 --%>
                            <Columns>
                                <asp:TemplateField HeaderText="序号" SortExpression="id">
                                    <ItemTemplate>
                                        <asp:Literal ID="LiteralIndex" runat="server" Text="<%# Container.DataItemIndex+1 +(AspNetPager1.CurrentPageIndex-1)*AspNetPager1.PageSize %>"></asp:Literal>
                                        <asp:Literal ID="LiteralId" runat="server" Text='<%#Eval("ID") %>' Visible="false"></asp:Literal>
                                        <%-- <%#Eval("id") %>--%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--  <asp:TemplateField HeaderText="序号" SortExpression="ID">
                                    <ItemTemplate>
                                        <asp:Literal ID="LiteralId" runat="server" Text='<%#Eval("ID") %>' Visible="false"></asp:Literal>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="角色编号" SortExpression="roleId">
                                    <ItemTemplate>
                                        00<%#Eval("roleId") %>
                                        <%--<asp:Button ID="btnDetail" CommandName="btnDetailCommand" CommandArgument='<%#Eval("id") %>' runat="server" Text="详细信息" Style="display: none;" />--%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="角色名称" SortExpression="roleName">
                                    <ItemTemplate>
                                        <%#Eval("roleName") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="操作">
                                    <ItemTemplate>
                                        <%-- <%#Eval("isUseful") %>--%>
                                        <%--<asp:Button ID="btnDelete" runat="server"  CommandName="delete" CommandArgument='<%#Eval("id") %>' Text="删除" OnClientClick="javascript:if(confirm('确定删除此条数据信息?')){}else{return false;}"/>--%>
                                        <a href="javascript:void(0)" onclick="del(<%#Eval("id") %>)">删除</a>&nbsp;&nbsp;
                                    <a href="javascript:void(0)" onclick="selectRight('<%#Eval("roleId") %>')">设置权限</a>
                                        <asp:Button ID="btnDetail" CommandName="btnDetailCommand" CommandArgument='<%#Eval("id") %>' runat="server" Text="详细信息" Style="display: none;" />
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
                                OnPageChanged="AspNetPager1_PageChanged" PageSize="5">
                            </webdiyer:AspNetPager>
                        </div>
                        <div class="col-xs-3 text-right">
                            每页显示记录数：                                   
                    <asp:DropDownList ID="ddlpagesize" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlpagesize_SelectedIndexChanged">
                        <%--OnSelectedIndexChanged="ddlpagesize_SelectedIndexChanged"--%>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>50</asp:ListItem>

                    </asp:DropDownList>
                            条                              
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">
        function del(id) {
            if (confirm('确认要删除此角色信息？')) {
                //javascript:if(confirm('确认要删除此角色信息？'){}else{return false;})
                //return true;
                $.post("handler/rDel.ashx", { "id": id }, function (data) {
                    if (data == "ok") {
                        location.href = "roleUIInfo.aspx";
                    }
                });
            } else {
                return false;
            }
        }
        function selectRight(code) {
            $.fancybox.open({
                href: 'UserMenuDialog.aspx?RoleCode=' + code,
                type: 'iframe',
                padding: 5,
                width: 1000
            });
        };
        function selectOperation(code) {
            $.fancybox.open({
                href: 'UserMenuDialog.aspx?RoleCode=' + code,
                type: 'iframe',
                padding: 5,
                width: 1000
            });
        };

        function AfterSelectProject() {
            $.fancybox.close();
            window.parent.location.href = 'AdminLayout/Default.html';
        } /*<a href="AdminLayout/Default.html">AdminLayout/Default.html</a>*/
    </script>
</asp:Content>
