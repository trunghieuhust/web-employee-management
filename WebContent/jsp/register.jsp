<%@page import="com.bigtreetc.kenshuu.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>社員情報登録入力</title>
</head>
<body>
  <%
    String actionURL = "/register.do";
  %>

  <logic:present name="empId">
    <%
      actionURL = "/confirm.do";
    %>
  </logic:present>

  <html:form action="<%=actionURL%>" method="get">
    <p>
      パスワード：
      <html:text property="empPass"></html:text>
      <html:errors property="password" />
    </p>
    <p>
      社員名：
      <html:text property="empName"></html:text>

      <html:errors property="name" />
    </p>
    <p>
      性別：
      <html:radio property="gender" value="1"></html:radio>
      男性
      <html:radio property="gender" value="2"></html:radio>
      女性
      <html:errors property="gender" />
    </p>
    <p>
      住所：
      <html:text property="address"></html:text>
      <html:errors property="address" />
    </p>
    <p>
      誕生日：
      <html:text property="birthday"></html:text>
      YYYY/MM/DD
      <html:errors property="birthday" />
    </p>
    <p>
      権限：
      <html:radio property="authority" value="1"></html:radio>
      一般
      <html:radio property="authority" value="2"></html:radio>
      管理者

      <html:errors property="authority" />
    </p>
    <p>
      部署：
      <html:select property="deptId">
        <html:option value="1">総務部</html:option>
        <html:option value="2">営業部</html:option>
        <html:option value="3">経理部</html:option>
        <html:option value="4">資材部</html:option>
      </html:select>
    </p>
    <p>
      <html:submit>確認</html:submit>
    </p>
    <logic:present name="empId">
      <html:hidden value="${empId}" property="empId" />
    </logic:present>
  </html:form>

</body>
</html>