//============================================================
// author:wangzhenkun
//============================================================

using System;
using System.Collections.Generic;
using System.Text;

namespace TestAccountSystem.Model
{	
	[Serializable()]
	public class CodeRegulation1
	{	
			private int _id;
			private string _name;
			private string _prefix;
			private string _connector1;
			private string _timeType;
			private string _connector2;
			private int? _digistNum;
			private string _startSerial;
			private string _example;
			private string _remark1;
			private string _remark2;
			public int id
			{
				get {  return _id;}
				set {  _id = value;}
			}
			public string name
			{
				get {  return _name;}
				set {  _name = value;}
			}
			public string prefix
			{
				get {  return _prefix;}
				set {  _prefix = value;}
			}
			public string connector1
			{
				get {  return _connector1;}
				set {  _connector1 = value;}
			}
			public string timeType
			{
				get {  return _timeType;}
				set {  _timeType = value;}
			}
			public string connector2
			{
				get {  return _connector2;}
				set {  _connector2 = value;}
			}
			public int? digistNum
			{
				get {  return _digistNum;}
				set {  _digistNum = value;}
			}
			public string startSerial
			{
				get {  return _startSerial;}
				set {  _startSerial = value;}
			}
			public string example
			{
				get {  return _example;}
				set {  _example = value;}
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
