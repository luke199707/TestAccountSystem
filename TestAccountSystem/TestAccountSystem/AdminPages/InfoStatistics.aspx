<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminCenter.Master" AutoEventWireup="true" CodeBehind="InfoStatistics.aspx.cs" Inherits="TestAccountSystem.AdminPages.InfoStatistics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function myfunction(flag) {
            if (flag == 7) {
                $("#showImg").attr("src", "../Test.aspx?flag=7");
            } else if (flag == 180) {
                $("#showImg").attr("src", "../Test.aspx?flag=180");
            } else if (flag == 365) {
                $("#showImg").attr("src", "../Test.aspx?flag=365");
            }
        }
        function myfunctionPage2(flag) {
            if (flag == 7) {
                $("#showImgPage2").attr("src", "../Test.aspx?flag=7money");
            } else if (flag == 180) {
                $("#showImgPage2").attr("src", "../Test.aspx?flag=180money");
            } else if (flag == 365) {
                $("#showImgPage2").attr("src", "../Test.aspx?flag=365money");
            }
        }
    </script>
    <%-- <style type="text/css">
        .imageDiv{
            width:100%;
            height:100%;
            text-align:center;
            vertical-align:middle;
        }
        .showImg{
            width:auto;
            height:100%;
        }
    </style>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <%--page1 begin--%>
            <div class="breadcrumbs" id="breadcrumbs" runat="server" visible="false">
                <ul class="breadcrumb">
                    <li><i class="fa fa-home fa-fw home-icon"></i><a href="#">查询统计</a> </li>
                    <li class="active">检验登记单统计</li>
                </ul>
            </div>
            <%--page1 end--%>
            <%--page2 begin--%>
            <div class="breadcrumbs" id="moneyDiv" runat="server" visible="false">
                <ul class="breadcrumb">
                    <li><i class="fa fa-home fa-fw home-icon"></i><a href="#">查询统计</a> </li>
                    <li class="active">营业额统计</li>
                </ul>
            </div>
            <%--page2 end--%>
            <br />
            <%--page1--%> 
            <div class="row center" runat="server" id="page1Div" visible="false">
                <span><a class="btn btn-success" href="#" onclick="myfunction(7);">近一周</a></span>
                <span><a class="btn btn-info" href="#" onclick="myfunction(180);">近半年</a></span>
                <span><a class="btn btn-warning" href="#" onclick="myfunction(365);">近一年</a></span>
            </div>
            <%--page2--%>
            <div class="row center" runat="server" id="page2Div" visible="false">
                <span><a class="btn btn-success" href="#" onclick="myfunctionPage2(7);">近一周</a></span>
                <span><a class="btn btn-info" href="#" onclick="myfunctionPage2(180);">近半年</a></span>
                <span><a class="btn btn-warning" href="#" onclick="myfunctionPage2(365);">近一年</a></span>
            </div>
            <div id="imageDiv" style="margin-left: 0px; margin-top: 20px;" runat="server" visible="false">
                <img src="../Test.aspx?flag=7" alt="Alternate Text" id="showImg" />
            </div>
             <div id="imageDivPage2" style="margin-left: 0px; margin-top: 20px;" runat="server" visible="false">
                <img src="../Test.aspx?flag=7money" alt="Alternate Text" id="showImgPage2" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
