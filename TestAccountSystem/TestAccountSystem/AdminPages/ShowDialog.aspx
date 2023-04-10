<%@  Language="C#" MasterPageFile="~/AdminPages/AdminCenter.Master" AutoEventWireup="true" CodeBehind="ShowDialog.aspx.cs" Inherits="TestAccountSystem.AdminPages.ShowDialog" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #imgDiv {
            left: 10px;
            top: 90px;
            width: 1350px;
            height: 700px;
            /*          background-color: red;*/
            position: absolute;
            z-index: 99;
            vertical-align: middle;
            text-align: center;
        }

        #parentDiv {
            position: relative;
        }

        img {
            width: 100%;
            height: auto;
        }
    </style>
    <script type="text/javascript">
        function myfunction(id) {
            $.post("../handler/getImgName.ashx", { "Id": id }, function (data) {           
                var path = "../UpLoadImg/" + data;
                    $("#showImg").attr("src", path);
                    $("#imgDiv").show();            
            });

        }
        $(function () {
            $("body").click(function () {
                $("#imgDiv").hide();
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div id="parentDiv">
                <div class="breadcrumbs" id="breadcrumbs">
                    <ul class="breadcrumb">
                        <li><i class="fa fa-home fa-fw home-icon"></i><a href="#">主页</a> </li>
                        <li class="active">
                            <label id="lbRoleName" runat="server">检验进度信息查询</label>
                        </li>
                    </ul>
                </div>

                <div class="page-content">

                    <div class="space-4">
                    </div>
                    <div class="row no-margin-left no-margin-right">
                        <div class="col-xs-12 form-horizontal">
                            <div class="form-group">
                                <div class="col-xs-12 no-padding-left no-padding-right">
                                    <span class="label label-primary label-lg">检验登记单编号: <%=_registerNum %></span>
                                    <%--<asp:Label ID="Label1" runat="server" Text="检验进度信息" CssClass="label label-primary label-lg"></asp:Label>--%>
                                    <asp:GridView ID="gdvLogDetail" runat="server" AutoGenerateColumns="false" AllowSorting="true"
                                        class="table table-bordered table-hover" Width="100%" OnSorting="gdvLogDetail_Sorting" ShowHeaderWhenEmpty="True">
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
                                            <%--  <asp:TemplateField HeaderText="检验订单编号" SortExpression="RegisterNumber">
                                            <ItemTemplate>
                                                <asp:Literal ID="LiteralRegisterNumber" runat="server" Text='<%#Eval("RegisterNumber")%>'></asp:Literal>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
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
                                                    <a href="javascript:void(0);" onclick="myfunction(<%#Eval("ID") %>);">查看图片</a>
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
                                </asp:DropDownList>
                                            条
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="display: none" id="imgDiv">
                <img src="" alt="图片不存在..." id="showImg" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
