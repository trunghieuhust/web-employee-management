<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <c:if
          test="${current_user.authority ==2 || current_user.empId == employee.empId}">
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
          <bean:define id="deptId" name="employee" property="postBean.postId"
            toScope="request"></bean:define>
          <bean:define id="empId" name="employee" property="empId"></bean:define>
          <td><html:form method="get" action="/update.do">
              <html:hidden name="employee" property="empId" />
              <html:hidden name="employee" property="empPass" />
              <html:hidden name="employee" property="empName" />
              <html:hidden name="employee" property="gender" />
              <html:hidden name="employee" property="address" />
              <html:hidden name="employee" property="birthday" />
              <html:hidden name="employee" property="authority" />
              <html:hidden value="<%=deptId.toString()%>" property="deptId" />
              <%--               <html:hidden --%>
              <%--                 value="<bean:write name="employee" property="postBean.postId"/>" --%>
              <%--                 property="deptId" /> --%>
              <html:submit>更新</html:submit>
            </html:form></td>
        </c:if>

        <logic:equal name="current_user" property="authority" value="2"
          scope="session">
          <td><html:form action="/confirmdelete.do" method="get">
              <html:hidden name="employee" property="empId" />
              <html:submit>削除</html:submit>
            </html:form></td>
        </logic:equal>
      </tr>
      <br />
    </logic:iterate>
  </table>

  <a href="<%=request.getContextPath()%>/logout.do">Logout</a>
</body>
</html>