package com.bigtreetc.kenshuu.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bigtreetc.kenshuu.bean.PostBean;
import com.bigtreetc.kenshuu.bean.UserBean;
import com.bigtreetc.kenshuu.database.ConnectionPool;

public class OracleUserDAO implements UserDAO {
    private static final String SQL_GET_ALL_USER = "SELECT emp_id,emp_pass,emp_name,gender,address,birthday,e.dept_id,dept_name,authority FROM EMP_TABLE e INNER JOIN DEPT_TABLE d ON e.dept_id = d.dept_id ";
    private static final String SQL_SEARCH_BY_ID_POSTFIX = "WHERE emp_id = ?";
    private static final String SQL_SEARCH_BY_NAME_POSTFIX = "WHERE emp_name LIKE ?";
    private static final String SQL_SEARCH_BY_GENDER_POSTFIX = "WHERE gender = ?";
    private static final String SQL_SEARCH_BY_DEPARTMENT_POSTFIX = "WHERE e.dept_id = ?";
    private static final String SQL_INSERT_NEW_EMP = "INSERT INTO EMP_TABLE (emp_id,emp_pass, emp_name, gender, address, birthday, dept_id,authority) values (sq_empId.nextval,?,?,?,?,?,?,?)";
    private static final String SQL_DELETE_EMP = "DELETE FROM EMP_TABLE WHERE EMP_ID= ?";
    private static final String SQL_CHECK_EXISTED = "SELECT COUNT(*) AS total FROM emp_table WHERE emp_id = ?";
    private static final String SQL_UPDATE_EXISTED_USER = "UPDATE EMP_TABLE SET emp_pass = ?, emp_name = ?, gender = ?, address = ?, birthday = ?, dept_id = ?, authority = ? WHERE emp_id = ?";
    private static final String SQL_IS_ADMIN = "SELECT is_admin FROM EMP_TABLE WHERE emp_id = ?" ;
    private static final String SQL_AUTHENTICATE = "SELECT COUNT(*) AS total FROM emp_table WHERE emp_id = ? AND emp_pass = ?";
    private static final String SQL_GET_ALL_DEPT = "select * from dept_table";
    private static final String SQL_GET_DEPT_NAME_BY_ID = "select dept_name from dept_table where dept_id= ?";

    private static final String EMP_ID = "emp_id";
    private static final String EMP_PASS = "emp_pass";
    private static final String EMP_NAME = "emp_name";
    private static final String GENDER = "gender";
    private static final String ADDRESS = "address";
    private static final String BIRTHDAY = "birthday";
    private static final String DEPT_ID = "dept_id";
    private static final String DEPT_NAME = "dept_name";
    private static final String TOTAL = "total";
    private static final String AUTHORITY = "authority";

    @Override
    public List<UserBean> getAllUser() {
        Statement statement;
        List<UserBean> usersList = null;
        try {
            Connection conn = ConnectionPool.getConnection();
            statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(SQL_GET_ALL_USER);
            usersList = convertToListUsers(resultSet);
            ConnectionPool.release(conn, statement, resultSet);
        } catch (SQLException e1) {
            e1.printStackTrace();
        }
        return usersList;

    }

    @Override
    public UserBean searchByID(int ID) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        UserBean userBean = null;
        Connection conn = null;
        try {
            conn = ConnectionPool.getConnection();
            preparedStatement = conn.prepareStatement(SQL_GET_ALL_USER
                    + SQL_SEARCH_BY_ID_POSTFIX);
            preparedStatement.setInt(1, ID);
            resultSet = preparedStatement.executeQuery();
            List<UserBean> resultList = convertToListUsers(resultSet);
            if (resultList.size() == 1) {
                userBean = resultList.get(0);
            } else {
                userBean = null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionPool.release(conn, preparedStatement, resultSet);
        }
        return userBean;

    }

