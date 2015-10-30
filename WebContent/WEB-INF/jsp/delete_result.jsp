<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@taglib uri="/tags/struts-logic" prefix="logic"%>
<%@taglib uri="/tags/struts-bean" prefix="bean"%>
<logic:equal name="result" value="1">
  <div class="alert alert-success fade in">
    ID=
    <bean:write name="result" />
    のユーザーが削除されました。
  </div>
</logic:equal>
<logic:equal name="result" value="0">
  <div class="alert alert-danger fade in">
    <strong>エラー! </strong> エラーが発生します。ID=
    <bean:write name="result" />
    のユーザーが削除できません。
  </div>
</logic:equal>
<form action="<%=request.getContextPath()%>/viewList.do">
  <div class="col-sm-6"></div>
  <input type="submit" class="btn btn-primary" value="戻る" />
</form>
