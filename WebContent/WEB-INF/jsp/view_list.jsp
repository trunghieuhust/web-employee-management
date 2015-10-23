<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" isELIgnored="true"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Lesson02 Question02</title>
</head>
<body>
  <table border="1" cellpadding="3"
    style="border-collapse: collapse; text-align: center;">
    <tr>
      <td>ID</td>
      <td>社員名</td>
      <td>部署名</td>

      <!-- 管理者に対して、社員の全情報を表示機能 -->
      <logic:equal name="current_user" property="authority" value="2"
        scope="session">
        <td>性別</td>
        <td>住所</td>
        <td>誕生日</td>
      </logic:equal>

    </tr>
    <logic:iterate id="employee" name="userList">
      <tr>
        <td><bean:write name="employee" property="empId" /></td>
        <td><bean:write name="employee" property="empName" /></td>
        <td><bean:write name="employee" property="postBean.postName" /></td>

        <!-- 管理者に対して、社員の全情報を表示機能 -->
        <logic:equal name="current_user" property="authority" value="2"
          scope="session">
          <logic:equal name="employee" property="gender" value="1">
            <td>男</td>
          </logic:equal>
          <logic:equal name="employee" property="gender" value="2">
            <td>女</td>
          </logic:equal>
          <td><bean:write name="employee" property="address" /></td>
          <td><bean:write name="employee" property="birthday" /></td>
        </logic:equal>

      </tr>
      <br />
    </logic:iterate>
  </table>
  <a href="<%=request.getContextPath()%>/logout.do">Logout</a>
</body>
</html>