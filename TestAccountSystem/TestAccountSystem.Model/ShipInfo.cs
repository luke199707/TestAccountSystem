//============================================================
// author:yangyiliang
//============================================================

using System;
using System.Collections.Generic;
using System.Text;

namespace TestAccountSystem.Model
{	
	[Serializable()]
	public class ShipInfo
	{	
			private int _iD;
			private string _registerNumber;
			private string _shipRegistrationNumber;
			private string _shipName;
			private string _flag;
			private string _shipClass;
			private string _sailArea;
			private string _seaRiverShip;
			private string _ordinanceShip;
			private DateTime? _completionDate;
			private string _shipType;
			private string _grossTonnage;
			private string _deadweight;
			private string _shipLength;
			private string _typeWidth;
			private string _typeDepth;
			private string _totalHostPower;
			private string _totalPower;
			private string _hostType;
			private string _shipMaterial;
			private string _iceStrengthening;
			private string _sidePushDevice;
			private string _propellerType;
			private string _gearbox;
			private string _hydraulicTransmission;
			private string _automationPower;
			private string _automationLevel;
			private string _totalRefrigeratedVolume;
			private string _numberOfRefrigeratedCompartments;
			private string _numberOfRefrigeratedUnits;
			private string _ballastTankCapacity;
			private string _numberOfCrew;
			private string _numberOfPassengers;
			private string _totalVolumeOfLiquefiedGasTank;
			private string _additionalSign;
			private string _fireProofLevel;
			private string _dynamicPositioningSystem;
			private string _adjustmentFactor;
			private string _otherInformation;
			private string _remark;
			public int ID
			{
				get {  return _iD;}
				set {  _iD = value;}
			}
			public string RegisterNumber
			{
				get {  return _registerNumber;}
				set {  _registerNumber = value;}
			}
			public string ShipRegistrationNumber
			{
				get {  return _shipRegistrationNumber;}
				set {  _shipRegistrationNumber = value;}
			}
			public string ShipName
			{
				get {  return _shipName;}
				set {  _shipName = value;}
			}
			public string Flag
			{
				get {  return _flag;}
				set {  _flag = value;}
			}
			public string ShipClass
			{
				get {  return _shipClass;}
				set {  _shipClass = value;}
			}
			public string SailArea
			{
				get {  return _sailArea;}
				set {  _sailArea = value;}
			}
			public string SeaRiverShip
			{
				get {  return _seaRiverShip;}
				set {  _seaRiverShip = value;}
			}
			public string OrdinanceShip
			{
				get {  return _ordinanceShip;}
				set {  _ordinanceShip = value;}
			}
			public DateTime? CompletionDate
			{
				get {  return _completionDate;}
				set {  _completionDate = value;}
			}
			public string ShipType
			{
				get {  return _shipType;}
				set {  _shipType = value;}
			}
			public string GrossTonnage
			{
				get {  return _grossTonnage;}
				set {  _grossTonnage = value;}
			}
			public string Deadweight
			{
				get {  return _deadweight;}
				set {  _deadweight = value;}
			}
			public string ShipLength
			{
				get {  return _shipLength;}
				set {  _shipLength = value;}
			}
			public string TypeWidth
			{
				get {  return _typeWidth;}
				set {  _typeWidth = value;}
			}
			public string TypeDepth
			{
				get {  return _typeDepth;}
				set {  _typeDepth = value;}
			}
			public string TotalHostPower
			{
				get {  return _totalHostPower;}
				set {  _totalHostPower = value;}
			}
			public string TotalPower
			{
				get {  return _totalPower;}
				set {  _totalPower = value;}
			}
			public string HostType
			{
				get {  return _hostType;}
				set {  _hostType = value;}
			}
			public string ShipMaterial
			{
				get {  return _shipMaterial;}
				set {  _shipMaterial = value;}
			}
			public string IceStrengthening
			{
				get {  return _iceStrengthening;}
				set {  _iceStrengthening = value;}
			}
			public string SidePushDevice
			{
				get {  return _sidePushDevice;}
				set {  _sidePushDevice = value;}
			}
			public string PropellerType
			{
				get {  return _propellerType;}
				set {  _propellerType = value;}
			}
			public string Gearbox
			{
				get {  return _gearbox;}
				set {  _gearbox = value;}
			}
			public string HydraulicTransmission
			{
				get {  return _hydraulicTransmission;}
				set {  _hydraulicTransmission = value;}
			}
			public string AutomationPower
			{
				get {  return _automationPower;}
				set {  _automationPower = value;}
			}
			public string AutomationLevel
			{
				get {  return _automationLevel;}
				set {  _automationLevel = value;}
			}
			public string TotalRefrigeratedVolume
			{
				get {  return _totalRefrigeratedVolume;}
				set {  _totalRefrigeratedVolume = value;}
			}
			public string NumberOfRefrigeratedCompartments
			{
				get {  return _numberOfRefrigeratedCompartments;}
				set {  _numberOfRefrigeratedCompartments = value;}
			}
			public string NumberOfRefrigeratedUnits
			{
				get {  return _numberOfRefrigeratedUnits;}
				set {  _numberOfRefrigeratedUnits = value;}
			}
			public string BallastTankCapacity
			{
				get {  return _ballastTankCapacity;}
				set {  _ballastTankCapacity = value;}
			}
			public string NumberOfCrew
			{
				get {  return _numberOfCrew;}
				set {  _numberOfCrew = value;}
			}
			public string NumberOfPassengers
			{
				get {  return _numberOfPassengers;}
				set {  _numberOfPassengers = value;}
			}
			public string TotalVolumeOfLiquefiedGasTank
			{
				get {  return _totalVolumeOfLiquefiedGasTank;}
				set {  _totalVolumeOfLiquefiedGasTank = value;}
			}
			public string AdditionalSign
			{
				get {  return _additionalSign;}
				set {  _additionalSign = value;}
			}
			public string FireProofLevel
			{
				get {  return _fireProofLevel;}
				set {  _fireProofLevel = value;}
			}
			public string DynamicPositioningSystem
			{
				get {  return _dynamicPositioningSystem;}
				set {  _dynamicPositioningSystem = value;}
			}
			public string AdjustmentFactor
			{
				get {  return _adjustmentFactor;}
				set {  _adjustmentFactor = value;}
			}
			public string OtherInformation
			{
				get {  return _otherInformation;}
				set {  _otherInformation = value;}
			}
			public string Remark
			{
				get {  return _remark;}
				set {  _remark = value;}
			}
	}
}
