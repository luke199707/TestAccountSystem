<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminCenter.Master"
    AutoEventWireup="true" CodeBehind="QandAList.aspx.cs" Inherits="TestAccountSystem.QandAList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="fa fa-home fa-fw home-icon"></i><a href="#">帮助中心</a> </li>
                    <li class="active">使用帮助</li>
                </ul>
            </div>
            <!-- .breadcrumb -->
            <div class="page-content">
                <div class="page-header">
                    <h1>
                        <small><i class=" fa fa-angle-double-right fa-fw"></i>常见问题解决方法</small>
                    </h1>
                </div>
                <!-- /.page-header -->
                <div class="row no-margin">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="tabbable">
                            <ul class="nav nav-tabs padding-18 tab-size-bigger" id="myTab">
                                <li class="active">
                                    <a data-toggle="tab" href="#faq-tab-1">
                                        <i class="blue fa fa-question-circle fa-fw bigger-120"></i>
                                        General
                                    </a>
                                </li>

                                <li>
                                    <a data-toggle="tab" href="#faq-tab-2">
                                        <i class="green fa fa-edit fa-fw bigger-120"></i>
                                        RegistrationList
                                    </a>
                                </li>


                                <%-- 	<li>
										<a data-toggle="tab" href="#faq-tab-3">
											<i class="orange fa fa-user fa-fw bigger-120"></i>
											Account
										</a>
									</li>--%>

                                <li>
                                    <a data-toggle="tab" href="#faq-tab-3" id="dataBaseDiv" runat="server" visible="false">
                                        <i class="red fa fa-question fa-fw bigger-120"></i>
                                        DataBase
                                    </a>
                                </li>
                                <!-- /.dropdown -->
                            </ul>

                            <div class="tab-content no-border padding-24">
                                <div id="faq-tab-1" class="tab-pane fade in active">
                                    <h4 class="blue">
                                        <i class="fa fa-question-circle bigger-110"></i>系统常见问题
                                    </h4>

                                    <div class="space-8"></div>

                                    <div id="faq-list-1" class="panel-group accordion-style1 accordion-style2">
                                        <asp:DataList ID="dlQAndA1" runat="server" Width="100%">
                                            <ItemTemplate>
                                                <div class="panel panel-default">
                                                    <div class="panel-heading ">
                                                        <a href="#faq-1-<%# Container.ItemIndex + 1%>" data-parent="#faq-list-1" data-toggle="collapse" class="accordion-toggle collapsed">
                                                            <i class="icon-chevron-left pull-right" data-icon-hide="fa-chevron-down" data-icon-show="fa-chevron-left"></i>

                                                            <i class="icon-user bigger-130"></i>
                                                            &nbsp;<%# Container.ItemIndex + 1%>. <%#Eval("Question")%>
                                                        </a>
                                                    </div>

                                                    <div class="panel-collapse collapse" id="faq-1-<%# Container.ItemIndex + 1%>">
                                                        <div class="panel-body">
                                                            <%#Eval("Answer")%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </div>
                                </div>


                                <div id="faq-tab-2" class="tab-pane fade">
                                    <h4 class="blue">
                                        <i class="fa fa-edit bigger-110"></i>登记单常见问题
                                    </h4>

                                    <div class="space-8"></div>

                                    <div id="faq-list-2" class="panel-group accordion-style1 accordion-style2">
                                        <asp:DataList ID="dlQAndA2" runat="server" Width="100%">
                                            <ItemTemplate>
                                                <div class="panel panel-default">
                                                    <div class="panel-heading ">
                                                        <a href="#faq-2-<%# Container.ItemIndex + 1%>" data-parent="#faq-list-2" data-toggle="collapse" class="accordion-toggle collapsed">
                                                            <i class="icon-chevron-left pull-right" data-icon-hide="fa-chevron-down" data-icon-show="fa-chevron-left"></i>

                                                            <i class="icon-user bigger-130"></i>
                                                            &nbsp;<%# Container.ItemIndex + 1%>. <%#Eval("Question")%>
                                                        </a>
                                                    </div>

                                                    <div class="panel-collapse collapse" id="faq-2-<%# Container.ItemIndex + 1%>">
                                                        <div class="panel-body">
                                                            <%#Eval("Answer")%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </div>
                                </div>

                                <div id="faq-tab-3" class="tab-pane fade">
                                    <%--faq-tab-3--%>
                                    <h4 class="blue">
                                        <i class="fa fa-question bigger-110"></i>数据库常见问题
                                    </h4>

                                    <div class="space-8"></div>

                                    <div id="faq-list-3" class="panel-group accordion-style1 accordion-style2">
                                        <asp:DataList ID="dlQAndA3" runat="server" Width="100%">
                                            <ItemTemplate>
                                                <div class="panel panel-default">
                                                    <div class="panel-heading ">
                                                        <a href="#faq-3-<%# Container.ItemIndex + 1%>" data-parent="#faq-list-3" data-toggle="collapse" class="accordion-toggle collapsed">
                                                            <i class="icon-chevron-left pull-right" data-icon-hide="fa-chevron-down" data-icon-show="fa-chevron-left"></i>

                                                            <i class="icon-user bigger-130"></i>
                                                            &nbsp;<%# Container.ItemIndex + 1%>. <%#Eval("Question")%>
                                                        </a>
                                                    </div>

                                                    <div class="panel-collapse collapse" id="faq-3-<%# Container.ItemIndex + 1%>">
                                                        <div class="panel-body">
                                                            <%#Eval("Answer")%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </div>
                                </div>

                                <div id="faq-tab-4" class="tab-pane fade">
                                    <h4 class="blue">
                                        <i class="fa fa-credit-card bigger-110"></i>常见问题4
                                    </h4>

                                    <div class="space-8"></div>

                                    <div id="faq-list-4" class="panel-group accordion-style1 accordion-style2">
                                        <asp:DataList ID="dlQAndA4" runat="server" Width="100%">
                                            <ItemTemplate>
                                                <div class="panel panel-default">
                                                    <div class="panel-heading ">
                                                        <a href="#faq-4-<%# Container.ItemIndex + 1%>" data-parent="#faq-list-4" data-toggle="collapse" class="accordion-toggle collapsed">
                                                            <i class="icon-chevron-left pull-right" data-icon-hide="fa-chevron-down" data-icon-show="fa-chevron-left"></i>

                                                            <i class="icon-user bigger-130"></i>
                                                            &nbsp;<%# Container.ItemIndex + 1%>. <%#Eval("Question")%>
                                                        </a>
                                                    </div>

                                                    <div class="panel-collapse collapse" id="faq-4-<%# Container.ItemIndex + 1%>">
                                                        <div class="panel-body">
                                                            <%#Eval("Answer")%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- PAGE CONTENT ENDS -->
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
