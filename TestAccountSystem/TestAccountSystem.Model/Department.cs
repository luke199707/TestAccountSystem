//============================================================
// author:wangzhenkun
//============================================================

using System;
using System.Collections.Generic;
using System.Text;

namespace TestAccountSystem.Model
{
    [Serializable()]
    public class Department
    {
        private int _id;
        private string _dId;
        private string _unitId;
        private string _dName;
        private string _remark1;
        private string _remark2;

        public int id
        {
            get { return _id; }
            set { _id = value; }
        }
        public string dId
        {
            get { return _dId; }
            set { _dId = value; }
        }
        public string unitId
        {
            get { return _unitId; }
            set { _unitId = value; }
        }
        public string dName
        {
            get { return _dName; }
            set { _dName = value; }
        }
        public string remark1
        {
            get { return _remark1; }
            set { _remark1 = value; }
        }
        public string remark2
        {
            get { return _remark2; }
            set { _remark2 = value; }
        }
        //--------------------------------------------------------
        private string _unitName;
        public string unitName
        {
            get { return _unitName; }
            set { _unitName = value; }
        }
    }
}
