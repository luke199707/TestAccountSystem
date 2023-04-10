//============================================================
// author:wangzhenkun
//============================================================

using System;
using System.Collections.Generic;
using System.Text;

namespace TestAccountSystem.Model
{	
	[Serializable()]
	public class TALog
	{	
			private int _id;
			private string _name;
			private string _operation;
			private string _description;
			private DateTime? _time1;
			private string _ip;
			private string _remark;
			private string _ipDesc;
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
			public string operation
			{
				get {  return _operation;}
				set {  _operation = value;}
			}
			public string description
			{
				get {  return _description;}
				set {  _description = value;}
			}
			public DateTime? time1
			{
				get {  return _time1;}
				set {  _time1 = value;}
			}
			public string ip
			{
				get {  return _ip;}
				set {  _ip = value;}
			}
			public string remark
			{
				get {  return _remark;}
				set {  _remark = value;}
			}
			public string ipDesc
			{
				get {  return _ipDesc;}
				set {  _ipDesc = value;}
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
