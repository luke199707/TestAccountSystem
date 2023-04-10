//============================================================
// author:wangzhenkun
//============================================================

using System;
using System.Collections.Generic;
using System.Text;

namespace TestAccountSystem.Model
{
    [Serializable()]
    public class Customer
    {
        private int _id;
        private string _userName;
        private string _pwd;
        private string _email;
        private string _customerNumber;
        private string _address;
        private string _companyName;
        private string _openUnit;
        private string _bankAccount;
        private string _legalPerson;
        private string _phone;
        private bool _state;
        private bool _isUseFul;
        //---------
        private int _roleId;
        //----------
        public int id
        {
            get { return _id; }
            set { _id = value; }
        }
        public string userName
        {
            get { return _userName; }
            set { _userName = value; }
        }
        public string pwd
        {
            get { return _pwd; }
            set { _pwd = value; }
        }
        public string email
        {
            get { return _email; }
            set { _email = value; }
        }
        public string customerNumber
        {
            get { return _customerNumber; }
            set { _customerNumber = value; }
        }
        public string address
        {
            get { return _address; }
            set { _address = value; }
        }
        public string companyName
        {
            get { return _companyName; }
            set { _companyName = value; }
        }
        public string openUnit
        {
            get { return _openUnit; }
            set { _openUnit = value; }
        }
        public string bankAccount
        {
            get { return _bankAccount; }
            set { _bankAccount = value; }
        }
        public string legalPerson
        {
            get { return _legalPerson; }
            set { _legalPerson = value; }
        }
        public string phone
        {
            get { return _phone; }
            set { _phone = value; }
        }
        public bool state
        {
            get { return _state; }
            set { _state = value; }
        }
        public bool isUseFul
        {
            get { return _isUseFul; }
            set { _isUseFul = value; }
        }

        //----------------------
        public int roleId
        {
            get { return _roleId; }
            set { _roleId = value; }
        }
        //--------------------------
    }
}
