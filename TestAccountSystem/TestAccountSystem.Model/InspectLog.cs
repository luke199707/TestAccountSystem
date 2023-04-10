//============================================================
// author:yangyiliang
//============================================================

using System;
using System.Collections.Generic;
using System.Text;

namespace TestAccountSystem.Model
{	
	[Serializable()]
	public class InspectLog
	{	
			private int _iD;
			private string _logNumber;
			private string _registerNumber;
			private string _location;
			private string _inspector;
			private string _inspectionContent;
			private DateTime _time;
			private string _remark;
			public int ID
			{
				get {  return _iD;}
				set {  _iD = value;}
			}
			public string LogNumber
			{
				get {  return _logNumber;}
				set {  _logNumber = value;}
			}
			public string RegisterNumber
			{
				get {  return _registerNumber;}
				set {  _registerNumber = value;}
			}
			public string Location
			{
				get {  return _location;}
				set {  _location = value;}
			}
			public string Inspector
			{
				get {  return _inspector;}
				set {  _inspector = value;}
			}
			public string InspectionContent
			{
				get {  return _inspectionContent;}
				set {  _inspectionContent = value;}
			}
			public DateTime Time
			{
				get {  return _time;}
				set {  _time = value;}
			}
			public string Remark
			{
				get {  return _remark;}
				set {  _remark = value;}
			}
	}
}
