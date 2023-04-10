using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestAccountSystem.Model;
using TestAccountSystem.DAL;
using System.Data;
using System.Data.SqlClient;

namespace TestAccountSystem.AdminPages
{
    public partial class ShowRegisterInfo : System.Web.UI.Page
    {
        string rn;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("../AdminLayout/Redirect.aspx?type=reLogin");
                return;
            }
            if (!IsPostBack)
            {
                //string operate = Request.QueryString["operate"];
                //if (operate== "CHECK")
                //{
                //    btnOK.Visible = true;
                //    btnRefuse.Visible = true;
                //}
                string type = Request.QueryString["type"];
                if (type == "ChooseChargeProject")
                {
                    btnReturn.Text = "完成";
                }
                if (type== "CHECK")
                {
                    btnOK.Visible = true;
                    btnRefuse.Visible = true;
                }
                BindDrowDownList();
                ShowDetail();
            }
        }
        //private void UIDisabled() { 

        //}
        private void BindDrowDownList()
        {
            //绑定下拉列表
            #region  绑定货币种类
            DictInfo mode01 = DictInfoDAL.GetByName("货币种类");
            if (mode01 == null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('货币种类为空！');bindDatePicker()", true);
                return;
            }
            DataTable dtcurrency = SqlHelper.Select("name", "dictInfo", "parentId=" + mode01.id.ToString(), "ID ASC");
            ddlCurrency.DataSource = dtcurrency;
            ddlCurrency.DataTextField = "name";
            ddlCurrency.DataValueField = "name";
            ddlCurrency.DataBind();
            ListItem item = new ListItem("请选择", "请选择");
            ddlCurrency.Items.Insert(0, item);
            ddlCurrency.SelectedIndex = 0;
            #endregion
            #region 绑定验船师
            DataTable dtSurveyor = SqlHelper.Select("realname", "alluser", "roleId=2 and state=1 and isuseful=1", "username ASC");
            ddlSurveyor.DataSource = dtSurveyor;
            ddlSurveyor.DataTextField = "realname";
            ddlSurveyor.DataValueField = "realname";
            ddlSurveyor.DataBind();
            ddlSurveyor.Items.Insert(0, item);
            ddlSurveyor.SelectedIndex = 0;
            #endregion
            #region 绑定申请项目
            DictInfo mode02 = DictInfoDAL.GetByName("业务分类");
            if (mode02 == null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('业务分类为空！');bindDatePicker()", true);
                return;
            }
            DataTable dtApplicationProject = SqlHelper.Select("name", "dictInfo", "parentId=" + mode02.id.ToString(), "ID ASC");
            ddlApplicationProject.DataSource = dtApplicationProject;
            ddlApplicationProject.DataTextField = "name";
            ddlApplicationProject.DataValueField = "name";
            ddlApplicationProject.DataBind();
            ddlApplicationProject.Items.Insert(0, item);
            #endregion

            #region 绑定船旗
            DictInfo mode03 = DictInfoDAL.GetByName("船旗");
            if (mode03 == null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('船旗为空！');bindDatePicker()", true);
                return;
            }
            DataTable dtcurrency1 = SqlHelper.Select("name", "dictInfo", "parentId=" + mode03.id.ToString(), "ID ASC");
            ddlFlag.DataSource = dtcurrency1;
            ddlFlag.DataTextField = "name";
            ddlFlag.DataValueField = "name";
            ddlFlag.DataBind();
            //   ListItem item = new ListItem("请选择", "请选择");
            ddlFlag.Items.Insert(0, item);
            ddlFlag.SelectedIndex = 0;
            #endregion
            #region 绑定船级
            DictInfo mode1 = DictInfoDAL.GetByName("船级");
            if (mode1 == null)
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
            if (mode2 == null)
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
            if (mode3 == null)
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
            if (mode4 == null)
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
            if (mode5 == null)
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
            if (mode6 == null)
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
            if (mode7 == null)
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
            if (mode8 == null)
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
            if (mode9 == null)
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
            if (mode10 == null)
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
            if (mode11 == null)
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
            if (mode12 == null)
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
            if (mode13 == null)
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
        public void ShowDetail()
        {
            string str1 = Request.QueryString["registerNum"];
            string str2 = Request.QueryString["RegisterNumber"];

            if (str1 != null)
            {//表示审核穿过来的参数
                rn = str1;
            }
            else
            {
                rn = str2;
            }
            Literal1.Text = rn;
            //检验订单基本信息加载
            #region
            InspectionRegistration rmodel = InspectionRegistrationDAL.GetByRegisterNumber(rn);
            if (rmodel != null)
            {
                txtRegisterNumber.Text = rmodel.RegisterNumber;
                txtShipRegisterNumber.Text = rmodel.ShipRegistrationNumber;
                txtInspectionName.Text = rmodel.InspectionName;
                ddlSurveyor.Text = rmodel.Surveyor;
                ddlCurrency.Text = rmodel.Currency;
                txtOrderDate.Text = rmodel.OrderDate.ToString();
                // ddlBusinessName.Text = rmodel.BusinessName;
                txtApplicantCompany.Text = rmodel.ApplicantCompany;
                txtApplicant.Text = rmodel.Applicant;
                txtApplicantCompanyAddress.Text = rmodel.ApplicantCompanyAddress;
                txtApplicantPhone.Text = rmodel.ApplicantPhone;
                txtBankAccount.Text = rmodel.BankAccount;
                ddlApplicationProject.Text = rmodel.ApplicationProject;
                txtTaxpayerIdentificationNumber.Text = rmodel.TaxpayerIdentificationNumber;
                txtRemark.Text = rmodel.Remark;
            }
            #endregion

            //船只信息加载
            #region
            ShipInfo smodel = ShipInfoDAL.GetByRegisterNumber(rn);
            if (smodel != null)
            {
                txtRegisterNumber.Text = smodel.RegisterNumber;
                txtShipRegisterNumber.Text = smodel.ShipRegistrationNumber;
                txtAdjustmentFactor.Text = smodel.AdjustmentFactor;
                txtShipName.Text = smodel.ShipName;
                ddlFlag.Text = smodel.Flag;
                ddlShipClass.Text = smodel.ShipClass;
                ddlSailArea.Text = smodel.SailArea;
                ddlSeaRiverShip.Text = smodel.SeaRiverShip;
                ddlOrdinanceShip.Text = smodel.OrdinanceShip;
                txtCompletionDate.Text = smodel.CompletionDate.ToString();
                ddlShipType.Text = smodel.ShipType;
                txtGrossTonnage.Text = smodel.GrossTonnage;
                txtDeadweight.Text = smodel.Deadweight;
                txtShipLength.Text = smodel.ShipLength;
                txtTypeWidth.Text = smodel.TypeWidth;
                txtTypeDepth.Text = smodel.TypeDepth;
                txtTotalHostPower.Text = smodel.TotalHostPower;
                txtTotalPower.Text = smodel.TotalPower;
                ddlHostType.Text = smodel.HostType;
                if (smodel.ShipMaterial != "请选择")
                {
                    ddlShipMaterial.Text = smodel.ShipMaterial;
                }
                if (smodel.IceStrengthening != "请选择")
                {
                    ddlIceStrengthening.Text = smodel.IceStrengthening;
                }
                if (smodel.SidePushDevice != "请选择")
                {
                    ddlSidePushDevice.Text = smodel.SidePushDevice;
                }
                if (smodel.PropellerType != "请选择")
                {
                    ddlPropellerType.Text = smodel.PropellerType;
                }
                if (smodel.Gearbox != "请选择")
                {
                    ddlGearbox.Text = smodel.Gearbox;
                }
                if (smodel.HydraulicTransmission != "请选择")
                {
                    ddlHydraulicTransmission.Text = smodel.HydraulicTransmission;
                }
                if (smodel.AutomationPower != "请选择")
                {
                    ddlAutomationPower.Text = smodel.AutomationPower;
                }
                if (smodel.AutomationLevel != "请选择")
                {
                    ddlAutomationLevel.Text = smodel.AutomationLevel;
                }
                //ddlShipMaterial.Text = smodel.ShipMaterial;
                //ddlIceStrengthening.Text = smodel.IceStrengthening;
                //ddlSidePushDevice.Text = smodel.SidePushDevice;
                //ddlPropellerType.Text = smodel.PropellerType;
                //ddlGearbox.Text = smodel.Gearbox;
                //ddlHydraulicTransmission.Text = smodel.HydraulicTransmission;
                //ddlAutomationPower.Text = smodel.AutomationPower;
                //ddlAutomationLevel.Text = smodel.AutomationLevel;
                txtTotalRefrigeratedVolume.Text = smodel.TotalRefrigeratedVolume;
                txtNumberOfRefrigeratedCompartments.Text = smodel.NumberOfRefrigeratedCompartments;
                txtNumberOfRefrigeratedUnits.Text = smodel.NumberOfRefrigeratedUnits;
                txtBallastTankCapacity.Text = smodel.BallastTankCapacity;
                txtNumberOfCrew.Text = smodel.NumberOfCrew;
                txtNumberOfPassengers.Text = smodel.NumberOfPassengers;
                txtTotalVolumeOfLiquefiedGasTank.Text = smodel.TotalVolumeOfLiquefiedGasTank;
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
            }
            #endregion

            //检验项目信息加载
            #region
            gridviewbind();
            #endregion
        }
        private void gridviewbind()
        {
            string sortExpression = grid.Attributes["SortExpression"] == null ? "ProjectNumber" : grid.Attributes["SortExpression"];
            bool isASCDirection = true;
            if (grid.Attributes["SortDirection"] == "DESC")
            {
                isASCDirection = false;
            }
            int totalCounts = (int)SqlHelper.GetCountNumber("ChargeProject", "ID", string.Format("RegisterNumber='{0}'", rn));
            AspNetPager1.RecordCount = totalCounts;
            grid.DataSource = SqlHelper.GetPagedData("ChargeProject", string.Format("RegisterNumber='{0}'", rn), sortExpression, isASCDirection,
                                AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            grid.DataBind();
        }
        protected void grid_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sortExpression = e.SortExpression.ToString();
            string sortDirection = "ASC";
            if (sortExpression == grid.Attributes["SortExpression"])
            {
                sortDirection = (grid.Attributes["SortDirection"].ToString() == sortDirection ? "DESC" : "ASC");
            }
            grid.Attributes["SortExpression"] = sortExpression;
            grid.Attributes["SortDirection"] = sortDirection;
            gridviewbind();
        }
        protected void ddlpagesize_SelectedIndexChanged(object sender, EventArgs e)
        {
            AspNetPager1.PageSize = Convert.ToInt32(ddlpagesize.SelectedValue);
            gridviewbind();
        }
        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            gridviewbind();
        }
        protected void btnReturn_Click(object sender, EventArgs e)
        {
            string type = Request.QueryString["type"];
            string ReturnNum = Request.QueryString["RegisterNumber"];
            switch (type)
            {
                case "QueryRegisterForm": Response.Redirect("QueryRegistrationForm.aspx?ReturnNum" + ReturnNum); break;
                case "InspectionChargeForm": Response.Redirect("InspectionChargeForm.aspx"); break;
                case "ChooseChargeProject": Response.Redirect("QueryRegistrationForm.aspx"); break;
                case "CheckRegisterForm": Response.Redirect("CheckRegisterForm.aspx"); break;
                case "InspectionStatusManagementForm": Response.Redirect("InspectionStatusManagementForm.aspx"); break;
                case "RegistrationStatisticForm": Response.Redirect("RegistrationStatisticForm.aspx"); break;
                case "RegistrationDeleForm": Response.Redirect("RegistrationDeleForm.aspx"); break;
                case "InspectionBillingForm": Response.Redirect("InspectionBillingForm.aspx"); break;
                case "CHECK":Response.Redirect("CheckRegisterForm.aspx");break;
                default:
                    Response.Redirect("Index.aspx");
                    break;
            }

        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            string registerNum = Literal1.Text.Trim();
            string sqlUpdate = "update InspectionRegistration set Status=@Status,Reviewer=@Reviewer where RegisterNumber=@RegisterNumber";
            SqlParameter[] paras = new SqlParameter[] {
            new SqlParameter("@Status","待计费"),
            new SqlParameter("@Reviewer",Session["RealName"]),
            new SqlParameter("@RegisterNumber",registerNum)
            };
            if (SqlHelper.ExecuteNonQuery(sqlUpdate, CommandType.Text, paras) > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('通过审核！')", true);
                // Response.Redirect("CheckRegisterForm.aspx");
                btnOK.Visible = false;
                btnRefuse.Visible = false;
            }
            
        }

        protected void btnRefuse_Click(object sender, EventArgs e)
        {
            string registerNum = Literal1.Text.Trim();
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "open('?registerNum=" + registerNum + "');", true);
            // ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('reegisterNum=" + registerNum + "');", true);
        }
    }
}