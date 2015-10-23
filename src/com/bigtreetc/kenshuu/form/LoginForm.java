package com.bigtreetc.kenshuu.form;

import org.apache.struts.validator.ValidatorForm;

public class LoginForm extends ValidatorForm {
    private String id = null;
    private String password = null;

    public String getId() {
        return id;
    }

    public String getPassword() {
        return password;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
