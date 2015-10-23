package com.bigtreetc.kenshuu.form;

import org.apache.struts.action.ActionForm;

public class DeleteForm extends ActionForm {
    private int empId;

    public void setEmpId(int empId) {
        this.empId = empId;
    }

    public int getEmpId() {
        return empId;
    }

}