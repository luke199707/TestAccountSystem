<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminCenter.Master" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="TestAccountSystem.AdminPages.RegistrationForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .labelDiv {
            width: 105px;
            height: 32px;
            padding-left: 0px;
            margin-top: 7px;
            /* style="width:105px;height:32px;padding-left:0px;"*/
        }

        .txtDiv {
            padding-left: 0px;
            width: 280px;
            height: 32px;
            /*style="padding-left:0px;width:280px;height:32px;"*/
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Literal ID="errorMessages" runat="server"></asp:Literal>
            <div class="breadcrumbs" id="breadcrumbs">
                <ol class="breadcrumb">
                    <i class="fa fa-home fa-fw home-icon"></i>
                    <li class="breadcrumb-item">登记单基本信息填写</li>
                    <li class="breadcrumb-item"><a href="#">船只基本信息填写</a></li>
                    <li class="breadcrumb-item"><a href="#">检验项目选择</a></li>
                </ol>
            </div>
            <%-- 检验登记单基本信息--%>
            <div class="container">
                <div class="row">
                    <h5><span class="label label-primary">检验登记单基本信息</span>(红色为必填项)</h5>
                </div>
                <div class="row">
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Literal ID="LiteralHiddenState" runat="server" Visible="false"></asp:Literal>
                        <asp:Label ID="Label2" runat="server" Text="检验登记单编号:" class="text-danger" for="txtRegisterNumber"></asp:Label>
                    </div>
                    <div class="col-sm-3 has-error txtDiv">
                        <asp:TextBox ID="txtRegisterNumber" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label3" runat="server" Text="船舶登记号：" class="text-danger" for="txtShipRegisterNumber"></asp:Label>
                    </div>
                    <div class="col-sm-3 has-error txtDiv">
                        <asp:TextBox ID="txtShipRegisterNumber" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label15" runat="server" Text="检验名称：" class="" for="txtInspectionName"></asp:Label>
                    </div>
                    <div class="col-sm-3 txtDiv">
                        <asp:TextBox ID="txtInspectionName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label16" runat="server" Text="验船师：" class="text-danger" for="ddlSurveyor"></asp:Label>
                    </div>
                    <div class="col-sm-3 has-error txtDiv">
                        <asp:DropDownList ID="ddlSurveyor" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label13" runat="server" Text="货币种类：" class="text-danger" for="ddlCurrency"></asp:Label>
                    </div>
                    <div class="col-sm-3 has-error txtDiv">
                        <asp:DropDownList ID="ddlCurrency" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label5" runat="server" Text="申请项目：" class="text-danger" for="ddlApplicationProject"></asp:Label>
                    </div>
                    <div class="col-sm-3 has-error txtDiv">
                        <asp:DropDownList ID="ddlApplicationProject" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                    <%-- <div class="col-sm-1">
                <asp:Label ID="Label56" runat="server" Text="*纳税人识别号：" class="text-danger" for="txtTaxpayerIdentificationNumber"></asp:Label>
            </div>
            <div class="col-sm-3 has-error">
                <asp:TextBox ID="txtTaxpayerIdentificationNumber" runat="server" CssClass="form-control"></asp:TextBox>
            </div>--%>
                    <%-- <div class="col-sm-1">
                <asp:Label ID="Label10" runat="server" Text="*业务类型：" class="text-danger" for="ddlBusinessName"></asp:Label>
            </div>
            <div class="col-sm-3 has-error">
                <asp:DropDownList ID="ddlBusinessName" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceBusinessName" DataTextField="BusinessName" DataValueField="BusinessName">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceBusinessName" runat="server" ConnectionString="<%$ ConnectionStrings:TestAccountSystemDBConnectionString %>" SelectCommand="SELECT [BusinessName] FROM [BusinessType]"></asp:SqlDataSource>
            </div>--%>
                </div>
                <br />
                <div class="row">
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label56" runat="server" Text="纳税人识别号：" class="text-danger" for="txtTaxpayerIdentificationNumber"></asp:Label>
                    </div>
                    <div class="col-sm-3 has-error txtDiv">
                        <asp:TextBox ID="txtTaxpayerIdentificationNumber" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label1" runat="server" Text="申请单位：" class="text-danger" for="txtApplicantCompany"></asp:Label>
                    </div>
                    <div class="col-sm-3 has-error txtDiv">
                        <asp:TextBox ID="txtApplicantCompany" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label4" runat="server" Text="申请人：" class="text-danger" for="txtApplicant"></asp:Label>
                    </div>
                    <div class="col-sm-3 has-error txtDiv">
                        <asp:TextBox ID="txtApplicant" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <%--<div class="col-sm-1">
                <asp:Label ID="Label6" runat="server" Text="*单位地址：" class="text-danger" for="txtApplicantCompanyAddress"></asp:Label>
            </div>
            <div class="col-sm-3 has-error">
                <asp:TextBox ID="txtApplicantCompanyAddress" runat="server" CssClass="form-control"></asp:TextBox>
            </div>--%>
                </div>
                <br />
                <div class="row">
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label6" runat="server" Text="单位地址：" class="text-danger" for="txtApplicantCompanyAddress"></asp:Label>
                    </div>
                    <div class="col-sm-3 has-error txtDiv">
                        <asp:TextBox ID="txtApplicantCompanyAddress" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label7" runat="server" Text="单位电话：" class="text-danger" for="txtApplicantPhone"></asp:Label>
                    </div>
                    <div class="col-sm-3 has-error txtDiv">
                        <asp:TextBox ID="txtApplicantPhone" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label8" runat="server" Text="开户银行账号：" class="text-danger" for="txtBankAccount"></asp:Label>
                    </div>
                    <div class="col-sm-3 has-error txtDiv">
                        <asp:TextBox ID="txtBankAccount" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <%--<div class="col-sm-1">
                <asp:Label ID="Label5" runat="server" Text="*申请项目：" class="text-danger" for="ddlApplicationProject"></asp:Label>
            </div>
            <div class="col-sm-3 has-error">
                <asp:DropDownList ID="ddlApplicationProject" runat="server" CssClass="form-control">                 
                </asp:DropDownList>
            </div>--%>
                </div>
                <br />
                <%--    <div class="row">
            <div class="col-sm-1">
                <asp:Label ID="Label56" runat="server" Text="*纳税人识别号：" class="text-danger" for="txtTaxpayerIdentificationNumber"></asp:Label>
            </div>
            <div class="col-sm-3 has-error">
                <asp:TextBox ID="txtTaxpayerIdentificationNumber" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>--%>
                <br />
                <div>
                    <div>
                        <asp:Label ID="Label17" runat="server" Text="备注：" class="" for="txtRemark"></asp:Label>
                    </div>
                    <div>
                        <asp:TextBox ID="txtRemark" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="space-4"></div>
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <asp:Button ID="btnSubmit" runat="server" Text="保存" class="btn btn-primary btn-lg btn-block" OnClick="btnSubmit_Click" />
                    </div>
                    <div class="col-sm-6">
                        <asp:Button ID="btnNext" runat="server" Text="下一步" class="btn btn-warning btn-lg btn-block" OnClick="btnNext_Click" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
