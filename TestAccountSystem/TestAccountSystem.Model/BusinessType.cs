//============================================================
// author:yangyiliang
//============================================================

using System;
using System.Collections.Generic;
using System.Text;

namespace TestAccountSystem.Model
{	
	[Serializable()]
	public class BusinessType
	{	
			private int _iD;
			private string _businessNumber;
			private string _businessName;
			private decimal _k1;
			private decimal _k2;
			private decimal _k3;
			private decimal _k4;
			private decimal _k5;
			private decimal _c1;
			private decimal _c2;
			private decimal _c3;
			private decimal _c4;
			private decimal _c5;
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
			public decimal K1
			{
				get {  return _k1;}
				set {  _k1 = value;}
			}
			public decimal K2
			{
				get {  return _k2;}
				set {  _k2 = value;}
			}
			public decimal K3
			{
				get {  return _k3;}
				set {  _k3 = value;}
			}
			public decimal K4
			{
				get {  return _k4;}
				set {  _k4 = value;}
			}
			public decimal K5
			{
				get {  return _k5;}
				set {  _k5 = value;}
			}
			public decimal C1
			{
				get {  return _c1;}
				set {  _c1 = value;}
			}
			public decimal C2
			{
				get {  return _c2;}
				set {  _c2 = value;}
			}
			public decimal C3
			{
				get {  return _c3;}
				set {  _c3 = value;}
			}
			public decimal C4
			{
				get {  return _c4;}
				set {  _c4 = value;}
			}
			public decimal C5
			{
				get {  return _c5;}
				set {  _c5 = value;}
			}
			public string Remark
			{
				get {  return _remark;}
				set {  _remark = value;}
			}
	}
}
