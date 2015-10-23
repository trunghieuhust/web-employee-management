package com.bigtreetc.kenshuu.dao;

import java.util.List;

import com.bigtreetc.kenshuu.bean.PostBean;
import com.bigtreetc.kenshuu.bean.UserBean;

public interface UserDAO {
    public List<UserBean> getAllUser();

    public UserBean searchByID(int ID);

    public int insertNewEmployee(UserBean user);

    public int deleteEmployee(int empID);

    public int updateEmployee(UserBean user);

    public boolean authenticate(int empID, String password);

    public List<PostBean> getAllPost();

    public String getDeptNameByID(int deptID);
}
