<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <p>
    <bean:message key="message.confirm" />
  </p>
  <logic:present name="userBean" property="empId">
    <p>
      <bean:write name="userBean" property="empId" />
    </p>

  </logic:present>

  <p>
    パスワード：
    <bean:write name="userBean" property="empPass" />
  </p>
  <p>
    社員名：
    <bean:write name="userBean" property="empName" />
  </p>
  <p>
    性別：
    <logic:equal name="userBean" property="gender" value="1">
      男性
    </logic:equal>
    <logic:equal name="userBean" property="gender" value="2">
      女性
    </logic:equal>
  </p>
  <p>
    住所：
    <bean:write name="userBean" property="address" />
  </p>
  <p>
    誕生日：
    <bean:write name="userBean" property="birthday" />
  </p>
  <p>
    部署名：
    <bean:write name="postBean" property="postName" />
  </p>
  <html:form action="/confirm" method="post">
    <logic:present name="userBean" property="empId">
      <html:hidden name="userBean" property="empId" />
    </logic:present>
    <html:hidden property="empPass" />
    <html:hidden property="empName" />
    <html:hidden property="gender" />
    <html:hidden property="address" />
    <html:hidden property="birthday" />
    <html:hidden property="deptId" />
    <html:submit>保存</html:submit>
  </html:form>
  <button name="back" onclick="history.back()">戻る</button>
</body>
</html>