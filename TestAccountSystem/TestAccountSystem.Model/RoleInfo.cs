//============================================================
// author:wangzhenkun
//============================================================

using System;
using System.Collections.Generic;
using System.Text;

namespace TestAccountSystem.Model
{	
	[Serializable()]
	public class RoleInfo
	{	
			private int _id;
			private int _roleId;
			private string _roleName;
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
			public string roleName
			{
				get {  return _roleName;}
				set {  _roleName = value;}
			}
	}
}
