//============================================================
// author:yangyiliang
//============================================================

using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TestAccountSystem.Model;

namespace TestAccountSystem.DAL
{
	public partial class ShipInfoDAL
	{
        public static object Insert(ShipInfo shipInfo)
		{
				string sql ="INSERT INTO ShipInfo (RegisterNumber, ShipRegistrationNumber, ShipName, Flag, ShipClass, SailArea, SeaRiverShip, OrdinanceShip, CompletionDate, ShipType, GrossTonnage, Deadweight, ShipLength, TypeWidth, TypeDepth, TotalHostPower, TotalPower, HostType, ShipMaterial, IceStrengthening, SidePushDevice, PropellerType, Gearbox, HydraulicTransmission, AutomationPower, AutomationLevel, TotalRefrigeratedVolume, NumberOfRefrigeratedCompartments, NumberOfRefrigeratedUnits, BallastTankCapacity, NumberOfCrew, NumberOfPassengers, TotalVolumeOfLiquefiedGasTank, AdditionalSign, FireProofLevel, DynamicPositioningSystem, AdjustmentFactor, OtherInformation, Remark)  output inserted.ID VALUES (@RegisterNumber, @ShipRegistrationNumber, @ShipName, @Flag, @ShipClass, @SailArea, @SeaRiverShip, @OrdinanceShip, @CompletionDate, @ShipType, @GrossTonnage, @Deadweight, @ShipLength, @TypeWidth, @TypeDepth, @TotalHostPower, @TotalPower, @HostType, @ShipMaterial, @IceStrengthening, @SidePushDevice, @PropellerType, @Gearbox, @HydraulicTransmission, @AutomationPower, @AutomationLevel, @TotalRefrigeratedVolume, @NumberOfRefrigeratedCompartments, @NumberOfRefrigeratedUnits, @BallastTankCapacity, @NumberOfCrew, @NumberOfPassengers, @TotalVolumeOfLiquefiedGasTank, @AdditionalSign, @FireProofLevel, @DynamicPositioningSystem, @AdjustmentFactor, @OtherInformation, @Remark)";
				SqlParameter[] para = new SqlParameter[]
					{
						new SqlParameter("@RegisterNumber", ToDBValue(shipInfo.RegisterNumber)),
						new SqlParameter("@ShipRegistrationNumber", ToDBValue(shipInfo.ShipRegistrationNumber)),
						new SqlParameter("@ShipName", ToDBValue(shipInfo.ShipName)),
						new SqlParameter("@Flag", ToDBValue(shipInfo.Flag)),
						new SqlParameter("@ShipClass", ToDBValue(shipInfo.ShipClass)),
						new SqlParameter("@SailArea", ToDBValue(shipInfo.SailArea)),
						new SqlParameter("@SeaRiverShip", ToDBValue(shipInfo.SeaRiverShip)),
						new SqlParameter("@OrdinanceShip", ToDBValue(shipInfo.OrdinanceShip)),
						new SqlParameter("@CompletionDate", ToDBValue(shipInfo.CompletionDate)),
						new SqlParameter("@ShipType", ToDBValue(shipInfo.ShipType)),
						new SqlParameter("@GrossTonnage", ToDBValue(shipInfo.GrossTonnage)),
						new SqlParameter("@Deadweight", ToDBValue(shipInfo.Deadweight)),
						new SqlParameter("@ShipLength", ToDBValue(shipInfo.ShipLength)),
						new SqlParameter("@TypeWidth", ToDBValue(shipInfo.TypeWidth)),
						new SqlParameter("@TypeDepth", ToDBValue(shipInfo.TypeDepth)),
						new SqlParameter("@TotalHostPower", ToDBValue(shipInfo.TotalHostPower)),
						new SqlParameter("@TotalPower", ToDBValue(shipInfo.TotalPower)),
						new SqlParameter("@HostType", ToDBValue(shipInfo.HostType)),
						new SqlParameter("@ShipMaterial", ToDBValue(shipInfo.ShipMaterial)),
						new SqlParameter("@IceStrengthening", ToDBValue(shipInfo.IceStrengthening)),
						new SqlParameter("@SidePushDevice", ToDBValue(shipInfo.SidePushDevice)),
						new SqlParameter("@PropellerType", ToDBValue(shipInfo.PropellerType)),
						new SqlParameter("@Gearbox", ToDBValue(shipInfo.Gearbox)),
						new SqlParameter("@HydraulicTransmission", ToDBValue(shipInfo.HydraulicTransmission)),
						new SqlParameter("@AutomationPower", ToDBValue(shipInfo.AutomationPower)),
						new SqlParameter("@AutomationLevel", ToDBValue(shipInfo.AutomationLevel)),
						new SqlParameter("@TotalRefrigeratedVolume", ToDBValue(shipInfo.TotalRefrigeratedVolume)),
						new SqlParameter("@NumberOfRefrigeratedCompartments", ToDBValue(shipInfo.NumberOfRefrigeratedCompartments)),
						new SqlParameter("@NumberOfRefrigeratedUnits", ToDBValue(shipInfo.NumberOfRefrigeratedUnits)),
						new SqlParameter("@BallastTankCapacity", ToDBValue(shipInfo.BallastTankCapacity)),
						new SqlParameter("@NumberOfCrew", ToDBValue(shipInfo.NumberOfCrew)),
						new SqlParameter("@NumberOfPassengers", ToDBValue(shipInfo.NumberOfPassengers)),
						new SqlParameter("@TotalVolumeOfLiquefiedGasTank", ToDBValue(shipInfo.TotalVolumeOfLiquefiedGasTank)),
						new SqlParameter("@AdditionalSign", ToDBValue(shipInfo.AdditionalSign)),
						new SqlParameter("@FireProofLevel", ToDBValue(shipInfo.FireProofLevel)),
						new SqlParameter("@DynamicPositioningSystem", ToDBValue(shipInfo.DynamicPositioningSystem)),
						new SqlParameter("@AdjustmentFactor", ToDBValue(shipInfo.AdjustmentFactor)),
						new SqlParameter("@OtherInformation", ToDBValue(shipInfo.OtherInformation)),
						new SqlParameter("@Remark", ToDBValue(shipInfo.Remark)),
					};
					
