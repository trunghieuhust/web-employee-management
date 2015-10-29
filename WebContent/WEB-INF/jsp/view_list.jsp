<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<table class="table table-hover">
  <tr>
    <th>ID</th>
    <th>社員名</th>
    <th>部署名</th>

    <!-- 管理者に対して、社員の全情報を表示機能 -->
    <logic:equal name="current_user" property="authority" value="2"
      scope="session">
      <th>性別</th>
      <th>住所</th>
      <th>誕生日</th>
    </logic:equal>
    <th>管理</th>
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

      </c:if>
      <td><bean:define id="deptId" name="employee"
          property="postBean.postId" toScope="request"></bean:define> <bean:define
          id="empId" name="employee" property="empId"></bean:define>

        <div class="btn-group">
          <html:form method="post" action="/update.do">
            <html:hidden name="employee" property="empId" />
            <html:hidden name="employee" property="empPass" />
            <html:hidden name="employee" property="empName" />
            <html:hidden name="employee" property="gender" />
            <html:hidden name="employee" property="address" />
            <html:hidden name="employee" property="birthday" />
            <html:hidden name="employee" property="authority" />
            <html:hidden value="<%=deptId.toString()%>" property="deptId" />
            <button type="submit" class="btn btn-default"
              aria-label="Left Align" style="margin-left: 2px">
              <span class="glyphicon glyphicon-pencil " aria-hidden="true"></span>
            </button>
          </html:form>
        </div> <logic:equal name="current_user" property="authority" value="2"
          scope="session">
          <div class="btn-group">
            <html:form action="/confirmdelete.do" method="post">
              <html:hidden name="employee" property="empId" />
              <button type="submit" class="btn btn-default"
                aria-label="Left Align" style="margin-left: 2px">
                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
              </button>
            </html:form>
          </div></td>
      </logic:equal>
    </tr>
  </logic:iterate>
</table>
