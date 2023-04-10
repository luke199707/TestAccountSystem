<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminCenter.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="TestAccountSystem.AdminPages.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type ="text/css">
    * {
        margin: 0;
        padding: 0;
        border: 0;
    }

    .hoverMenu {
        cursor: pointer;
        background: #efefef;
        opacity: 0.8;
    }

    .title {
        display: inline-block;
        border: 1px solid #E8E8E8;
        padding: 15px;
        font-size: 25px;
        color: dodgerblue;
    }

    .row1 {
        list-style: none;
        width: 100%;
        min-width: 700px;
        height: 100px;
        margin: 0 auto;
        margin-bottom: 20px;
    }

        .row1 > li {
            display: inline-block;
            width: 31.66%;
            height: 100px;
            margin: 0 1%;
            /*border:1px dotted #C0C0C0;*/
            border: 1px solid rgba(0,0,0,.1);
            background: #58a linear-gradient(hsla(0,0%,100%,.2),.2),transparent;
            border-radius: 5px;
            box-shadow: 0 .05em .25em rgba(0,0,0,0.5);
            cursor: pointer;
        }

            .row1 > li:last-child {
                margin-right: 0;
            }

            .row1 > li:first-child {
                margin-left: 0;
            }

    .left {
        position: relative;
        padding: 10px;
        float: left;
        width: 30%;
        height: 100%;
        text-align: center;
        border-radius: 5px 0 0 5px;
    }

    .leftContent {
        position: absolute;
        top: 45%;
        left: 50%;
        transform: translate(-50%,-50%);
    }

    .leftText1 {
        float: left;
        width: 30px;
        height: 100%;
        line-height: 22px;
        font-size: 20px;
    }

    .right {
        display: inline-block;
        float: right;
        height: 100%;
        width: 70%;
    }

    .rightTop {
        width: 100%;
        position: relative;
        font-size: 14px;
        text-align: right;
        color: white;
    }

    .rightcenter {
        height: 50%;
        width: 100%;
        position: relative;
        font-size: 43px;
        text-align: center;
    }

    .rightbottom {
        width: 100%;
        text-align: center;
        padding-top: 4px;
        color: #428bca;
        font-size: 16px;
    }

    .Big_Top {
        width: 100%;
        height: 37px;
        font-size: 16px;
        text-align: center;
        line-height: 37px;
        color: #626262;
        padding: 0 15px;
        border-bottom: 1px solid rgba(0,0,0,.1);
    }

    .Big_Top_Right {
        display: block;
        float: right;
        background-color: #82af6f;
        font-size: 16px;
        line-height: 16px;
        margin: 6px 0;
        padding: 2px 0;
        color: white;
    }

    .Big_Center {
        width: 100%;
        font-size: 43px;
        text-align: center;
        height: 83%;
        position: relative;
        /*color:white;*/
    }

    .Big_Center_Content {
        position: absolute;
        height: 150px;
        width: 150px;
        margin: 5px auto;
        background: url(../StyleSheet/AdminloginResource/images/circle.png) no-repeat;
        text-align: center;
        top: 45%;
        left: 50%;
        transform: translate(-50%,-50%);
    }

    .Big_Center_Content_V {
        position: absolute;
        top: 45%;
        left: 50%;
        transform: translate(-50%,-50%);
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <contenttemplate>          
            <!-- .breadcrumb -->
            <div class="page-content" style="min-height:590px;">
                <div class="row col-xs-12">
                    <!-- PAGE CONTENT BEGINS -->
                    <div style="width:100%; height:63px;background-color:#e8e8e8;margin-bottom:5px;border:1px solid #F8F8F8">
						<div style="float:left;font-size:20px;padding:5px;">                           
                             <div  class="fa fa-user title" ></div>
                              欢迎使用<strong class="green">船级社检验计费管理系统</strong>
						</div>
				    </div>

                     <div  style="width:100%;min-width:1126px;">
                    <%--左侧统计--%>    
                       <div style="width:65%;float:left;margin-right:1.5%;"">
                       <div>
                                              <ul class="row1">
                                <li style="height:220px;">
                                     <a href='<%=_URL1 %>' class="details"><%--有修改--%>
                                        <div class="Big_Top">
                                            <span style="display:block;float:left"><%=_title1 %><%--待审核数据信息条数--%></span>  
                                            <span class="Big_Top_Right" style="background-color:#0ca294;"></span>                                    
                                        </div>
                                        <div class="Big_Center">
                                            <div class="Big_Center_Content">                                           
                                                <span class="Big_Center_Content_V"style="color:#626262!important;"><%=_num1 %></span>
                                            </div>                                                                                                                      
                                        </div
                                    </a>
                                </li> 
                                 <li style="height:220px;"> 
                                      <a href='<%=_URL2 %>' class="details"><%--有修改--%>
                                        <div class="Big_Top">
                                            <span style="display:block;float:left"><%=_title2 %><%--正在检验中数据信息条数--%></span>  
                                            <span class="Big_Top_Right" style="background-color:#0ca294;"></span>                                    
                                        </div>
                                        <div class="Big_Center">
                                            <div class="Big_Center_Content">                                           
                                                <span class="Big_Center_Content_V"style="color:#626262!important;"><%=_num2 %></span>
                                            </div>                                                                                                                      
                                        </div>         
                                    </a>
                                </li>    
                                <li style="height:220px;"> 
                                     <a href='<%=_URL3 %>' class="details"><%--有修改--%>
                                        <div class="Big_Top">
                                            <span style="display:block;float:left"><%=_title3 %><%--检验完成数据信息条数--%></span>  
                                            <span class="Big_Top_Right" style="background-color:#0ca294;"></span>                                    
                                        </div>
                                        <div class="Big_Center">
                                            <div class="Big_Center_Content">                                           
                                                <span class="Big_Center_Content_V"style="color:#626262!important;"><%=_num3 %></span>
                                            </div>                                                                                                                      
                                        </div>    
                                    </a>
                                </li>     
                            </ul>                
                           </div>
                           
                           <div style="margin-top:140px">                  
                                              <ul class="row1">
                                <li style="height:220px;"> 
                                     <a href='<%=_URL4 %>' class="details"><%--有修改--%>
                                        <div class="Big_Top">
                                            <span style="display:block;float:left"><%=_title4 %><%--待缴费数据信息条数--%></span>  
                                            <span class="Big_Top_Right" style="background-color:#0ca294;"></span>                                    
                                        </div>
                                        <div class="Big_Center">
                                            <div class="Big_Center_Content">                                           
                                                <span class="Big_Center_Content_V"style="color:#626262!important;"><%=_num4 %></span>
                                            </div>                                                                                                                      
                                        </div
                                    </a>
                                </li> 
                                 <li style="height:220px;"> 
                                      <a href='<%=_URL5 %>' class="details"><%--有修改--%>
                                        <div class="Big_Top">
                                            <span style="display:block;float:left;"><%=_title5 %><%--审核未通过信息条数--%></span>  
                                            <span class="Big_Top_Right" style="background-color:#0ca294;"></span>                                    
                                        </div>
                                        <div class="Big_Center">
                                            <div class="Big_Center_Content">                                           
                                                <span class="Big_Center_Content_V"style="color:#626262!important;"><%=_num5 %></span>
                                            </div>                                                                                                                      
                                        </div>         
                                    </a>
                                </li>    
                                <li style="height:220px;"> 
                                     <a href='<%=_URL6 %>' class="details"><%--有修改--%>
                                        <div class="Big_Top">
                                            <span style="display:block;float:left"><%=_title6 %><%--数据信息--%></span>  
                                            <span class="Big_Top_Right" style="background-color:#0ca294;"></span>                                    
                                        </div>
                                        <div class="Big_Center">
                                            <div class="Big_Center_Content">                                           
                                                <span class="Big_Center_Content_V"style="color:#626262!important;"><%=_num6 %></span>
                                            </div>                                                                                                                      
                                        </div>    
                                    </a>
                                </li>     
                            </ul>  
                               </div>
                  </div>              
                      <%--右侧留言--%>
                <%-- 在线会员 <%=TestAccountSystem.Global.onLineUserNum %>；
                         在线管理员<%=TestAccountSystem.Global.onLineAdminNum %>--%>
                    </div>
                
                
        </contenttemplate>
    </asp:UpdatePanel>
</asp:Content>
