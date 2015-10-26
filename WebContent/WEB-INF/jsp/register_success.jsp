<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@taglib uri="/tags/struts-logic" prefix="logic"%>
<%@taglib uri="/tags/struts-bean" prefix="bean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

  <logic:present name="empId">
    <logic:equal name="result" value="1">
    ID=<bean:write name="empId" />のユーザーが更新されました。
  </logic:equal>
    <logic:equal name="result" value="0">
  エラーが発生します。ID=<bean:write name="empId" />のユーザーが更新できません。
  </logic:equal>
  </logic:present>

  <logic:notPresent name="empId">
    <logic:equal name="result" value="1">
    ID=<bean:write name="result" />のユーザーが登録されました。
  </logic:equal>
    <logic:equal name="result" value="0">
  エラーが発生します。ID=<bean:write name="result" />のユーザーが登録できません。
  </logic:equal>
  </logic:notPresent>

  <form action="<%=request.getContextPath()%>/viewList.do">
    <input type="submit" value="戻る" />
  </form>
</body>
</html>