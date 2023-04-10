//============================================================
// author:wangzhenkun
//============================================================

using System;
using System.Collections.Generic;
using System.Text;

namespace TestAccountSystem.Model
{	
	[Serializable()]
	public class QandA
	{	
			private int _id;
			private string _question;
			private string _answer;
			private string _remark1;
			private string _remark2;
			private string _remark3;
			public int id
			{
				get {  return _id;}
				set {  _id = value;}
			}
			public string question
			{
				get {  return _question;}
				set {  _question = value;}
			}
			public string answer
			{
				get {  return _answer;}
				set {  _answer = value;}
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
			public string remark3
			{
				get {  return _remark3;}
				set {  _remark3 = value;}
			}
	}
}
