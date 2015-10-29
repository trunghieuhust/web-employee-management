<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@taglib uri="/tags/struts-logic" prefix="logic"%>
<%@taglib uri="/tags/struts-bean" prefix="bean"%>
  <logic:equal name="result" value="1">
    ID=<bean:write name="result" />のユーザーが削除されました。
  </logic:equal>
  <logic:equal name="result" value="0">
  エラーが発生します。ID=<bean:write name="result" />のユーザーが削除できません。
  </logic:equal>
    <form action="<%=request.getContextPath()%>/viewList.do">
    <input type="submit" value="戻る" />
  </form>