				return SqlHelper.ExecuteScalar(sql,CommandType.Text, para);
		}

        public static int DeleteByID(int iD)
		{
            string sql = "DELETE FROM ShipInfo WHERE ID = @ID";

           SqlParameter[] para = new SqlParameter[]
			{
				new SqlParameter("@ID", iD)
			};
		
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,para);
		}

		public static int DeleteByRegisterNumber(string RegisterNumber)
		{
			string sql = "DELETE FROM ShipInfo WHERE RegisterNumber = @RegisterNumber";

			SqlParameter[] para = new SqlParameter[]
			 {
				new SqlParameter("@RegisterNumber", RegisterNumber)
			 };

			return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, para);
		}

		public static int Update(ShipInfo shipInfo)
        {
            string sql =
                @"UPDATE ShipInfo SET  RegisterNumber = @RegisterNumber 
                , ShipRegistrationNumber = @ShipRegistrationNumber 
                , ShipName = @ShipName 
                , Flag = @Flag 
                , ShipClass = @ShipClass 
                , SailArea = @SailArea 
                , SeaRiverShip = @SeaRiverShip 
                , OrdinanceShip = @OrdinanceShip 
                , CompletionDate = @CompletionDate 
                , ShipType = @ShipType 
                , GrossTonnage = @GrossTonnage 
                , Deadweight = @Deadweight 
                , ShipLength = @ShipLength 
                , TypeWidth = @TypeWidth 
                , TypeDepth = @TypeDepth 
                , TotalHostPower = @TotalHostPower 
                , TotalPower = @TotalPower 
                , HostType = @HostType 
                , ShipMaterial = @ShipMaterial 
                , IceStrengthening = @IceStrengthening 
                , SidePushDevice = @SidePushDevice 
                , PropellerType = @PropellerType 
                , Gearbox = @Gearbox 
                , HydraulicTransmission = @HydraulicTransmission 
                , AutomationPower = @AutomationPower 
                , AutomationLevel = @AutomationLevel 
                , TotalRefrigeratedVolume = @TotalRefrigeratedVolume 
                , NumberOfRefrigeratedCompartments = @NumberOfRefrigeratedCompartments 
                , NumberOfRefrigeratedUnits = @NumberOfRefrigeratedUnits 
                , BallastTankCapacity = @BallastTankCapacity 
                , NumberOfCrew = @NumberOfCrew 
                , NumberOfPassengers = @NumberOfPassengers 
                , TotalVolumeOfLiquefiedGasTank = @TotalVolumeOfLiquefiedGasTank 
                , AdditionalSign = @AdditionalSign 
                , FireProofLevel = @FireProofLevel 
                , DynamicPositioningSystem = @DynamicPositioningSystem 
                , AdjustmentFactor = @AdjustmentFactor 
                , OtherInformation = @OtherInformation 
                , Remark = @Remark 
                 WHERE ID = @ID";

			SqlParameter[] para = new SqlParameter[]
			{
				new SqlParameter("@ID", shipInfo.ID)
					,new SqlParameter("@RegisterNumber", ToDBValue(shipInfo.RegisterNumber))
					,new SqlParameter("@ShipRegistrationNumber", ToDBValue(shipInfo.ShipRegistrationNumber))
					,new SqlParameter("@ShipName", ToDBValue(shipInfo.ShipName))
					,new SqlParameter("@Flag", ToDBValue(shipInfo.Flag))
					,new SqlParameter("@ShipClass", ToDBValue(shipInfo.ShipClass))
					,new SqlParameter("@SailArea", ToDBValue(shipInfo.SailArea))
					,new SqlParameter("@SeaRiverShip", ToDBValue(shipInfo.SeaRiverShip))
					,new SqlParameter("@OrdinanceShip", ToDBValue(shipInfo.OrdinanceShip))
					,new SqlParameter("@CompletionDate", ToDBValue(shipInfo.CompletionDate))
					,new SqlParameter("@ShipType", ToDBValue(shipInfo.ShipType))
					,new SqlParameter("@GrossTonnage", ToDBValue(shipInfo.GrossTonnage))
					,new SqlParameter("@Deadweight", ToDBValue(shipInfo.Deadweight))
					,new SqlParameter("@ShipLength", ToDBValue(shipInfo.ShipLength))
					,new SqlParameter("@TypeWidth", ToDBValue(shipInfo.TypeWidth))
					,new SqlParameter("@TypeDepth", ToDBValue(shipInfo.TypeDepth))
					,new SqlParameter("@TotalHostPower", ToDBValue(shipInfo.TotalHostPower))
					,new SqlParameter("@TotalPower", ToDBValue(shipInfo.TotalPower))
					,new SqlParameter("@HostType", ToDBValue(shipInfo.HostType))
					,new SqlParameter("@ShipMaterial", ToDBValue(shipInfo.ShipMaterial))
					,new SqlParameter("@IceStrengthening", ToDBValue(shipInfo.IceStrengthening))
					,new SqlParameter("@SidePushDevice", ToDBValue(shipInfo.SidePushDevice))
					,new SqlParameter("@PropellerType", ToDBValue(shipInfo.PropellerType))
					,new SqlParameter("@Gearbox", ToDBValue(shipInfo.Gearbox))
					,new SqlParameter("@HydraulicTransmission", ToDBValue(shipInfo.HydraulicTransmission))
					,new SqlParameter("@AutomationPower", ToDBValue(shipInfo.AutomationPower))
					,new SqlParameter("@AutomationLevel", ToDBValue(shipInfo.AutomationLevel))
					,new SqlParameter("@TotalRefrigeratedVolume", ToDBValue(shipInfo.TotalRefrigeratedVolume))
					,new SqlParameter("@NumberOfRefrigeratedCompartments", ToDBValue(shipInfo.NumberOfRefrigeratedCompartments))
					,new SqlParameter("@NumberOfRefrigeratedUnits", ToDBValue(shipInfo.NumberOfRefrigeratedUnits))
					,new SqlParameter("@BallastTankCapacity", ToDBValue(shipInfo.BallastTankCapacity))
					,new SqlParameter("@NumberOfCrew", ToDBValue(shipInfo.NumberOfCrew))
					,new SqlParameter("@NumberOfPassengers", ToDBValue(shipInfo.NumberOfPassengers))
					,new SqlParameter("@TotalVolumeOfLiquefiedGasTank", ToDBValue(shipInfo.TotalVolumeOfLiquefiedGasTank))
					,new SqlParameter("@AdditionalSign", ToDBValue(shipInfo.AdditionalSign))
					,new SqlParameter("@FireProofLevel", ToDBValue(shipInfo.FireProofLevel))
					,new SqlParameter("@DynamicPositioningSystem", ToDBValue(shipInfo.DynamicPositioningSystem))
					,new SqlParameter("@AdjustmentFactor", ToDBValue(shipInfo.AdjustmentFactor))
					,new SqlParameter("@OtherInformation", ToDBValue(shipInfo.OtherInformation))
					,new SqlParameter("@Remark", ToDBValue(shipInfo.Remark))
			};
			return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,para);
        }		
		
        public static ShipInfo GetByID(int iD)
        {
            string sql = "SELECT * FROM ShipInfo WHERE ID = @ID";
            using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, new SqlParameter("@ID", iD)))
			{
				if (reader.Read())
				{
					return ToModel(reader);
				}
				else
				{
					return null;
				}
       		}
        }

		public static ShipInfo GetByRegisterNumber(string RegisterNumber)
		{
			string sql = "SELECT * FROM ShipInfo WHERE RegisterNumber = @RegisterNumber";
			using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, new SqlParameter("@RegisterNumber", RegisterNumber)))
			{
				if (reader.Read())
				{
					return ToModel(reader);
				}
				else
				{
					return null;
				}
			}
		}

		public static ShipInfo ToModel(SqlDataReader reader)
		{
			ShipInfo shipInfo = new ShipInfo();

			shipInfo.ID = (int)ToModelValue(reader,"ID");
			shipInfo.RegisterNumber = (string)ToModelValue(reader,"RegisterNumber");
			shipInfo.ShipRegistrationNumber = (string)ToModelValue(reader,"ShipRegistrationNumber");
			shipInfo.ShipName = (string)ToModelValue(reader,"ShipName");
			shipInfo.Flag = (string)ToModelValue(reader,"Flag");
			shipInfo.ShipClass = (string)ToModelValue(reader,"ShipClass");
			shipInfo.SailArea = (string)ToModelValue(reader,"SailArea");
			shipInfo.SeaRiverShip = (string)ToModelValue(reader,"SeaRiverShip");
			shipInfo.OrdinanceShip = (string)ToModelValue(reader,"OrdinanceShip");
			shipInfo.CompletionDate = (DateTime?)ToModelValue(reader,"CompletionDate");
			shipInfo.ShipType = (string)ToModelValue(reader,"ShipType");
			shipInfo.GrossTonnage = (string)ToModelValue(reader,"GrossTonnage");
			shipInfo.Deadweight = (string)ToModelValue(reader,"Deadweight");
			shipInfo.ShipLength = (string)ToModelValue(reader,"ShipLength");
			shipInfo.TypeWidth = (string)ToModelValue(reader,"TypeWidth");
			shipInfo.TypeDepth = (string)ToModelValue(reader,"TypeDepth");
			shipInfo.TotalHostPower = (string)ToModelValue(reader,"TotalHostPower");
			shipInfo.TotalPower = (string)ToModelValue(reader,"TotalPower");
			shipInfo.HostType = (string)ToModelValue(reader,"HostType");
			shipInfo.ShipMaterial = (string)ToModelValue(reader,"ShipMaterial");
			shipInfo.IceStrengthening = (string)ToModelValue(reader,"IceStrengthening");
			shipInfo.SidePushDevice = (string)ToModelValue(reader,"SidePushDevice");
			shipInfo.PropellerType = (string)ToModelValue(reader,"PropellerType");
			shipInfo.Gearbox = (string)ToModelValue(reader,"Gearbox");
			shipInfo.HydraulicTransmission = (string)ToModelValue(reader,"HydraulicTransmission");
			shipInfo.AutomationPower = (string)ToModelValue(reader,"AutomationPower");
			shipInfo.AutomationLevel = (string)ToModelValue(reader,"AutomationLevel");
			shipInfo.TotalRefrigeratedVolume = (string)ToModelValue(reader,"TotalRefrigeratedVolume");
			shipInfo.NumberOfRefrigeratedCompartments = (string)ToModelValue(reader,"NumberOfRefrigeratedCompartments");
			shipInfo.NumberOfRefrigeratedUnits = (string)ToModelValue(reader,"NumberOfRefrigeratedUnits");
			shipInfo.BallastTankCapacity = (string)ToModelValue(reader,"BallastTankCapacity");
			shipInfo.NumberOfCrew = (string)ToModelValue(reader,"NumberOfCrew");
			shipInfo.NumberOfPassengers = (string)ToModelValue(reader,"NumberOfPassengers");
			shipInfo.TotalVolumeOfLiquefiedGasTank = (string)ToModelValue(reader,"TotalVolumeOfLiquefiedGasTank");
			shipInfo.AdditionalSign = (string)ToModelValue(reader,"AdditionalSign");
			shipInfo.FireProofLevel = (string)ToModelValue(reader,"FireProofLevel");
			shipInfo.DynamicPositioningSystem = (string)ToModelValue(reader,"DynamicPositioningSystem");
			shipInfo.AdjustmentFactor = (string)ToModelValue(reader,"AdjustmentFactor");
			shipInfo.OtherInformation = (string)ToModelValue(reader,"OtherInformation");
			shipInfo.Remark = (string)ToModelValue(reader,"Remark");
			return shipInfo;
		}
		
		public static int GetTotalCount()
		{
			string sql = "SELECT count(*) FROM ShipInfo";
			return (int)SqlHelper.ExecuteScalar(sql, CommandType.Text);
		}
		
		public static List<ShipInfo> GetPagedData(int startIndex,int endIndex)
		{
			string sql = "SELECT * from(SELECT *,row_number() over(order by ID desc) rownum FROM ShipInfo ) t where rownum>=@startIndex and rownum<=@endIndex";
			using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text,
				new SqlParameter("@startIndex",startIndex),
				new SqlParameter("@endIndex",endIndex)))
			{
				return ToModels(reader);					
			}
		}
		
		public static List<ShipInfo> GetAll()
		{
			string sql = "SELECT * FROM ShipInfo";
			using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text))
			{
				return ToModels(reader);			
			}
		}
		
		protected static List<ShipInfo> ToModels(SqlDataReader reader)
		{
			var list = new List<ShipInfo>();
			while(reader.Read())
			{
				list.Add(ToModel(reader));
			}	
			return list;
		}		
		
		protected static object ToDBValue(object value)
		{
			if(value==null)
			{
				return DBNull.Value;
			}
			else
			{
				return value;
			}
		}
		
		protected static object ToModelValue(SqlDataReader reader,string columnName)
		{
			if(reader.IsDBNull(reader.GetOrdinal(columnName)))
			{
				return null;
			}
			else
			{
				return reader[columnName];
			}
		}
	}
}
