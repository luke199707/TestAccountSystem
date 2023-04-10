<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminCenter.Master" AutoEventWireup="true" CodeBehind="QandAEdit.aspx.cs" Inherits="TestAccountSystem.QandAEdit" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%--<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="fa fa-home fa-fw home-icon"></i><a href="#">帮助中心</a> </li>
                    <li class="active">使用帮助维护</li>
                </ul>
            </div>
            <!-- .breadcrumb -->
            <div class="page-content">
                <div class="row no-margin">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="row no-margin">
                            <div id="Div1">
                                <asp:Literal ID="hiddenId" runat="server" Visible="false"></asp:Literal>
                                <%--<asp:TextBox ID="txtHiddenId" runat="server" Visible="false"></asp:TextBox>--%>
                                <asp:GridView ID="gvTable" runat="server" AutoGenerateColumns="false" AllowSorting="true"
                                    class="table table-bordered table-hover" Width="100%" OnRowCommand="gvTable_RowCommand"
                                    OnRowDataBound="gvTable_RowDataBound" OnSorting="gvTable_Sorting">
                                    <RowStyle BackColor="#f9f9f9" HorizontalAlign="Center" />
                                    <AlternatingRowStyle BackColor="#ffffff" HorizontalAlign="Center" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" SortExpression="ID" ItemStyle-Width="5%">
                                            <ItemTemplate>
                                                <asp:Button ID="btnDetail" CommandName="btnDetailCommand" CommandArgument='<%#Eval("ID") %>'
                                                    runat="server" Text="详细信息" Style="display: none;" />
                                                <%-- 第一列编号 --%>
                                                <asp:Literal ID="LiteralIndex" runat="server" Text="<%# Container.DataItemIndex+1 %>"></asp:Literal>
                                                <asp:Literal ID="LiteralId" runat="server" Text='<%#Eval("ID") %>' Visible="false"></asp:Literal>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="问题标题" SortExpression="Question" ItemStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <%#Eval("Question")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="问题答案" SortExpression="answer">
                                            <ItemTemplate>
                                                <%#Eval("answer")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="编辑时间" SortExpression="remark1">
                                            <ItemTemplate>
                                                <%#FormatDateTime(Eval("remark1").ToString())%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <div class="row no-margin dataTables_wrapper_row">
                            <div class="col-xs-9 text-left">
                                <webdiyer:AspNetPager ID="AspNetPager1" runat="server" Width="100%" CssClass="pages"
                                    CurrentPageButtonClass="cpb" AlwaysShow="true" ShowCustomInfoSection="Left" ShowPageIndexBox="always"
                                    FirstPageText="首页" LastPageText="尾页" PrevPageText="上页" NextPageText="下页" PageIndexBoxType="DropDownList"
                                    CustomInfoHTML="第<font color='red'><b>%currentPageIndex%</b></font>页，共%PageCount%页，共<font color='red'><b>%RecordCount%</b></font>条记录"
                                    PageSize="5" OnPageChanged="AspNetPager1_PageChanged">
                                </webdiyer:AspNetPager>
                            </div>
                            <div class="col-xs-3 text-right">
                                每页显示记录数：
                                <asp:DropDownList ID="ddlpagesize" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlpagesize_SelectedIndexChanged">
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
                        <%-- <div class="space-4">
                        </div>--%>
                        <div class="row no-margin">
                            <div class="col-xs-6 text-center col-xs-offset-3">
                                <br />
                                <div class="btn-group">
                                    <asp:Button ID="btnAdd" runat="server" Text="添加" class="btn btn-default btn-sm" OnClick="btnAdd_Click" />
                                    <asp:Button ID="btnModify" runat="server" Text="修改" class="btn btn-default  btn-sm"
                                        OnClick="btnModify_Click" />
                                    <asp:Button ID="btnDelete" runat="server" Text="删除" class="btn btn-default btn-sm"
                                        OnClientClick="return confirm('确认要删除该条问题吗？');" OnClick="btnDelete_Click" />
                                    <asp:Button ID="btnSave" runat="server" Text="保存" class="btn btn-default btn-sm"
                                        OnClick="btnSave_Click" />
                                    <asp:Button ID="btnConfirm" runat="server" Text="确定" class="btn btn-default btn-sm"
                                        OnClick="btnConfirm_Click" />
                                    <asp:Button ID="btnCancel" runat="server" Text="取消" class="btn btn-default btn-sm"
                                        OnClick="btnCancel_Click" />
                                </div>
                            </div>
                        </div>

                        <div class="row no-margin form-horizontal">

                            <div class="form-group">
                                <label for="txtQuestion" class="col-xs-1 control-label" style="padding-right: 0px;">
                                    问题标题：</label>
                                <div class="col-xs-11">
                                    <asp:TextBox ID="txtQuestion" runat="server" class="form-control" Width="90%" Height="35px" Wrap="True" Style="overflow-y: visible" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="txtQuestion" class="col-xs-1 control-label" style="padding-right: 0px;">
                                    问题类型：</label>
                                <div class="col-xs-11">
                                    <asp:DropDownList ID="ddlQuestionType" runat="server" class="form-control" Width="90%" Height="35px" Wrap="True" Style="overflow-y: visible"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="内容" class="col-xs-1 control-label" style="padding-right: 0px;">
                                    问题回答：</label>
                                <div class="col-xs-11">
                                    <%--<div id="editor"></div>不知道怎么取值--%>
                                    <asp:TextBox ID="txtAnswer" class="form-control" runat="server" TextMode="MultiLine" Width="90%" Height="200px" Wrap="True" Style="overflow-y: visible"></asp:TextBox>
                                    <%-- <CKEditor:CKEditorControl ID="ckEditor" BasePath="~/ckeditor/" FilebrowserImageUploadUrl="ckeditor/ImageUpload.ashx"  runat="server"></CKEditor:CKEditorControl>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
        CKEDITOR.replace('editor');
    </script>
</asp:Content>
