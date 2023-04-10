//============================================================
// author:yangyiliang
//============================================================

using System;
using System.Collections.Generic;
using System.Text;

namespace TestAccountSystem.Model
{	
	[Serializable()]
	public class PriceCoefficient
	{	
			private int _iD;
			private string _businessNumber;
			private string _businessName;
			private string _priceCoefficientNumber;
			private string _priceCoefficientName;
			private double _k1;
			private double _k2;
			private double _k3;
			private double _k4;
			private double _k5;
			private double _c1;
			private double _c2;
			private double _c3;
			private double _c4;
			private double _c5;
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
			public string PriceCoefficientNumber
			{
				get {  return _priceCoefficientNumber;}
				set {  _priceCoefficientNumber = value;}
			}
			public string PriceCoefficientName
			{
				get {  return _priceCoefficientName;}
				set {  _priceCoefficientName = value;}
			}
			public double K1
			{
				get {  return _k1;}
				set {  _k1 = value;}
			}
			public double K2
			{
				get {  return _k2;}
				set {  _k2 = value;}
			}
			public double K3
			{
				get {  return _k3;}
				set {  _k3 = value;}
			}
			public double K4
			{
				get {  return _k4;}
				set {  _k4 = value;}
			}
			public double K5
			{
				get {  return _k5;}
				set {  _k5 = value;}
			}
			public double C1
			{
				get {  return _c1;}
				set {  _c1 = value;}
			}
			public double C2
			{
				get {  return _c2;}
				set {  _c2 = value;}
			}
			public double C3
			{
				get {  return _c3;}
				set {  _c3 = value;}
			}
			public double C4
			{
				get {  return _c4;}
				set {  _c4 = value;}
			}
			public double C5
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
