//============================================================
// author:wangzhenkun
//============================================================

using System;
using System.Collections.Generic;
using System.Text;

namespace TestAccountSystem.Model
{	
	[Serializable()]
	public class UserRight
	{	
			private int _id;
			private string _userId;
			private string _code;
			private string _remark1;
			private string _remark2;
			public int id
			{
				get {  return _id;}
				set {  _id = value;}
			}
			public string userId
			{
				get {  return _userId;}
				set {  _userId = value;}
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
