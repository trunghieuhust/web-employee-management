<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@taglib uri="/tags/struts-logic" prefix="logic"%>
<%@taglib uri="/tags/struts-bean" prefix="bean"%>

<logic:present name="empId">
  <logic:equal name="result" value="1">
    <div class="alert alert-success fade in">
      ID=
      <bean:write name="empId" />
      のユーザーが更新されました。
    </div>
  </logic:equal>
  <logic:equal name="result" value="0">
    <div class="alert alert-danger fade in">
      <strong>エラー! </strong> エラーが発生します。ID=
      <bean:write name="empId" />
      のユーザーが更新できません。
    </div>
  </logic:equal>
</logic:present>

<logic:notPresent name="empId">
  <logic:equal name="result" value="1">
    <bean:write name="result" />ユーザーが登録されました。
  </logic:equal>
  <logic:equal name="result" value="0">
    <div class="alert alert-danger fade in">
      <strong>エラー! </strong> エラーが発生します。ユーザーが登録できません。
    </div>

  </logic:equal>
</logic:notPresent>

<form action="<%=request.getContextPath()%>/viewList.do">
  <div class="col-sm-6"></div>
  <input type="submit" class="btn btn-primary" value="戻る" />
</form>
