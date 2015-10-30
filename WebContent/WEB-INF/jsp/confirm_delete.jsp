<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<div id="legend">
  <legend class="form-title">
    <label style="text-align: center;"> ID= <bean:write
        name="empId" /> のユーザーが削除します。よろしいですか？
    </label>
  </legend>
</div>
<label class="col-sm-4 control-label"></label>
<html:form action="/delete.do" method="post">
  <html:hidden property="empId" />
  <div class="form-group form-inline">

    <div class="col-sm-1">
      <html:submit styleClass="btn btn-primary">確認</html:submit>

    </div>
    <div class="col-sm-1">
      <button name="back" class="btn btn-primary" onclick="history.back()">やり直す</button>
    </div>
  </div>

</html:form>

