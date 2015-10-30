<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>

<div class="span6">
  <div class="wrap-form">
    <html:form styleClass="form-horizontal" action="/confirm"
      method="post">
      <div id="legend">
        <legend class="form-title">
          <label style="text-align: center;"> <bean:message
              key="message.confirm" />
          </label>
        </legend>
      </div>
      <logic:notEqual name="userBean" property="empId" value="0">
        <logic:present name="userBean" property="empId">

          <div class="form-group">
            <label class="col-sm-4 control-label">ID</label>
            <div class="col-sm-8">
              <html:text property="empId" styleClass="form-control"
                disabled="true" value="${userBean.empId }"></html:text>
            </div>
          </div>

        </logic:present>
      </logic:notEqual>

      <div class="form-group">
        <label class="col-sm-4 control-label">パスワード</label>
        <div class="col-sm-8">
          <html:text property="empPass" styleClass="form-control"
            disabled="true" value="${userBean.empPass }"></html:text>
        </div>
      </div>

      <div class="form-group">
        <label class="col-sm-4 control-label">社員名</label>
        <div class="col-sm-8">
          <html:text property="empName" styleClass="form-control"
            disabled="true" value="${userBean.empName }"></html:text>
        </div>
      </div>

      <div class="form-group">
        <label class="col-sm-4 control-label">性別</label>
        <div class="col-sm-8">

          <logic:equal name="userBean" property="gender" value="1">
            <div class="radio my-radio">
              <input type="radio" name="gender" value="1" class="radio"
                checked="checked" disabled="disabled" /> 男性
            </div>
          </logic:equal>
          <logic:equal name="userBean" property="gender" value="2">
            <div class="radio my-radio">
              <input type="radio" name="gender" value="2" class="radio"
                checked="checked" disabled="disabled" /> 女性
            </div>
          </logic:equal>
        </div>
      </div>

      <div class="form-group">
        <label class="col-sm-4 control-label">住所</label>
        <div class="col-sm-8">
          <html:text property="empName" styleClass="form-control"
            disabled="true" value="${userBean.address }"></html:text>
        </div>
      </div>

      <div class="form-group">
        <label class="col-sm-4 control-label">誕生日</label>
        <div class="col-sm-8">
          <html:text property="empName" styleClass="form-control"
            disabled="true" value="${userBean.birthday }"></html:text>
        </div>
      </div>

      <div class="form-group">
        <label class="col-sm-4 control-label">権限</label>
        <div class="col-sm-8">

          <logic:equal name="userBean" property="authority" value="1">
            <div class="radio my-radio">
              <input type="radio" name="gender" value="1" class="radio"
                checked="checked" disabled="disabled" /> 一般
            </div>
          </logic:equal>

          <logic:equal name="userBean" property="authority" value="2">
            <div class="radio my-radio">
              <input type="radio" name="authority" value="2" class="radio"
                checked="checked" disabled="disabled" /> 管理者
            </div>
          </logic:equal>

        </div>
      </div>

      <div class="form-group">
        <label class="col-sm-4 control-label">部署名</label>
        <div class="col-sm-8">
          <html:text property="empName" styleClass="form-control"
            disabled="true" value="${postBean.postName }"></html:text>
        </div>
      </div>

      <logic:present name="userBean" property="empId">
        <html:hidden name="userBean" property="empId" />
      </logic:present>
      <html:hidden property="empPass" />
      <html:hidden property="empName" />
      <html:hidden property="gender" />
      <html:hidden property="address" />
      <html:hidden property="birthday" />
      <html:hidden property="deptId" />
      <html:hidden property="authority" />

      <div class="form-group form-inline">
        <label class="col-sm-4 control-label"></label>
        <div class="col-sm-1">
          <html:submit styleClass="btn btn-primary">保存</html:submit>
        </div>
        <div class="col-sm-1">
          <button name="back" class="btn btn-primary" onclick="history.back()">やり直す</button>
        </div>
      </div>
    </html:form>
  </div>
</div>
