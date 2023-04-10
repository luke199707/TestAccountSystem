<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminCenter.Master" AutoEventWireup="true" CodeBehind="ShipInfoForm.aspx.cs" Inherits="TestAccountSystem.AdminPages.ShipInfoForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        .labelDiv{
            width:115px;
            height:32px;
            padding-left:0px;
            margin-top:7px;
           /* style="width:105px;height:32px;padding-left:0px;"*/
        }
        .txtDiv{
            padding-left:0px;
            width:270px;
            height:32px;
            /*style="padding-left:0px;width:280px;height:32px;"*/
        }
        .checkBoxDiv{
            width:146px;
            height:32px;         
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Literal ID="errorMessages" runat="server"></asp:Literal>
            <div class="breadcrumbs" id="breadcrumbs">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="RegistrationForm.aspx">登记单基本信息填写</a></li>
                    <%--   <li class="breadcrumb-item">船只基本信息填写</li>
            <li class="breadcrumb-item"><a href="ChooseChargeProject.aspx">检验项目选择</a></li>--%>
                    <li class="breadcrumb-item">船只基本信息填写</li>
                    <li class="breadcrumb-item"><a href="#">检验项目选择</a></li>
                </ol>
            </div>
            <%--船只基本信息--%>
            <div class="container">
                <div class="row">
                    <h5><span class="label label-warning">船只基本信息</span>（红色为必填项）</h5>
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
                        <asp:Label ID="Label3" runat="server" Text="船舶登记号:" class="text-danger" for="txtShipRegisterNumber"></asp:Label>
                    </div>
                    <div class="col-sm-3 has-error txtDiv">
                        <asp:TextBox ID="txtShipRegisterNumber" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label53" runat="server" Text="调节系数:" class="" for="txtAdjustmentFactor"></asp:Label>
                    </div>
                    <div class="col-sm-3 txtDiv">
                        <asp:TextBox ID="txtAdjustmentFactor" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label19" runat="server" Text="船名称:" class="text-danger" for="txtShipName"></asp:Label>
                    </div>
                    <div class="col-sm-3 has-error txtDiv">
                        <asp:TextBox ID="txtShipName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label20" runat="server" Text="船旗:" class="text-danger" for="ddlFlag"></asp:Label>
                    </div>
                    <div class="col-sm-3 has-error txtDiv">
                        <asp:DropDownList ID="ddlFlag" runat="server" CssClass="form-control">
                    
                        </asp:DropDownList>
                    </div>
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label21" runat="server" Text="船级:" class="text-danger" for="ddlShipClass"></asp:Label>
                    </div>
                    <div class="col-sm-3 has-error txtDiv">
                        <asp:DropDownList ID="ddlShipClass" runat="server" CssClass="form-control">
                          
                        </asp:DropDownList>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label22" runat="server" Text="航区:" class="text-danger" for="ddlSailArea"></asp:Label>
                    </div>
                    <div class="col-sm-3 has-error txtDiv">
                        <asp:DropDownList ID="ddlSailArea" runat="server" CssClass="form-control">
                        
                        </asp:DropDownList>
                    </div>
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label23" runat="server" Text="海河船:" class="text-danger" for="ddlSeaRiverShip"></asp:Label>
                    </div>
                    <div class="col-sm-3 has-error txtDiv">
                        <asp:DropDownList ID="ddlSeaRiverShip" runat="server" CssClass="form-control">
                         
                        </asp:DropDownList>
                    </div>
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label24" runat="server" Text="是否条例船:" class="text-danger" for="ddlOrdinanceShip"></asp:Label>
                    </div>
                    <div class="col-sm-3 has-error txtDiv">
                        <asp:DropDownList ID="ddlOrdinanceShip" runat="server" CssClass="form-control">
                          
                        </asp:DropDownList>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label25" runat="server" Text="完工日期:" class="text-danger" for="txtCompletionDate"></asp:Label>
                    </div>
                    <div class="col-sm-3 has-error txtDiv">
                        <asp:TextBox ID="txtCompletionDate" runat="server" CssClass="form-control" onclick="WdatePicker()"></asp:TextBox>
                    </div>
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label26" runat="server" Text="船型:" class="text-danger" for="ddlShipType"></asp:Label>
                    </div>
                    <div class="col-sm-3 has-error txtDiv">
                        <asp:DropDownList ID="ddlShipType" runat="server" CssClass="form-control">
                           
                        </asp:DropDownList>
                    </div>
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label27" runat="server" Text="总吨位:" class="" for="txtGrossTonnage"></asp:Label>
                    </div>
                    <div class="col-sm-3 txtDiv">
                        <asp:TextBox ID="txtGrossTonnage" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label28" runat="server" Text="载重吨:" class="" for="txtDeadweight"></asp:Label>
                    </div>
                    <div class="col-sm-3 txtDiv">
                        <asp:TextBox ID="txtDeadweight" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label29" runat="server" Text="船长:" class="" for="txtShipLength"></asp:Label>
                    </div>
                    <div class="col-sm-3 txtDiv">
                        <asp:TextBox ID="txtShipLength" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label30" runat="server" Text="型宽:" class="" for="txtTypeWidth"></asp:Label>
                    </div>
                    <div class="col-sm-3 txtDiv">
                        <asp:TextBox ID="txtTypeWidth" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label31" runat="server" Text="型深:" class="" for="txtTypeDepth"></asp:Label>
                    </div>
                    <div class="col-sm-3 txtDiv">
                        <asp:TextBox ID="txtTypeDepth" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label32" runat="server" Text="主机总功率(Kw):" class="" for="txtTotalHostPower"></asp:Label>
                    </div>
                    <div class="col-sm-3 txtDiv">
                        <asp:TextBox ID="txtTotalHostPower" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label33" runat="server" Text="电源功率总和(Kw):" class="" for="txtTotalPower"></asp:Label>
                    </div>
                    <div class="col-sm-3 txtDiv">
                        <asp:TextBox ID="txtTotalPower" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label34" runat="server" Text="主机型式:" class="" for="ddlHostType"></asp:Label>
                    </div>
                    <div class="col-sm-3 txtDiv">
                        <asp:DropDownList ID="ddlHostType" runat="server" CssClass="form-control">
                            <asp:ListItem>电缆船</asp:ListItem>
                            <asp:ListItem>油船</asp:ListItem>
                            <asp:ListItem>散货船</asp:ListItem>
                            <asp:ListItem>集装箱货船</asp:ListItem>
                            <asp:ListItem>其他</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label35" runat="server" Text="船体材料:" class="" for="ddlShipMaterial"></asp:Label>
                    </div>
                    <div class="col-sm-3 txtDiv">
                        <asp:DropDownList ID="ddlShipMaterial" runat="server" CssClass="form-control">
                         
                        </asp:DropDownList>
                    </div>
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label36" runat="server" Text="冰区加强:" class="" for="ddlIceStrengthening"></asp:Label>
                    </div>
                    <div class="col-sm-3 txtDiv">
                        <asp:DropDownList ID="ddlIceStrengthening" runat="server" CssClass="form-control">
                         
                        </asp:DropDownList>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label37" runat="server" Text="侧推装置:" class="" for="ddlSidePushDevice"></asp:Label>
                    </div>
                    <div class="col-sm-3 txtDiv">
                        <asp:DropDownList ID="ddlSidePushDevice" runat="server" CssClass="form-control">
                        
                        </asp:DropDownList>
                    </div>
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label38" runat="server" Text="推进器种类:" class="" for="ddlPropellerType"></asp:Label>
                    </div>
                    <div class="col-sm-3 txtDiv">
                        <asp:DropDownList ID="ddlPropellerType" runat="server" CssClass="form-control">
                          
                        </asp:DropDownList>
                    </div>
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label39" runat="server" Text="变速齿轮箱:" class="" for="ddlGearbox"></asp:Label>
                    </div>
                    <div class="col-sm-3 txtDiv">
                        <asp:DropDownList ID="ddlGearbox" runat="server" CssClass="form-control">
                          
                        </asp:DropDownList>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label40" runat="server" Text="液力传动:" class="" for="ddlHydraulicTransmission"></asp:Label>
                    </div>
                    <div class="col-sm-3 txtDiv">
                        <asp:DropDownList ID="ddlHydraulicTransmission" runat="server" CssClass="form-control">
                        
                        </asp:DropDownList>
                    </div>
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label41" runat="server" Text="自动化功率:" class="" for="ddlAutomationPower"></asp:Label>
                    </div>
                    <div class="col-sm-3 txtDiv">
                        <asp:DropDownList ID="ddlAutomationPower" runat="server" CssClass="form-control">
                       
                        </asp:DropDownList>
                    </div>
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label42" runat="server" Text="自动化等级:" class="" for="ddlAutomationLevel"></asp:Label>
                    </div>
                    <div class="col-sm-3 txtDiv">
                        <asp:DropDownList ID="ddlAutomationLevel" runat="server" CssClass="form-control">
                           
                        </asp:DropDownList>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label43" runat="server" Text="冷藏总容积:" class="" for="txtTotalRefrigeratedVolume"></asp:Label>
                    </div>
                    <div class="col-sm-3 txtDiv">
                        <asp:TextBox ID="txtTotalRefrigeratedVolume" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label44" runat="server" Text="冷藏舱数:" class="" for="txtNumberOfRefrigeratedCompartments"></asp:Label>
                    </div>
                    <div class="col-sm-3 txtDiv">
                        <asp:TextBox ID="txtNumberOfRefrigeratedCompartments" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label45" runat="server" Text="冷藏机组数:" class="" for="txtNumberOfRefrigeratedUnits"></asp:Label>
                    </div>
                    <div class="col-sm-3 txtDiv">
                        <asp:TextBox ID="txtNumberOfRefrigeratedUnits" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label46" runat="server" Text="压载舱容:" class="" for="txtBallastTankCapacity"></asp:Label>
                    </div>
                    <div class="col-sm-3 txtDiv">
                        <asp:TextBox ID="txtBallastTankCapacity" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label47" runat="server" Text="船员人数:" class="" for="txtNumberOfCrew"></asp:Label>
                    </div>
                    <div class="col-sm-3 txtDiv">
                        <asp:TextBox ID="txtNumberOfCrew" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label48" runat="server" Text="乘客人数:" class="" for="txtNumberOfPassengers"></asp:Label>
                    </div>
                    <div class="col-sm-3 txtDiv">
                        <asp:TextBox ID="txtNumberOfPassengers" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label49" runat="server" Text="液化气舱总容积:" class="" for="txtTotalVolumeOfLiquefiedGasTank"></asp:Label>
                    </div>
                    <div class="col-sm-3 txtDiv">
                        <asp:TextBox ID="txtTotalVolumeOfLiquefiedGasTank" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label50" runat="server" Text="散装货船协调附加标志:" class="" for="txtAdditionalSign"></asp:Label>
                    </div>
                    <div class="col-sm-3 txtDiv">
                        <asp:TextBox ID="txtAdditionalSign" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label51" runat="server" Text="防火等级:" class="" for="txtFireProofLevel"></asp:Label>
                    </div>
                    <div class="col-sm-3 txtDiv">
                        <asp:TextBox ID="txtFireProofLevel" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-sm-1 labelDiv text-right">
                        <asp:Label ID="Label52" runat="server" Text="动力定位系统:" class="" for="txtDynamicPositioningSystem"></asp:Label>
                    </div>
                    <div class="col-sm-3 txtDiv">
                        <asp:TextBox ID="txtDynamicPositioningSystem" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <br />
                <div>
                    <div class="">
                        <asp:Label ID="Label54" runat="server" Text="船体其他信息:" class="" for="txtOtherInformation"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-1 checkBoxDiv">
                        <asp:CheckBox ID="ckbAntiCorrosionDevice" runat="server" Text="防腐蚀装置" class="checkbox" />
                    </div>
                    <div class="col-sm-1 checkBoxDiv">
                        <asp:CheckBox ID="ckbHeavyCargoStrengthening" runat="server" Text="重货加强" class="checkbox" />
                    </div>
                    <div class="col-sm-1 checkBoxDiv">
                        <asp:CheckBox ID="cbkVariablePitch" runat="server" Text="可变螺距" class="checkbox" />
                    </div>
                    <div class="col-sm-1 checkBoxDiv">
                        <asp:CheckBox ID="cbkZPropeller" runat="server" Text="Z型推进器" class="checkbox" />
                    </div>
                    <div class="col-sm-1 checkBoxDiv">
                        <asp:CheckBox ID="cbkElectricPropulsion" runat="server" Text="电力推进" class="checkbox" />
                    </div>
                    <div class="col-sm-1 checkBoxDiv">
                        <asp:CheckBox ID="cbkInertGasDeviceProtection" runat="server" Text="惰性气体装置保护" class="checkbox" />
                    </div>
                    <div class="col-sm-1 checkBoxDiv">
                        <asp:CheckBox ID="cbkHelicopterPlatform" runat="server" Text="直升机平台" class="checkbox" />
                    </div>
                    <div class="col-sm-1 checkBoxDiv">
                        <asp:CheckBox ID="cbkDivingEquipment" runat="server" Text="潜水装置" class="checkbox" />
                    </div>
                    <div class="col-sm-1 checkBoxDiv">
                        <asp:CheckBox ID="cbkDynamicPositioning" runat="server" Text="动力定位" class="checkbox" />
                    </div>
                    <div class="col-sm-1 checkBoxDiv">
                        <asp:CheckBox ID="cbkOnlyMeetA329" runat="server" Text="仅满足A329" class="checkbox" />
                    </div>
                    <div class="col-sm-1 checkBoxDiv">
                        <asp:CheckBox ID="cbkCrudeOilWashing" runat="server" Text="原油洗舱" class="checkbox" />
                    </div>
                    <div class="col-sm-1 checkBoxDiv">
                        <asp:CheckBox ID="cbkDedicatedBallastTank" runat="server" Text="专用压载舱" class="checkbox" />
                    </div>
                    <div class="col-sm-1 checkBoxDiv">
                        <asp:CheckBox ID="cbkReliquefactionRefrigeration" runat="server" Text="再液化制冷" class="checkbox" />
                    </div>
                    <div class="col-sm-1 checkBoxDiv">
                        <asp:CheckBox ID="cbkMethaneCombustion" runat="server" Text="甲烷燃烧" class="checkbox" />
                    </div>
                    <div class="col-sm-1 checkBoxDiv">
                        <asp:CheckBox ID="cbkWithGMDSS" runat="server" Text="有GMDSS" class="checkbox" />
                    </div>
                   <div class="col-sm-1 checkBoxDiv">
                        <asp:CheckBox ID="cbkWithIceBreakingAbility" runat="server" Text="具有破冰能力" class="checkbox" />
                    </div>
                </div>
                <div class="row">
                    
                    
                    <div class="col-sm-1 checkBoxDiv">
                        <asp:CheckBox ID="cbkBottomReinforcement" runat="server" Text="坐底作业船底加强" class="checkbox" />
                    </div>
                    <div class="col-sm-1 checkBoxDiv">
                        <asp:CheckBox ID="cbkSinglePointMooring" runat="server" Text="单点系泊（油船）" class="checkbox" />
                    </div>
                    <div class="col-sm-1 checkBoxDiv">
                        <asp:CheckBox ID="cbkCargoRefrigerationQuickFreezing" runat="server" Text="货物冷藏及速冻" class="checkbox" />
                    </div>
                    <div class="col-sm-1 checkBoxDiv">
                        <asp:CheckBox ID="cbkGasReliquefaction" runat="server" Text="气体再液化" class="checkbox" />
                    </div>
                  
                    <div class="col-sm-1 checkBoxDiv">
                        <asp:CheckBox ID="cbkTurbineSideThruster" runat="server" Text="轮机侧推装置" class="checkbox" />
                    </div>
                    <div class="col-sm-1 checkBoxDiv">
                        <asp:CheckBox ID="cbkSCM" runat="server" Text="SCM" class="checkbox" />
                    </div>
                       <div class="col-sm-1 checkBoxDiv">
                        <asp:CheckBox ID="cbkECM" runat="server" Text="ECM" class="checkbox" />
                    </div>
                    <div class="col-sm-1 checkBoxDiv">
                        <asp:CheckBox ID="cbkPMS" runat="server" Text="PMS" class="checkbox" />
                    </div>
                </div>
                <div class="row">               
                    <div class="col-sm-1 checkBoxDiv">
                        <asp:CheckBox ID="cbkWaterJetPropulsionDevice" runat="server" Text="喷水推进装置" class="checkbox" />
                    </div>
                    <div class="col-sm-1 checkBoxDiv">
                        <asp:CheckBox ID="cbkSelfUnloadingSystem" runat="server" Text="自卸货系统" class="checkbox" />
                    </div>
                    <div class="col-sm-1 checkBoxDiv">
                        <asp:CheckBox ID="cbkSteamControlSystem" runat="server" Text="蒸汽控制系统" class="checkbox" />
                    </div>
                    <div class="col-sm-1 checkBoxDiv">
                        <asp:CheckBox ID="cbkHelicopterFacility" runat="server" Text="直升机设施" class="checkbox" />
                    </div>
                    <div class="col-sm-1 checkBoxDiv">
                        <asp:CheckBox ID="cbkCommonNorm" runat="server" Text="共同规范" class="checkbox" />
                    </div>
                    <div class="col-sm-1 checkBoxDiv">
                        <asp:CheckBox ID="cbkDirectCalculation" runat="server" Text="直接计算" class="checkbox" />
                    </div>
                    
                </div>
                <div class="row">
                      <div class="col-sm-1" style=" width:292px;height:32px;">
                        <asp:CheckBox ID="cbkInRefrigeratedContainer" runat="server" Text="舱内装载冷藏集装箱" class="checkbox" />
                    </div>
                     <div class="col-sm-1" style=" width:292px;height:32px;">
                        <asp:CheckBox ID="cbkQualifiedProfessionalTestingCompanyForInspection" runat="server" Text="有资格的专业检测公司进行检验" class="checkbox" />
                    </div>
                </div>
                <div>
                    <div>
                        <asp:Label ID="Label55" runat="server" Text="备注:" class="" for="txtRemark2"></asp:Label>
                    </div>
                    <div>
                        <asp:TextBox ID="txtRemark2" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
                <div class="space-4"></div>
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
