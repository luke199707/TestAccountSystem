//============================================================
// author:wangzhenkun
//============================================================

using System;
using System.Collections.Generic;
using System.Text;

namespace TestAccountSystem.Model
{	
	[Serializable()]
	public class DictInfo
	{	
			private int _id;
			private string _parentId;
			private string _name;
			private string _code;
			private string _remark1;
			private string _remark2;
			public int id
			{
				get {  return _id;}
				set {  _id = value;}
			}
			public string parentId
			{
				get {  return _parentId;}
				set {  _parentId = value;}
			}
			public string name
			{
				get {  return _name;}
				set {  _name = value;}
			}
			public string code
			{
				get {  return _code;}
				set {  _code = value;}
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
