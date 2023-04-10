//============================================================
// author:wangzhenkun
//============================================================

using System;
using System.Collections.Generic;
using System.Text;

namespace TestAccountSystem.Model
{	
	[Serializable()]
	public class InspectionRegistration
	{	
			private int _iD;
			private string _registerNumber;
			private string _shipRegistrationNumber;
			private string _applicantCompany;
			private string _applicant;
			private string _applicationProject;
			private string _taxpayerIdentificationNumber;
			private string _applicantCompanyAddress;
			private string _applicantPhone;
			private string _bankAccount;
			private string _businessName;
			private string _inspectionName;
			private DateTime? _inspectionDate;
			private DateTime? _orderDate;
			private string _currency;
			private decimal? _amount;
			private string _surveyor;
			private string _status;
			private string _reviewer;
			private string _remark;
			private string _cashier;
			private string _reason;
			private string _payer;
			private DateTime? _payTime;
			private string _remark1;
			private string _remark2;
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
			public string ApplicantCompany
			{
				get {  return _applicantCompany;}
				set {  _applicantCompany = value;}
			}
			public string Applicant
			{
				get {  return _applicant;}
				set {  _applicant = value;}
			}
			public string ApplicationProject
			{
				get {  return _applicationProject;}
				set {  _applicationProject = value;}
			}
			public string TaxpayerIdentificationNumber
			{
				get {  return _taxpayerIdentificationNumber;}
				set {  _taxpayerIdentificationNumber = value;}
			}
			public string ApplicantCompanyAddress
			{
				get {  return _applicantCompanyAddress;}
				set {  _applicantCompanyAddress = value;}
			}
			public string ApplicantPhone
			{
				get {  return _applicantPhone;}
				set {  _applicantPhone = value;}
			}
			public string BankAccount
			{
				get {  return _bankAccount;}
				set {  _bankAccount = value;}
			}
			public string BusinessName
			{
				get {  return _businessName;}
				set {  _businessName = value;}
			}
			public string InspectionName
			{
				get {  return _inspectionName;}
				set {  _inspectionName = value;}
			}
			public DateTime? InspectionDate
			{
				get {  return _inspectionDate;}
				set {  _inspectionDate = value;}
			}
			public DateTime? OrderDate
			{
				get {  return _orderDate;}
				set {  _orderDate = value;}
			}
			public string Currency
			{
				get {  return _currency;}
				set {  _currency = value;}
			}
			public decimal? Amount
			{
				get {  return _amount;}
				set {  _amount = value;}
			}
			public string Surveyor
			{
				get {  return _surveyor;}
				set {  _surveyor = value;}
			}
			public string Status
			{
				get {  return _status;}
				set {  _status = value;}
			}
			public string Reviewer
			{
				get {  return _reviewer;}
				set {  _reviewer = value;}
			}
			public string Remark
			{
				get {  return _remark;}
				set {  _remark = value;}
			}
			public string cashier
			{
				get {  return _cashier;}
				set {  _cashier = value;}
			}
			public string reason
			{
				get {  return _reason;}
				set {  _reason = value;}
			}
			public string payer
			{
				get {  return _payer;}
				set {  _payer = value;}
			}
			public DateTime? payTime
			{
				get {  return _payTime;}
				set {  _payTime = value;}
			}
			public string remark1
			{
				get {  return _remark1;}
				set {  _remark1 = value;}
			}
			public string remark2
			{
				get {  return _remark2;}
				set {  _remark2 = value;}
			}
	}
}
