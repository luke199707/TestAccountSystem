using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestAccountSystem.DAL;
using TestAccountSystem.Model;
using System.Data;
using System.Data.SqlClient;
namespace TestAccountSystem.AdminPages
{
    public partial class RegistrationEditForm : System.Web.UI.Page
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
                BindDrowDownList();
                ShowDetail();

            }

        }
        #region zhw
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
            //  ddlCurrency.SelectedIndex = -1;
            #endregion
            #region 绑定验船师
            DataTable dtSurveyor = SqlHelper.Select("realname", "alluser", "roleId=2 and state=1 and isuseful=1", "username ASC");
            ddlSurveyor.DataSource = dtSurveyor;
            ddlSurveyor.DataTextField = "realname";
            ddlSurveyor.DataValueField = "realname";
            ddlSurveyor.DataBind();
            ddlSurveyor.Items.Insert(0, item);
            //ddlSurveyor.SelectedIndex = -1;
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
            //ddlApplicationProject.SelectedIndex = -1;
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
            // ddlFlag.SelectedIndex = -1;
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
            // ddlShipClass.SelectedIndex = -1;
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
            //ddlSailArea.SelectedIndex = -1;
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
            // ddlSeaRiverShip.SelectedIndex = -1;
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
            //ddlOrdinanceShip.SelectedIndex = -1;
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
            //ddlShipType.SelectedIndex = -1;
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
            // ddlShipMaterial.SelectedIndex = -1;
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
            //ddlIceStrengthening.SelectedIndex = -1;
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
            //ddlSidePushDevice.SelectedIndex = -1;
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
            //ddlPropellerType.SelectedIndex = -1;
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
            //ddlGearbox.SelectedIndex = -1;
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
            //ddlHydraulicTransmission.SelectedIndex = -1;
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
            // ddlAutomationPower.SelectedIndex = -1;
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
            // ddlAutomationLevel.SelectedIndex = -1;
            #endregion
        }
        #endregion
        private void ClearDropDownList()
        {
            ddlSurveyor.ClearSelection();
            ddlCurrency.ClearSelection();
            //  ddlBusinessName.ClearSelection();
            ddlApplicationProject.ClearSelection();
            ddlFlag.ClearSelection();
            ddlShipClass.ClearSelection();
            ddlSailArea.ClearSelection();
            ddlSeaRiverShip.ClearSelection();
            ddlOrdinanceShip.ClearSelection();
            ddlShipType.ClearSelection();
            ddlHostType.ClearSelection();
            ddlShipMaterial.ClearSelection();
            ddlIceStrengthening.ClearSelection();
            ddlSidePushDevice.ClearSelection();
            ddlPropellerType.ClearSelection();
            ddlGearbox.ClearSelection();
            ddlHydraulicTransmission.ClearSelection();
            ddlAutomationPower.ClearSelection();
            ddlAutomationLevel.ClearSelection();
        }
        public void ShowDetail()
        {
            ClearDropDownList();
            string rn = Session["showdetailRegisterNumber"].ToString();
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
                // ddlBusinessName.SelectedValue = rmodel.BusinessName;
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
                txtAdjustmentFactor.Text = smodel.AdjustmentFactor.ToString();
                txtShipName.Text = smodel.ShipName;
                ddlFlag.Text = smodel.Flag;
                ddlShipClass.Text = smodel.ShipClass;
                ddlSailArea.Text = smodel.SailArea;
                ddlSeaRiverShip.Text = smodel.SeaRiverShip;
                ddlOrdinanceShip.Text = smodel.OrdinanceShip;//-----
                txtCompletionDate.Text = smodel.CompletionDate.ToString();
                ddlShipType.Text = smodel.ShipType;
                txtGrossTonnage.Text = smodel.GrossTonnage.ToString();
                txtDeadweight.Text = smodel.Deadweight.ToString();
                txtShipLength.Text = smodel.ShipLength.ToString();
                txtTypeWidth.Text = smodel.TypeWidth.ToString();
                txtTypeDepth.Text = smodel.TypeDepth.ToString();
                txtTotalHostPower.Text = smodel.TotalHostPower.ToString();
                txtTotalPower.Text = smodel.TotalPower.ToString();
                ddlHostType.SelectedValue = smodel.HostType;
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
            }
            #endregion

            //检验项目信息加载
            #region
            gridviewbind(rmodel.Status);
            #endregion
        }
        private void gridviewbind(string status)
        {
            string sortExpression = grid.Attributes["SortExpression"] == null ? "ProjectNumber" : grid.Attributes["SortExpression"];
            bool isASCDirection = true;
            if (grid.Attributes["SortDirection"] == "DESC")
            {
                isASCDirection = false;
            }
            int totalCounts;
            if (status == "保存")
            {
                totalCounts = (int)SqlHelper.GetCountNumber("InspectProject", "ID", " 1=1 ");
                AspNetPager1.RecordCount = totalCounts;
                grid.DataSource = SqlHelper.GetPagedData("InspectProject", " 1=1 ", sortExpression, isASCDirection,
                                    AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            }
            else
            {
                List<ChargeProject> listmodel = ChargeProjectDAL.GetByRegisterNumber(Session["showdetailRegisterNumber"].ToString());//Session["showdetailRegisterNumber"].ToString()         
                totalCounts = (int)SqlHelper.GetCountNumber("InspectProject", "ID", string.Format("BusinessNumber='{0}'", listmodel[0].BusinessNumber));
                AspNetPager1.RecordCount = totalCounts;
                grid.DataSource = SqlHelper.GetPagedData("InspectProject", string.Format("BusinessNumber='{0}'", listmodel[0].BusinessNumber), sortExpression, isASCDirection,
                                    AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            }
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
            gridviewbind("");
        }
        protected void ddlpagesize_SelectedIndexChanged(object sender, EventArgs e)
        {
            AspNetPager1.PageSize = Convert.ToInt32(ddlpagesize.SelectedValue);
            gridviewbind("");
        }
        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            gridviewbind("");
        }
        //private void CheckBoxChecked(List<ChargeProject> list) { 

        //}
        protected void cbkAddAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox cbkall = sender as CheckBox;
            for (int i = 0; i < grid.Rows.Count; i++)
            {
                CheckBox cbk = grid.Rows[i].FindControl("cbkAdd") as CheckBox;
                cbk.Checked = cbkall.Checked;
            }
        }

        protected void grid_DataBound(object sender, EventArgs e)
        {
            for (int i = 0; i < grid.Rows.Count; i++)
            {
                string BusinessNumber = (grid.Rows[i].FindControl("LiteralBusinessNumber") as Literal).Text;
                string ProjectNumber = (grid.Rows[i].FindControl("LiteralProjectNumber") as Literal).Text;
                if ((int)SqlHelper.GetCountNumber("ChargeProject", "ID", string.Format("RegisterNumber='{0}' and BusinessNumber='{1}' and ProjectNumber='{2}'", Session["showdetailRegisterNumber"].ToString(), BusinessNumber, ProjectNumber)) != 0)
                {
                    string sql = "select Quantity from ChargeProject where RegisterNumber=@RegisterNumber and BusinessNumber=@BusinessNumber and ProjectNumber=@ProjectNumber";
                    SqlParameter[] paras = new SqlParameter[]
                    {
                        new SqlParameter("@RegisterNumber",Session["showdetailRegisterNumber"].ToString()),
                        new SqlParameter("@BusinessNumber",BusinessNumber),
                        new SqlParameter("@ProjectNumber",ProjectNumber),
                    };
                    SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, paras);
                    if (reader.Read())
                    {
                        (grid.Rows[i].FindControl("txtQuantity") as TextBox).Text = reader.GetInt32(0).ToString();
                    }
                    (grid.Rows[i].FindControl("cbkAdd") as CheckBox).Checked = true;
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            #region 登记单基本信息
            if (txtApplicantCompany.Text.Trim() == "" || txtRegisterNumber.Text.Trim() == "" || txtShipRegisterNumber.Text.Trim() == "" || txtApplicant.Text.Trim() == "" || ddlApplicationProject.SelectedValue.Trim() == "" || txtTaxpayerIdentificationNumber.Text.Trim() == "" || txtApplicantCompanyAddress.Text.Trim() == "" || txtApplicantPhone.Text.Trim() == "" || txtBankAccount.Text.Trim() == "" || ddlCurrency.SelectedIndex == 0 || ddlSurveyor.SelectedIndex == 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('信息填写不完整，无法保存！')", true);
                return;
            }
            InspectionRegistration Registration = InspectionRegistrationDAL.GetByRegisterNumber(Session["showdetailRegisterNumber"].ToString());

            Registration.RegisterNumber = txtRegisterNumber.Text.Trim();
            Registration.ShipRegistrationNumber = txtShipRegisterNumber.Text.Trim();
            Registration.ApplicantCompany = txtApplicantCompany.Text.Trim();
            Registration.Applicant = txtApplicant.Text.Trim();
            Registration.ApplicationProject = ddlApplicationProject.SelectedValue.Trim();
            Registration.TaxpayerIdentificationNumber = txtTaxpayerIdentificationNumber.Text.Trim();
            Registration.ApplicantCompanyAddress = txtApplicantCompanyAddress.Text.Trim();
            Registration.ApplicantPhone = txtApplicantPhone.Text.Trim();
            Registration.BankAccount = txtBankAccount.Text.Trim();
            // Registration.BusinessName = ddlBusinessName.SelectedValue.Trim();
            Registration.InspectionName = txtInspectionName.Text.Trim();
            Registration.OrderDate = DateTime.Now;
            Registration.Surveyor = ddlSurveyor.SelectedValue.Trim();
            Registration.Status = "待审核";
            Registration.Remark = Session["RealName"].ToString();
            //登记单基本信息存入
            InspectionRegistrationDAL.Update(Registration);
            #endregion


            #region 船只信息封装
            if (txtRegisterNumber.Text.Trim() == "" || txtShipRegisterNumber.Text.Trim() == "" || txtShipName.Text.Trim() == "" ||
                ddlFlag.SelectedValue.Trim() == "" || ddlShipClass.SelectedValue.Trim() == "" || ddlSailArea.SelectedValue.Trim() == "" ||
                ddlSeaRiverShip.SelectedValue.Trim() == "" || ddlOrdinanceShip.SelectedValue.Trim() == "" || txtCompletionDate.Text.Trim() == "" ||
                ddlShipType.SelectedValue.Trim() == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('信息填写不完整，无法保存！')", true);
                return;
            }

            //船只信息存入
            if ((int)SqlHelper.GetCountNumber("ShipInfo", "ID", string.Format("RegisterNumber='{0}' and ShipRegistrationNumber='{1}'", txtRegisterNumber.Text, txtShipRegisterNumber.Text)) != 0)
            {
                #region 已存在船只信息
                ShipInfo ship = ShipInfoDAL.GetByRegisterNumber(Session["showdetailRegisterNumber"].ToString());

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
                ship.TotalPower = txtTotalPower.Text.Trim();
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
                ShipInfoDAL.Update(ship);
                #endregion
            }
            else
            {
                #region 未存在船只信息
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
                ship.TotalPower = txtTotalPower.Text.Trim();
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
                ShipInfoDAL.Insert(ship);
                #endregion
            }
            #endregion


            #region 检验项目信息
            //判断是否选择检验项目
            int c = 0;
            for (int i = 0; i < grid.Rows.Count; i++)
            {
                CheckBox cbk = grid.Rows[i].FindControl("cbkAdd") as CheckBox;
                if (cbk.Checked)
                {
                    c++;
                }
            }
            if (c == 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('还未勾选检验项目！')", true);
                return;
            }
            //将选中的项目加入数据库
            string deletesql = "delete from ChargeProject where RegisterNumber=@RegisterNumber";
            SqlParameter[] paras = new SqlParameter[]
            {
                new SqlParameter("@RegisterNumber",txtRegisterNumber.Text.Trim())
            };
            SqlHelper.ExecuteNonQuery(deletesql, CommandType.Text, paras);
            for (int i = 0; i < grid.Rows.Count; i++)
            {
                CheckBox cbk = grid.Rows[i].FindControl("cbkAdd") as CheckBox;
                if (cbk.Checked == true)
                {
                    ChargeProject model = new ChargeProject();
                    model.RegisterNumber = txtRegisterNumber.Text.Trim();
                    model.BusinessNumber = (grid.Rows[i].FindControl("LiteralBusinessNumber") as Literal).Text.Trim();
                    model.BusinessName = (grid.Rows[i].FindControl("LiteralBusinessName") as Literal).Text.Trim();
                    model.ProjectNumber = (grid.Rows[i].FindControl("LiteralProjectNumber") as Literal).Text.Trim();
                    model.ProjectName = (grid.Rows[i].FindControl("LiteralProjectName") as Literal).Text.Trim();
                    model.BillingUnit = (grid.Rows[i].FindControl("LiteralBillingUnit") as Literal).Text.Trim();
                    model.BillingPrice = Convert.ToDecimal((grid.Rows[i].FindControl("LiteralBillingPrice") as Literal).Text.Trim());
                    model.Quantity = Convert.ToInt32((grid.Rows[i].FindControl("txtQuantity") as TextBox).Text.Trim());
                    model.Remark = Session["RealName"].ToString();
                    ChargeProjectDAL.Insert(model);
                }
            }
            #endregion

            Response.Redirect("QueryRegistrationForm.aspx");
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("QueryRegistrationForm.aspx");
        }
    }
}