package com.bigtreetc.kenshuu.form;

import org.apache.struts.validator.ValidatorForm;

import com.bigtreetc.kenshuu.bean.PostBean;

public class RegisterForm extends ValidatorForm {
    private String empPass;
    private String empName;
    private int gender;
    private String address;
    private String birthday;
    private int deptId;
    private int authority;

    public String getEmpPass() {
        return empPass;
    }

    public void setEmpPass(String empPass) {
        this.empPass = empPass;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public int getAuthority() {
        return authority;
    }

    public void setAuthority(int authority) {
        this.authority = authority;
    }

    public void setDeptId(int depId) {
        this.deptId = depId;
    }

    public int getDeptId() {
        return deptId;
    }
}
