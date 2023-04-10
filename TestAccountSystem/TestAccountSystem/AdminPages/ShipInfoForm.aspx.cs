using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestAccountSystem.Model;
using TestAccountSystem.DAL;
using System.Data;

namespace TestAccountSystem.AdminPages
{
    public partial class ShipInfoForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("../AdminLayout/Redirect.aspx?type=reLogin");
                return;
            }
            if (!IsPostBack)
            {
                BindDropDownList();

                //if (Session["showdetailRegisterNumber"]!=null)
                //{
                //    showDetail();
                //}

            }
            if (Session["RegisterNumber"] != null)
            {
                txtRegisterNumber.Text = (string)Session["RegisterNumber"];
            }
            if (Session["ShipRegistrationNumber"] != null)
            {
                txtShipRegisterNumber.Text = (string)Session["ShipRegistrationNumber"];
            }

            txtRegisterNumber.Attributes.Add("disabled", "disabled");
        }
        #region zhw绑定下拉列表
        private void BindDropDownList()
        {
            #region 绑定船旗
            DictInfo mode = DictInfoDAL.GetByName("船旗");
            if (mode == null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('船旗为空！');bindDatePicker()", true);
                return;
            }
            DataTable dtcurrency = SqlHelper.Select("name", "dictInfo", "parentId=" + mode.id.ToString(), "ID ASC");
            ddlFlag.DataSource = dtcurrency;
            ddlFlag.DataTextField = "name";
            ddlFlag.DataValueField = "name";
            ddlFlag.DataBind();
            ListItem item = new ListItem("请选择", "请选择");
            ddlFlag.Items.Insert(0, item);
            ddlFlag.SelectedIndex = 0;
            #endregion
            #region 绑定船级
            DictInfo mode1 = DictInfoDAL.GetByName("船级");
            if (mode == null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('船级为空！');bindDatePicker()", true);
                return;
            }
            DataTable dtShipClass = SqlHelper.Select("name", "dictInfo", "parentId=" + mode1.id.ToString(), "ID ASC");
            ddlShipClass.DataSource = dtShipClass;
            ddlShipClass.DataTextField = "name";
            ddlShipClass.DataValueField = "name";
            ddlShipClass.DataBind();
            ddlShipClass.Items.Insert(0, item);
            #endregion
            #region 绑定航区
            DictInfo mode2 = DictInfoDAL.GetByName("航区");
            if (mode == null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('航区为空！');bindDatePicker()", true);
                return;
            }
            DataTable dtSailArea = SqlHelper.Select("name", "dictInfo", "parentId=" + mode2.id.ToString(), "ID ASC");
            ddlSailArea.DataSource = dtSailArea;
            ddlSailArea.DataTextField = "name";
            ddlSailArea.DataValueField = "name";
            ddlSailArea.DataBind();
            ddlSailArea.Items.Insert(0, item);
            #endregion
            #region 绑定海河船
            DictInfo mode3 = DictInfoDAL.GetByName("海河船");
            if (mode == null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('航区为空！');bindDatePicker()", true);
                return;
            }
            DataTable dtSeaRiverShip = SqlHelper.Select("name", "dictInfo", "parentId=" + mode3.id.ToString(), "ID ASC");
            ddlSeaRiverShip.DataSource = dtSeaRiverShip;
            ddlSeaRiverShip.DataTextField = "name";
            ddlSeaRiverShip.DataValueField = "name";
            ddlSeaRiverShip.DataBind();
            ddlSeaRiverShip.Items.Insert(0, item);
            #endregion
            #region 绑定是否条例船
            DictInfo mode4 = DictInfoDAL.GetByName("是否条例船");
            if (mode == null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('航区为空！');bindDatePicker()", true);
                return;
            }
            DataTable dtOrdinanceShip = SqlHelper.Select("name", "dictInfo", "parentId=" + mode4.id.ToString(), "ID ASC");
            ddlOrdinanceShip.DataSource = dtOrdinanceShip;
            ddlOrdinanceShip.DataTextField = "name";
            ddlOrdinanceShip.DataValueField = "name";
            ddlOrdinanceShip.DataBind();
            ddlOrdinanceShip.Items.Insert(0, item);
            #endregion
            #region 绑定船型
            DictInfo mode5 = DictInfoDAL.GetByName("船型");
            if (mode == null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('航区为空！');bindDatePicker()", true);
                return;
            }
            DataTable dtShipType = SqlHelper.Select("name", "dictInfo", "parentId=" + mode5.id.ToString(), "ID ASC");
            ddlShipType.DataSource = dtShipType;
            ddlShipType.DataTextField = "name";
            ddlShipType.DataValueField = "name";
            ddlShipType.DataBind();
            ddlShipType.Items.Insert(0, item);
            #endregion
            #region 绑定船体材料
            DictInfo mode6 = DictInfoDAL.GetByName("船体材料");
            if (mode == null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('航区为空！');bindDatePicker()", true);
                return;
            }
            DataTable dtShipMaterial = SqlHelper.Select("name", "dictInfo", "parentId=" + mode6.id.ToString(), "ID ASC");
            ddlShipMaterial.DataSource = dtShipMaterial;
            ddlShipMaterial.DataTextField = "name";
            ddlShipMaterial.DataValueField = "name";
            ddlShipMaterial.DataBind();
            ddlShipMaterial.Items.Insert(0, item);
            #endregion
            #region 绑定冰区加强
            DictInfo mode7 = DictInfoDAL.GetByName("冰区加强");
            if (mode == null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('航区为空！');bindDatePicker()", true);
                return;
            }
            DataTable dtIceStrengthening = SqlHelper.Select("name", "dictInfo", "parentId=" + mode7.id.ToString(), "ID ASC");
            ddlIceStrengthening.DataSource = dtIceStrengthening;
            ddlIceStrengthening.DataTextField = "name";
            ddlIceStrengthening.DataValueField = "name";
            ddlIceStrengthening.DataBind();
            ddlIceStrengthening.Items.Insert(0, item);
            #endregion
            #region 绑定侧推装置
            DictInfo mode8 = DictInfoDAL.GetByName("侧推装置");
            if (mode == null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('航区为空！');bindDatePicker()", true);
                return;
            }
            DataTable dtSidePushDevice = SqlHelper.Select("name", "dictInfo", "parentId=" + mode8.id.ToString(), "ID ASC");
            ddlSidePushDevice.DataSource = dtSidePushDevice;
            ddlSidePushDevice.DataTextField = "name";
            ddlSidePushDevice.DataValueField = "name";
            ddlSidePushDevice.DataBind();
            ddlSidePushDevice.Items.Insert(0, item);
            #endregion
            #region  绑定推进器种类
            DictInfo mode9 = DictInfoDAL.GetByName("推进器种类");
            if (mode == null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('航区为空！');bindDatePicker()", true);
                return;
            }
            DataTable dtPropellerType = SqlHelper.Select("name", "dictInfo", "parentId=" + mode9.id.ToString(), "ID ASC");
            ddlPropellerType.DataSource = dtSidePushDevice;
            ddlPropellerType.DataTextField = "name";
            ddlPropellerType.DataValueField = "name";
            ddlPropellerType.DataBind();
            ddlPropellerType.Items.Insert(0, item);
            #endregion
            #region  绑定变速齿轮箱
            DictInfo mode10 = DictInfoDAL.GetByName("变速齿轮箱");
            if (mode == null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('航区为空！');bindDatePicker()", true);
                return;
            }
            DataTable dtGearbox = SqlHelper.Select("name", "dictInfo", "parentId=" + mode10.id.ToString(), "ID ASC");
            ddlGearbox.DataSource = dtGearbox;
            ddlGearbox.DataTextField = "name";
            ddlGearbox.DataValueField = "name";
            ddlGearbox.DataBind();
            ddlGearbox.Items.Insert(0, item);
            #endregion
            #region  绑定液力传动
            DictInfo mode11 = DictInfoDAL.GetByName("液力传动");
            if (mode == null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('航区为空！');bindDatePicker()", true);
                return;
            }
            DataTable dtHydraulicTransmission = SqlHelper.Select("name", "dictInfo", "parentId=" + mode11.id.ToString(), "ID ASC");
            ddlHydraulicTransmission.DataSource = dtHydraulicTransmission;
            ddlHydraulicTransmission.DataTextField = "name";
            ddlHydraulicTransmission.DataValueField = "name";
            ddlHydraulicTransmission.DataBind();
            ddlHydraulicTransmission.Items.Insert(0, item);
            #endregion
            #region  绑定自动化功率
            DictInfo mode12 = DictInfoDAL.GetByName("自动化功率");
            if (mode == null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('航区为空！');bindDatePicker()", true);
                return;
            }
            DataTable dtAutomationPower = SqlHelper.Select("name", "dictInfo", "parentId=" + mode12.id.ToString(), "ID ASC");
            ddlAutomationPower.DataSource = dtAutomationPower;
            ddlAutomationPower.DataTextField = "name";
            ddlAutomationPower.DataValueField = "name";
            ddlAutomationPower.DataBind();
            ddlAutomationPower.Items.Insert(0, item);
            #endregion
            #region  绑定自动化等级
            DictInfo mode13 = DictInfoDAL.GetByName("自动化等级");
            if (mode == null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('航区为空！');bindDatePicker()", true);
                return;
            }
            DataTable dtAutomationLevel = SqlHelper.Select("name", "dictInfo", "parentId=" + mode13.id.ToString(), "ID ASC");
            ddlAutomationLevel.DataSource = dtAutomationLevel;
            ddlAutomationLevel.DataTextField = "name";
            ddlAutomationLevel.DataValueField = "name";
            ddlAutomationLevel.DataBind();
            ddlAutomationLevel.Items.Insert(0, item);
            #endregion
        }
        #endregion
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            InsertShipInfo();
            LiteralHiddenState.Text = "Save";
            #region
            //if (txtRegisterNumber.Text.Trim() == "" || txtShipRegisterNumber.Text.Trim() == "" || txtShipName.Text.Trim() == "" ||
            //    ddlFlag.SelectedValue.Trim() == "" || ddlShipClass.SelectedValue.Trim() == "" || ddlSailArea.SelectedValue.Trim() == "" ||
            //    ddlSeaRiverShip.SelectedValue.Trim() == "" || ddlOrdinanceShip.SelectedValue.Trim() == "" || txtCompletionDate.Text.Trim() == "" ||
            //    ddlShipType.SelectedValue.Trim() == "")
            //{
            //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('信息填写不完整，无法保存！')", true);
            //    return;
            //}
            ////船只信息封装
            //#region
            //ShipInfo ship = new ShipInfo();

            //ship.RegisterNumber = txtRegisterNumber.Text.Trim();
            //ship.ShipRegistrationNumber = txtShipRegisterNumber.Text.Trim();
            //ship.ShipName = txtShipName.Text.Trim();
            //ship.Flag = ddlFlag.SelectedValue.Trim();
            //ship.ShipClass = ddlShipClass.SelectedValue.Trim();
            //ship.SailArea = ddlSailArea.SelectedValue.Trim();
            //ship.SeaRiverShip = ddlSeaRiverShip.SelectedValue.Trim();
            //ship.OrdinanceShip = ddlOrdinanceShip.SelectedValue.Trim();
            //if (txtCompletionDate.Text.Trim() != "")
            //{
            //    ship.CompletionDate = Convert.ToDateTime(txtCompletionDate.Text.Trim());
            //}
            //ship.ShipType = ddlShipType.SelectedValue.Trim();
            //ship.GrossTonnage = txtGrossTonnage.Text.Trim();
            //ship.Deadweight = txtDeadweight.Text.Trim();
            //ship.ShipLength = txtShipLength.Text.Trim();
            //ship.TypeWidth = txtTypeWidth.Text.Trim();
            //ship.TypeDepth = txtTypeDepth.Text.Trim();
            //ship.TotalHostPower = txtTotalHostPower.Text.Trim();
            //ship.TotalPower = txtTotalPower.Text.Trim() == "" ? "0" : txtTotalPower.Text.Trim();//修改
            //ship.HostType = ddlHostType.SelectedValue.Trim();
            //ship.ShipMaterial = ddlShipMaterial.SelectedValue.Trim();
            //ship.IceStrengthening = ddlIceStrengthening.SelectedValue.Trim();
            //ship.SidePushDevice = ddlSidePushDevice.SelectedValue.Trim();
            //ship.PropellerType = ddlPropellerType.SelectedValue.Trim();
            //ship.Gearbox = ddlGearbox.SelectedValue.Trim();
            //ship.HydraulicTransmission = ddlHydraulicTransmission.SelectedValue.Trim();
            //ship.AutomationPower = ddlAutomationPower.SelectedValue.Trim();
            //ship.AutomationLevel = ddlAutomationLevel.SelectedValue.Trim();
            //ship.TotalRefrigeratedVolume = txtTotalRefrigeratedVolume.Text.Trim();
            //ship.NumberOfRefrigeratedCompartments = txtNumberOfRefrigeratedCompartments.Text.Trim();
            //ship.NumberOfRefrigeratedUnits = txtNumberOfRefrigeratedUnits.Text.Trim();
            //ship.BallastTankCapacity = txtBallastTankCapacity.Text.Trim();
            //ship.NumberOfCrew = txtNumberOfCrew.Text.Trim();
            //ship.NumberOfPassengers = txtNumberOfPassengers.Text.Trim();
            //ship.TotalVolumeOfLiquefiedGasTank = txtTotalVolumeOfLiquefiedGasTank.Text.Trim();
            //ship.AdditionalSign = txtAdditionalSign.Text.Trim();
            //ship.FireProofLevel = txtFireProofLevel.Text.Trim();
            //ship.DynamicPositioningSystem = txtDynamicPositioningSystem.Text.Trim();
            //ship.AdjustmentFactor = txtAdjustmentFactor.Text.Trim();

            //string str = "";
            //if (ckbAntiCorrosionDevice.Checked) { str += "1"; } else { str += "0"; }
            //if (ckbHeavyCargoStrengthening.Checked) { str += "，1"; } else { str += "，0"; }
            //if (cbkVariablePitch.Checked) { str += "，1"; } else { str += "，0"; }
            //if (cbkZPropeller.Checked) { str += "，1"; } else { str += "，0"; }
            //if (cbkElectricPropulsion.Checked) { str += "，1"; } else { str += "，0"; }
            //if (cbkInertGasDeviceProtection.Checked) { str += "，1"; } else { str += "，0"; }
            //if (cbkHelicopterPlatform.Checked) { str += "，1"; } else { str += "，0"; }
            //if (cbkDivingEquipment.Checked) { str += "，1"; } else { str += "，0"; }
            //if (cbkDynamicPositioning.Checked) { str += "，1"; } else { str += "，0"; }
            //if (cbkOnlyMeetA329.Checked) { str += "，1"; } else { str += "，0"; }
            //if (cbkCrudeOilWashing.Checked) { str += "，1"; } else { str += "，0"; }
            //if (cbkDedicatedBallastTank.Checked) { str += "，1"; } else { str += "，0"; }
            //if (cbkReliquefactionRefrigeration.Checked) { str += "，1"; } else { str += "，0"; }
            //if (cbkMethaneCombustion.Checked) { str += "，1"; } else { str += "，0"; }
            //if (cbkWithGMDSS.Checked) { str += "，1"; } else { str += "，0"; }
            //if (cbkQualifiedProfessionalTestingCompanyForInspection.Checked) { str += "，1"; } else { str += "，0"; }
            //if (cbkWithIceBreakingAbility.Checked) { str += "，1"; } else { str += "，0"; }
            //if (cbkBottomReinforcement.Checked) { str += "，1"; } else { str += "，0"; }
            //if (cbkSinglePointMooring.Checked) { str += "，1"; } else { str += "，0"; }
            //if (cbkCargoRefrigerationQuickFreezing.Checked) { str += "，1"; } else { str += "，0"; }
            //if (cbkGasReliquefaction.Checked) { str += "，1"; } else { str += "，0"; }
            //if (cbkInRefrigeratedContainer.Checked) { str += "，1"; } else { str += "，0"; }
            //if (cbkTurbineSideThruster.Checked) { str += "，1"; } else { str += "，0"; }
            //if (cbkSCM.Checked) { str += "，1"; } else { str += "，0"; }
            //if (cbkECM.Checked) { str += "，1"; } else { str += "，0"; }
            //if (cbkPMS.Checked) { str += "，1"; } else { str += "，0"; }
            //if (cbkWaterJetPropulsionDevice.Checked) { str += "，1"; } else { str += "，0"; }
            //if (cbkSelfUnloadingSystem.Checked) { str += "，1"; } else { str += "，0"; }
            //if (cbkSteamControlSystem.Checked) { str += "，1"; } else { str += "，0"; }
            //if (cbkHelicopterFacility.Checked) { str += "，1"; } else { str += "，0"; }
            //if (cbkCommonNorm.Checked) { str += "，1"; } else { str += "，0"; }
            //if (cbkDirectCalculation.Checked) { str += "，1"; } else { str += "，0"; }
            //ship.OtherInformation = str;
            //ship.Remark = txtRemark2.Text.Trim();
            //#endregion


            ////查询该订单是否已经有船只信息 
            //object o = ShipInfoDAL.GetByRegisterNumber(txtRegisterNumber.Text.Trim());
            //if (o == null)
            //{
            //    object o2 = ShipInfoDAL.Insert(ship);
            //    if (o2 == null)
            //    {
            //        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('保存失败！')", true);
            //        return;
            //    }
            //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('保存成功！')", true);
            //}
            //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('该订单的船只信息已存在！')", true);
            //return;
            #endregion
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            if (LiteralHiddenState.Text=="")
            {
                if (InsertShipInfo()==false)
                {
                    return;
                }
              //  InsertShipInfo();
            }          
            Response.Redirect("ChooseChargeProject.aspx");
        }
        private Boolean InsertShipInfo() {
            if (txtRegisterNumber.Text.Trim() == "" || txtShipRegisterNumber.Text.Trim() == "" || txtShipName.Text.Trim() == "" ||
                ddlFlag.SelectedValue.Trim() == "" || ddlShipClass.SelectedValue.Trim() == "" || ddlSailArea.SelectedValue.Trim() == "" ||
                ddlSeaRiverShip.SelectedValue.Trim() == "" || ddlOrdinanceShip.SelectedValue.Trim() == "" || txtCompletionDate.Text.Trim() == "" ||
                ddlShipType.SelectedValue.Trim() == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('信息填写不完整，无法保存！')", true);
                return false;
            }
            //船只信息封装
            #region
            ShipInfo ship = new ShipInfo();

            ship.RegisterNumber = txtRegisterNumber.Text.Trim();
            ship.ShipRegistrationNumber = txtShipRegisterNumber.Text.Trim();
            ship.ShipName = txtShipName.Text.Trim();
            ship.Flag = ddlFlag.SelectedValue.Trim();
            ship.ShipClass = ddlShipClass.SelectedValue.Trim();
            ship.SailArea = ddlSailArea.SelectedValue.Trim();
            ship.SeaRiverShip = ddlSeaRiverShip.SelectedValue.Trim();
            ship.OrdinanceShip = ddlOrdinanceShip.SelectedValue.Trim();
            if (txtCompletionDate.Text.Trim() != "")
            {
                ship.CompletionDate = Convert.ToDateTime(txtCompletionDate.Text.Trim());
            }
            ship.ShipType = ddlShipType.SelectedValue.Trim();
            ship.GrossTonnage = txtGrossTonnage.Text.Trim();
            ship.Deadweight = txtDeadweight.Text.Trim();
            ship.ShipLength = txtShipLength.Text.Trim();
            ship.TypeWidth = txtTypeWidth.Text.Trim();
            ship.TypeDepth = txtTypeDepth.Text.Trim();
            ship.TotalHostPower = txtTotalHostPower.Text.Trim();
            ship.TotalPower = txtTotalPower.Text.Trim() == "" ? "0" : txtTotalPower.Text.Trim();//修改
            ship.HostType = ddlHostType.SelectedValue.Trim();
            ship.ShipMaterial = ddlShipMaterial.SelectedValue.Trim();
            ship.IceStrengthening = ddlIceStrengthening.SelectedValue.Trim();
            ship.SidePushDevice = ddlSidePushDevice.SelectedValue.Trim();
            ship.PropellerType = ddlPropellerType.SelectedValue.Trim();
            ship.Gearbox = ddlGearbox.SelectedValue.Trim();
            ship.HydraulicTransmission = ddlHydraulicTransmission.SelectedValue.Trim();
            ship.AutomationPower = ddlAutomationPower.SelectedValue.Trim();
            ship.AutomationLevel = ddlAutomationLevel.SelectedValue.Trim();
            ship.TotalRefrigeratedVolume = txtTotalRefrigeratedVolume.Text.Trim();
            ship.NumberOfRefrigeratedCompartments = txtNumberOfRefrigeratedCompartments.Text.Trim();
            ship.NumberOfRefrigeratedUnits = txtNumberOfRefrigeratedUnits.Text.Trim();
            ship.BallastTankCapacity = txtBallastTankCapacity.Text.Trim();
            ship.NumberOfCrew = txtNumberOfCrew.Text.Trim();
            ship.NumberOfPassengers = txtNumberOfPassengers.Text.Trim();
            ship.TotalVolumeOfLiquefiedGasTank = txtTotalVolumeOfLiquefiedGasTank.Text.Trim();
            ship.AdditionalSign = txtAdditionalSign.Text.Trim();
            ship.FireProofLevel = txtFireProofLevel.Text.Trim();
            ship.DynamicPositioningSystem = txtDynamicPositioningSystem.Text.Trim();
            ship.AdjustmentFactor = txtAdjustmentFactor.Text.Trim();

            string str = "";
            if (ckbAntiCorrosionDevice.Checked) { str += "1"; } else { str += "0"; }
            if (ckbHeavyCargoStrengthening.Checked) { str += "，1"; } else { str += "，0"; }
            if (cbkVariablePitch.Checked) { str += "，1"; } else { str += "，0"; }
            if (cbkZPropeller.Checked) { str += "，1"; } else { str += "，0"; }
            if (cbkElectricPropulsion.Checked) { str += "，1"; } else { str += "，0"; }
            if (cbkInertGasDeviceProtection.Checked) { str += "，1"; } else { str += "，0"; }
            if (cbkHelicopterPlatform.Checked) { str += "，1"; } else { str += "，0"; }
            if (cbkDivingEquipment.Checked) { str += "，1"; } else { str += "，0"; }
            if (cbkDynamicPositioning.Checked) { str += "，1"; } else { str += "，0"; }
            if (cbkOnlyMeetA329.Checked) { str += "，1"; } else { str += "，0"; }
            if (cbkCrudeOilWashing.Checked) { str += "，1"; } else { str += "，0"; }
            if (cbkDedicatedBallastTank.Checked) { str += "，1"; } else { str += "，0"; }
            if (cbkReliquefactionRefrigeration.Checked) { str += "，1"; } else { str += "，0"; }
            if (cbkMethaneCombustion.Checked) { str += "，1"; } else { str += "，0"; }
            if (cbkWithGMDSS.Checked) { str += "，1"; } else { str += "，0"; }
            if (cbkQualifiedProfessionalTestingCompanyForInspection.Checked) { str += "，1"; } else { str += "，0"; }
            if (cbkWithIceBreakingAbility.Checked) { str += "，1"; } else { str += "，0"; }
            if (cbkBottomReinforcement.Checked) { str += "，1"; } else { str += "，0"; }
            if (cbkSinglePointMooring.Checked) { str += "，1"; } else { str += "，0"; }
            if (cbkCargoRefrigerationQuickFreezing.Checked) { str += "，1"; } else { str += "，0"; }
            if (cbkGasReliquefaction.Checked) { str += "，1"; } else { str += "，0"; }
            if (cbkInRefrigeratedContainer.Checked) { str += "，1"; } else { str += "，0"; }
            if (cbkTurbineSideThruster.Checked) { str += "，1"; } else { str += "，0"; }
            if (cbkSCM.Checked) { str += "，1"; } else { str += "，0"; }
            if (cbkECM.Checked) { str += "，1"; } else { str += "，0"; }
            if (cbkPMS.Checked) { str += "，1"; } else { str += "，0"; }
            if (cbkWaterJetPropulsionDevice.Checked) { str += "，1"; } else { str += "，0"; }
            if (cbkSelfUnloadingSystem.Checked) { str += "，1"; } else { str += "，0"; }
            if (cbkSteamControlSystem.Checked) { str += "，1"; } else { str += "，0"; }
            if (cbkHelicopterFacility.Checked) { str += "，1"; } else { str += "，0"; }
            if (cbkCommonNorm.Checked) { str += "，1"; } else { str += "，0"; }
            if (cbkDirectCalculation.Checked) { str += "，1"; } else { str += "，0"; }
            ship.OtherInformation = str;
            ship.Remark = txtRemark2.Text.Trim();
            #endregion


            //查询该订单是否已经有船只信息 
            object o = ShipInfoDAL.GetByRegisterNumber(txtRegisterNumber.Text.Trim());
            if (o == null)
            {
                object o2 = ShipInfoDAL.Insert(ship);
                if (o2 == null)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('保存失败！')", true);
                    return false;
                }
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('保存成功！')", true);
                return true;
            }
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('该订单的船只信息已存在！')", true);
            return false;
        }
        public void showDetail()
        {
            string RegisterNumber = (string)Session["showdetailRegisterNumber"];
            ShipInfo smodel = ShipInfoDAL.GetByRegisterNumber(RegisterNumber);
            if (smodel != null)
            {
                //船只信息加载
                #region
                txtRegisterNumber.Text = smodel.RegisterNumber;
                txtShipRegisterNumber.Text = smodel.ShipRegistrationNumber;
                txtAdjustmentFactor.Text = smodel.AdjustmentFactor.ToString();
                txtShipName.Text = smodel.ShipName;
                ddlFlag.SelectedValue = smodel.Flag;
                ddlShipClass.SelectedValue = smodel.ShipClass;
                ddlSailArea.SelectedValue = smodel.SailArea;
                ddlSeaRiverShip.SelectedValue = smodel.SeaRiverShip;
                ddlOrdinanceShip.SelectedValue = smodel.OrdinanceShip;
                txtCompletionDate.Text = smodel.CompletionDate.ToString();
                ddlShipType.SelectedValue = smodel.ShipType;
                txtGrossTonnage.Text = smodel.GrossTonnage.ToString();
                txtDeadweight.Text = smodel.Deadweight.ToString();
                txtShipLength.Text = smodel.ShipLength.ToString();
                txtTypeWidth.Text = smodel.TypeWidth.ToString();
                txtTypeDepth.Text = smodel.TypeDepth.ToString();
                txtTotalHostPower.Text = smodel.TotalHostPower.ToString();
                txtTotalPower.Text = smodel.TotalPower.ToString();
                ddlHostType.SelectedValue = smodel.HostType;
                ddlShipMaterial.SelectedValue = smodel.ShipMaterial;
                ddlIceStrengthening.SelectedValue = smodel.IceStrengthening;
                ddlSidePushDevice.SelectedValue = smodel.SidePushDevice;
                ddlPropellerType.SelectedValue = smodel.PropellerType;
                ddlGearbox.SelectedValue = smodel.Gearbox;
                ddlHydraulicTransmission.SelectedValue = smodel.HydraulicTransmission;
                ddlAutomationPower.SelectedValue = smodel.AutomationPower;
                ddlAutomationLevel.SelectedValue = smodel.AutomationLevel;
                txtTotalRefrigeratedVolume.Text = smodel.TotalRefrigeratedVolume.ToString();
                txtNumberOfRefrigeratedCompartments.Text = smodel.NumberOfRefrigeratedCompartments.ToString();
                txtNumberOfRefrigeratedUnits.Text = smodel.NumberOfRefrigeratedUnits.ToString();
                txtBallastTankCapacity.Text = smodel.BallastTankCapacity.ToString();
                txtNumberOfCrew.Text = smodel.NumberOfCrew.ToString();
                txtNumberOfPassengers.Text = smodel.NumberOfPassengers.ToString();
                txtTotalVolumeOfLiquefiedGasTank.Text = smodel.TotalVolumeOfLiquefiedGasTank.ToString();
                txtAdditionalSign.Text = smodel.AdditionalSign;
                txtFireProofLevel.Text = smodel.FireProofLevel;
                txtDynamicPositioningSystem.Text = smodel.DynamicPositioningSystem;
                string s = smodel.OtherInformation;
                string[] shipInfo = s.Split('，');
                if (shipInfo[0].Equals("1")) { ckbAntiCorrosionDevice.Checked = true; };
                if (shipInfo[1].Equals("1")) { ckbHeavyCargoStrengthening.Checked = true; };
                if (shipInfo[2].Equals("1")) { cbkVariablePitch.Checked = true; };
                if (shipInfo[3].Equals("1")) { cbkZPropeller.Checked = true; };
                if (shipInfo[4].Equals("1")) { cbkElectricPropulsion.Checked = true; };
                if (shipInfo[5].Equals("1")) { cbkInertGasDeviceProtection.Checked = true; };
                if (shipInfo[6].Equals("1")) { cbkHelicopterPlatform.Checked = true; };
                if (shipInfo[7].Equals("1")) { cbkDivingEquipment.Checked = true; };
                if (shipInfo[8].Equals("1")) { cbkDynamicPositioning.Checked = true; };
                if (shipInfo[9].Equals("1")) { cbkOnlyMeetA329.Checked = true; };
                if (shipInfo[10].Equals("1")) { cbkCrudeOilWashing.Checked = true; };
                if (shipInfo[11].Equals("1")) { cbkDedicatedBallastTank.Checked = true; };
                if (shipInfo[12].Equals("1")) { cbkReliquefactionRefrigeration.Checked = true; };
                if (shipInfo[13].Equals("1")) { cbkMethaneCombustion.Checked = true; };
                if (shipInfo[14].Equals("1")) { cbkWithGMDSS.Checked = true; };
                if (shipInfo[15].Equals("1")) { cbkQualifiedProfessionalTestingCompanyForInspection.Checked = true; };
                if (shipInfo[16].Equals("1")) { cbkWithIceBreakingAbility.Checked = true; };
                if (shipInfo[17].Equals("1")) { cbkBottomReinforcement.Checked = true; };
                if (shipInfo[18].Equals("1")) { cbkSinglePointMooring.Checked = true; };
                if (shipInfo[19].Equals("1")) { cbkCargoRefrigerationQuickFreezing.Checked = true; };
                if (shipInfo[20].Equals("1")) { cbkGasReliquefaction.Checked = true; };
                if (shipInfo[21].Equals("1")) { cbkInRefrigeratedContainer.Checked = true; };
                if (shipInfo[22].Equals("1")) { cbkTurbineSideThruster.Checked = true; };
                if (shipInfo[23].Equals("1")) { cbkSCM.Checked = true; };
                if (shipInfo[24].Equals("1")) { cbkECM.Checked = true; };
                if (shipInfo[25].Equals("1")) { cbkPMS.Checked = true; };
                if (shipInfo[26].Equals("1")) { cbkWaterJetPropulsionDevice.Checked = true; };
                if (shipInfo[27].Equals("1")) { cbkSelfUnloadingSystem.Checked = true; };
                if (shipInfo[28].Equals("1")) { cbkSteamControlSystem.Checked = true; };
                if (shipInfo[29].Equals("1")) { cbkHelicopterFacility.Checked = true; };
                if (shipInfo[30].Equals("1")) { cbkCommonNorm.Checked = true; };
                if (shipInfo[31].Equals("1")) { cbkDirectCalculation.Checked = true; };
                #endregion
            }

        }
    }
}