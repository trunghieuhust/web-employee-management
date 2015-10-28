<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<form method="post" action="<%=request.getContextPath()%>/authen.do">
  ID: <input type="text" name="id" /> <br /> パスワード: <input
    type="password" name="password" /> <br /> <input type="submit"
    value="ログイン" />
  <html:errors property="id" />
  <br />
  <html:errors property="password" />
  <br />
  <html:errors property="failed" />
  <br />
  <html:errors property="login_required" />
  <br />
  <html:errors property="permission_denied" />
</form>
