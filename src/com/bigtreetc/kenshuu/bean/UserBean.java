package com.bigtreetc.kenshuu.bean;

public class UserBean {
    private int empId;
    private String empPass;
    private String empName;
    private int gender;
    private String address;
    private String birthday;
    private PostBean postBean;
    private int authority;

    public int getEmpId() {
        return empId;
    }

    public void setEmpId(int empId) {
        this.empId = empId;
    }

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

    public PostBean getPostBean() {
        return postBean;
    }

    public void setPostBean(PostBean postBean) {
        this.postBean = postBean;
    }

    public void setAuthority(int authority) {
        this.authority = authority;
    }

    public int getAuthority() {
        return authority;
    }
}
