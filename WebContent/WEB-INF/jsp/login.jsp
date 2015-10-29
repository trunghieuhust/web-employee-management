<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<div class="col-md-3"></div>
<div class="col-md-6">
  <fieldset class="fsStyle custom-field-set">
    <legend>
      <label class="panel-heading">ログイン</label>
    </legend>
    <form method="post" action="<%=request.getContextPath()%>/authen.do"
      class="form-horizontal">
      <div class="control-group">
        <label class="control-label" for="inputId">ID</label>
        <div class="controls">
          <input type="text" name="id" id="inputId" placeholder="ID" required autofocus />
        </div>
      </div>
      <div class="control-group">
        <label class="control-label" for="inputPassword">パスワード</label>
        <div class="controls">
          <input type="password" name="password" id="inputPassword"
            placeholder="パスワード" required/>
        </div>
        <div class="control-group">
          <div class="controls">
            <input type="submit" value="ログイン"
              class="btn btn-primary custom-btn" />
          </div>
        </div>
      </div>
    </form>
    <div class="control-group">
      <html:errors property="id" />
      <html:errors property="password" />
      <html:errors property="failed" />
      <html:errors property="login_required" />
      <html:errors property="permission_denied" />
    </div>

  </fieldset>

</div>

<div class="col-md-3"></div>
