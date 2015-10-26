<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <form method="post" action="<%=request.getContextPath()%>/login.do">
    ID: <input type="text" name="id" />
    <html:errors property="id" />
    <br /> <br /> パスワード: <input type="password" name="password" />
    <html:errors property="password" />
    <br />
    <html:errors property="failed" />
    <br />
    <html:errors property="login_required" />
    <br />
    <html:errors property="permission_denied" />
    <br /> <input type="submit" value="ログイン" />
  </form>
</body>
</html>