//============================================================
// author:wangzhenkun
//============================================================

using System;
using System.Collections.Generic;
using System.Text;

namespace TestAccountSystem.Model
{	
	[Serializable()]
	public class FunctionModel
	{	
			private int _id;
			private string _parentId;
			private string _name;
			private string _code;
			private string _currentId;
			private string _url;
			private string _css;
			private string _target;
			private string _remark;
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
			public string currentId
			{
				get {  return _currentId;}
				set {  _currentId = value;}
			}
			public string url
			{
				get {  return _url;}
				set {  _url = value;}
			}
			public string css
			{
				get {  return _css;}
				set {  _css = value;}
			}
			public string target
			{
				get {  return _target;}
				set {  _target = value;}
			}
			public string remark
			{
				get {  return _remark;}
				set {  _remark = value;}
			}
	}
}
