//============================================================
// author:wangzhenkun
//============================================================

using System;
using System.Collections.Generic;
using System.Text;

namespace TestAccountSystem.Model
{	
	[Serializable()]
	public class RoleRightInfo
	{	
			private int _id;
			private int _roleId;
			private string _rightCode;
			public int id
			{
				get {  return _id;}
				set {  _id = value;}
			}
			public int roleId
			{
				get {  return _roleId;}
				set {  _roleId = value;}
			}
			public string rightCode
			{
				get {  return _rightCode;}
				set {  _rightCode = value;}
			}
	}
}
