//============================================================
// author:yangyiliang
//============================================================

using System;
using System.Collections.Generic;
using System.Text;

namespace TestAccountSystem.Model
{	
	[Serializable()]
	public class ChargeProject
	{	
			private int _iD;
			private string _businessNumber;
			private string _businessName;
			private string _registerNumber;
			private string _projectNumber;
			private string _projectName;
			private string _billingUnit;
			private decimal _billingPrice;
			private int _quantity;
			private string _remark;
			public int ID
			{
				get {  return _iD;}
				set {  _iD = value;}
			}
			public string BusinessNumber
			{
				get {  return _businessNumber;}
				set {  _businessNumber = value;}
			}
			public string BusinessName
			{
				get {  return _businessName;}
				set {  _businessName = value;}
			}
			public string RegisterNumber
			{
				get {  return _registerNumber;}
				set {  _registerNumber = value;}
			}
			public string ProjectNumber
			{
				get {  return _projectNumber;}
				set {  _projectNumber = value;}
			}
			public string ProjectName
			{
				get {  return _projectName;}
				set {  _projectName = value;}
			}
			public string BillingUnit
			{
				get {  return _billingUnit;}
				set {  _billingUnit = value;}
			}
			public decimal BillingPrice
			{
				get {  return _billingPrice;}
				set {  _billingPrice = value;}
			}
			public int Quantity
			{
				get {  return _quantity;}
				set {  _quantity = value;}
			}
			public string Remark
			{
				get {  return _remark;}
				set {  _remark = value;}
			}
	}
}