    @Override
    public int insertNewEmployee(UserBean user) {
        PreparedStatement preparedStatement;
        int affectedCount = 0;
        try {
            Connection conn = ConnectionPool.getConnection();
            preparedStatement = conn.prepareStatement(SQL_INSERT_NEW_EMP);
            preparedStatement.setString(1, user.getEmpPass());
            preparedStatement.setString(2, user.getEmpName());
            preparedStatement.setInt(3, user.getGender());
            preparedStatement.setString(4, user.getAddress());
            preparedStatement.setString(5, user.getBirthday());
            preparedStatement.setInt(6, user.getPostBean().getPostId());
            preparedStatement.setInt(7, user.getAuthority());
            affectedCount = preparedStatement.executeUpdate();
            ConnectionPool.release(conn, preparedStatement);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return affectedCount;
    }

    @Override
    public int deleteEmployee(int empID) {
        PreparedStatement preparedStatement;
        int affectedCount = 0;
        try {
            Connection conn = ConnectionPool.getConnection();
            preparedStatement = conn.prepareStatement(SQL_DELETE_EMP);
            preparedStatement.setInt(1, empID);
            affectedCount = preparedStatement.executeUpdate();
            ConnectionPool.release(conn, preparedStatement);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return affectedCount;
    }

    @Override
    public boolean authenticate(int empID, String password) {
        PreparedStatement preparedStatement;
        Connection conn = null;
        try {
            conn = ConnectionPool.getConnection();
            preparedStatement = conn.prepareStatement(SQL_AUTHENTICATE);
            preparedStatement.setInt(1, empID);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();
            if (resultSet.getInt(TOTAL) == 1) {
                ConnectionPool.release(conn, preparedStatement, resultSet);
                return true;
            } else {
                ConnectionPool.release(conn, preparedStatement, resultSet);
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
//"UPDATE EMP_TABLE SET emp_pass = ?, emp_name = ?, gender = ?, address = ?, birthday = ?, dept_id = ?, authority = ? WHERE emp_id = ?";

    @Override
    public int updateEmployee(UserBean user) {
        PreparedStatement preparedStatement;
        Connection conn = null;
        int affectedCount = 0;
        try {
            conn = ConnectionPool.getConnection();
            preparedStatement = conn.prepareStatement(SQL_UPDATE_EXISTED_USER);
            preparedStatement.setString(1, user.getEmpPass());
            preparedStatement.setString(2, user.getEmpName());
            preparedStatement.setInt(3, user.getGender());
            preparedStatement.setString(4, user.getAddress());
            preparedStatement.setString(5, user.getBirthday());
            preparedStatement.setInt(6, user.getPostBean().getPostId());
            preparedStatement.setInt(7, user.getAuthority());
            preparedStatement.setInt(8, user.getEmpId());
            affectedCount = preparedStatement.executeUpdate();
            ConnectionPool.release(conn, preparedStatement);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return affectedCount;
    }

    private List<UserBean> convertToListUsers(ResultSet resultSet) {
        List<UserBean> usersList = new ArrayList<UserBean>();
        try {
            while (resultSet.next()) {
                UserBean user = new UserBean();
                user.setAddress(resultSet.getString(ADDRESS));
                Date birthday = resultSet.getDate(BIRTHDAY);
                user.setBirthday(birthday.toString());
                PostBean postBean = new PostBean();
                postBean.setPostId(resultSet.getInt(DEPT_ID));
                postBean.setPostName(resultSet.getString(DEPT_NAME));
                user.setPostBean(postBean);
                user.setGender(resultSet.getInt(GENDER));
                user.setEmpId(resultSet.getInt(EMP_ID));
                user.setEmpName(resultSet.getString(EMP_NAME));
                user.setEmpPass(resultSet.getString(EMP_PASS));
                user.setAuthority(resultSet.getInt(AUTHORITY));
                usersList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usersList;
    }

    @Override
    public List<PostBean> getAllPost() {
        List<PostBean> postList = new ArrayList<PostBean>();
        Connection conn = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            conn = ConnectionPool.getConnection();
            statement = conn.createStatement();
            resultSet = statement.executeQuery(SQL_GET_ALL_DEPT);
            while (resultSet.next()) {
                PostBean postBean = new PostBean();
                postBean.setPostId(resultSet.getInt(DEPT_ID));
                postBean.setPostName(resultSet.getString(DEPT_NAME));
                postList.add(postBean);
            }
            ConnectionPool.release(conn, statement, resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return postList;
    }

    @Override
    public String getDeptNameByID(int deptID) {
        String deptName = "";
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            conn = ConnectionPool.getConnection();
            statement = conn.prepareStatement(SQL_GET_DEPT_NAME_BY_ID);
            statement.setInt(1, deptID);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                deptName = resultSet.getString(DEPT_NAME);
            }
            ConnectionPool.release(conn, statement, resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return deptName;
    }

}
