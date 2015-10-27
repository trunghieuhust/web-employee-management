<%@page import="com.bigtreetc.kenshuu.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
  rel="stylesheet">
<title>社員情報入力</title>
</head>
<body>
  <div class="span6">
    <div class="wrap-form">
      <html:form styleClass="form-horizontal" action="/input.do"
        method="get">
        <logic:present name="empId">
          <div id="legend">
            <legend class="form-title">社員情報更新入力</legend>
          </div>
          <div class="form-group">
            <label class="col-sm-4 control-label">ID</label>
            <div class="col-sm-8">
              <html:text property="empId" styleClass="form-control"
                disabled="true"></html:text>
            </div>
          </div>

        </logic:present>
        <logic:notPresent name="empId">
          <div id="legend">
            <legend class="form-title">社員情報登録入力</legend>
          </div>
        </logic:notPresent>

        <div class="form-group">
          <label class="col-sm-4 control-label">パスワード</label>
          <div class="col-sm-8">
            <html:text property="empPass" styleClass="form-control"></html:text>
          </div>
        </div>

        <div class="form-group">
          <label class="col-sm-4 control-label">社員名</label>
          <div class="col-sm-8">
            <html:text property="empName" styleClass="form-control"></html:text>
          </div>
        </div>
        <div class="form-group form-inline">
          <label class="col-sm-4 control-label">性別 </label>
          <div class="col-sm-4 ">
            <div class="radio my-radio">
              <input type="radio" name="gender" value="1" class="radio"
                checked="checked" /> 男性
            </div>
            <div class="radio my-radio">
              <input type="radio" name="gender" value="2" class="radio" /> 女性
            </div>
          </div>
        </div>

        <div class="form-group">
          <label class="col-sm-4 control-label">住所</label>
          <div class="col-sm-8">
            <html:text property="address" styleClass="form-control" />
          </div>
        </div>

        <logic:present name="empId">
          <div class="form-group form-inline">
            <label class="col-sm-4 control-label">誕生日</label>
            <div class="col-sm-8 input-append">
              <html:text property="birthday" styleClass="form-control"></html:text>
            </div>
          </div>
        </logic:present>

        <logic:notPresent name="empId">
          <div class="form-group form-inline">
            <label class="col-sm-4 control-label">誕生日</label>
            <div id="datetimepicker4" class="col-sm-8 input-append">
              <input data-format="yyyy-MM-dd" type="date" class="form-control"
                id="birthday" placeholder="yyyy-MM-dd" name="birthday">
            </div>
          </div>
        </logic:notPresent>


        <div class="form-group form-inline">
          <label class="col-sm-4 control-label">権限</label>
          <div class="col-sm-4">
            <div class="radio my-radio">

              <input type="radio" name="authority" value="1" checked="checked" />
              一般
            </div>
            <div class="radio my-radio">
              <input type="radio" name="authority" value="2" /> 管理者
            </div>
          </div>
        </div>

        <div class="form-group">
          <label class="col-sm-4 control-label">部署</label>
          <div class="col-sm-4">
            <html:select property="deptId" styleClass="form-control"
              styleId="sel1">
              <html:option value="1">総務部</html:option>
              <html:option value="2">営業部</html:option>
              <html:option value="3">経理部</html:option>
              <html:option value="4">資材部</html:option>
            </html:select>
          </div>
        </div>
        <logic:present name="empId">
          <html:hidden value="${empId}" property="empId" />
        </logic:present>
        <div class="form-group form-inline">
          <label class="col-sm-4 control-label"></label>
          <div class="col-sm-8">
            <html:submit styleClass="btn btn-info">確認</html:submit>
          </div>
        </div>
      </html:form>
      <html:errors property="empPass" />
      <html:errors property="empName" />
      <html:errors property="gender" />
      <html:errors property="address" />
      <html:errors property="birthday" />
      <html:errors property="authority" />

    </div>
  </div>
</body>

</html>