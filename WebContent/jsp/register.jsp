<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>社員情報登録入力</title>
</head>
<body>
  <html:form action="/register.do" method="POST">
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
    <!--     <p> -->
    <!--       部署： -->
    <%--       <html:radio property="deptId" value="1"></html:radio> --%>
    <!--       総務部 -->
    <%--       <html:radio property="deptId" value="2"></html:radio> --%>
    <!--       営業部 -->
    <%--       <html:radio property="deptId" value="3"></html:radio> --%>
    <!--       経理部 -->
    <%--       <html:radio property="deptId" value="4"></html:radio> --%>
    <!--       資材部 -->

    <%--       <html:errors property="dept" /> --%>
    <!--     </p> -->
    <p>
      <html:submit>確認</html:submit>
    </p>
  </html:form>

</body>
</html>