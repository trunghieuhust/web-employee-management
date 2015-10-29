<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@taglib uri="/tags/struts-logic" prefix="logic"%>
<%@taglib uri="/tags/struts-bean" prefix="bean"%>

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
    <bean:write name="result" />ユーザーが登録されました。
  </logic:equal>
    <logic:equal name="result" value="0">
  エラーが発生します。ユーザーが登録できません。
  </logic:equal>
  </logic:notPresent>

  <form action="<%=request.getContextPath()%>/viewList.do">
    <input type="submit" value="戻る" />
  </form>
