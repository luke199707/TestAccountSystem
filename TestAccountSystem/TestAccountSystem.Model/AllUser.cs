//============================================================
// author:wangzhenkun
//============================================================

using System;
using System.Collections.Generic;
using System.Text;

namespace TestAccountSystem.Model
{	
	[Serializable()]
	public class AllUser
	{	
			private int _id;
			private string _userName;
			private string _pwd;
			private string _email;
			private int _roleId;
			private bool _state;
			private bool _isUseful;
			private string _remark;
			private string _realName;
			private string _remark1;
			public int id
			{
				get {  return _id;}
				set {  _id = value;}
			}
			public string userName
			{
				get {  return _userName;}
				set {  _userName = value;}
			}
			public string pwd
			{
				get {  return _pwd;}
				set {  _pwd = value;}
			}
			public string email
			{
				get {  return _email;}
				set {  _email = value;}
			}
			public int roleId
			{
				get {  return _roleId;}
				set {  _roleId = value;}
			}
			public bool state
			{
				get {  return _state;}
				set {  _state = value;}
			}
			public bool isUseful
			{
				get {  return _isUseful;}
				set {  _isUseful = value;}
			}
			public string remark
			{
				get {  return _remark;}
				set {  _remark = value;}
			}
			public string realName
			{
				get {  return _realName;}
				set {  _realName = value;}
			}
			public string remark1
			{
				get {  return _remark1;}
				set {  _remark1 = value;}
			}
	}
}
