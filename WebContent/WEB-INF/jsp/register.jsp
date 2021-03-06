<%@page import="com.bigtreetc.kenshuu.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
  if (request.getSession().getAttribute("current_user") == null) {
%>
<c:redirect url="/error.do" />
<%
  }
%>
<%
  UserBean currentUser = (UserBean) request.getSession()
      .getAttribute("current_user");
%>

<%
  boolean isReadOnly = true;
%>
<%
  if (currentUser.getAuthority() == 2
      || currentUser.getEmpId() == Integer
          .parseInt((String) request.getAttribute("empId"))) {
    isReadOnly = false;
  }
%>
<div class="span6">
  <div class="wrap-form">
    <html:form styleClass="form-horizontal" action="/input.do"
      method="post">
      <logic:present name="empId">
        <div id="legend">
          <legend class="form-title">
            <label style="text-align: center;">社員情報更新入力</label>
          </legend>
        </div>
        <div class="form-group">
          <label class="col-sm-4 control-label">ID</label>
          <div class="col-sm-8">
            <html:text property="empId" styleClass="form-control"
              disabled="true"></html:text>
          </div>
        </div>
        <%
          if (currentUser.getEmpId() == Integer.parseInt(request
                  .getAttribute("empId").toString())) {
                request.getSession()
                    .setAttribute("current_select", "1");
              }
        %>
      </logic:present>
      <logic:notPresent name="empId">
        <div id="legend">
          <legend class="form-title">
            <label style="text-align: center;">社員情報登録入力</label>
          </legend>
        </div>
      </logic:notPresent>

      <div class="form-group">
        <label class="col-sm-4 control-label">パスワード</label>
        <div class="col-sm-8">
          <%
            if (isReadOnly) {
          %>
          <html:text property="empPass" styleClass="form-control"
            disabled="true"></html:text>
          <%
            } else {
          %>
          <html:text property="empPass" styleClass="form-control"></html:text>
          <%
            }
          %>
        </div>
      </div>

      <div class="form-group">
        <label class="col-sm-4 control-label">社員名</label>
        <div class="col-sm-8">
          <%
            if (isReadOnly) {
          %>
          <html:text property="empName" styleClass="form-control"
            disabled="true"></html:text>
          <%
            } else {
          %>
          <html:text property="empName" styleClass="form-control"></html:text>
          <%
            }
          %>
        </div>
      </div>

      <logic:present parameter="gender">
        <bean:parameter name="gender" id="gender" />
        <logic:equal name="gender" value="1">
          <div class="form-group form-inline">
            <label class="col-sm-4 control-label">性別 </label>
            <div class="col-sm-2 ">
              <div class="radio my-radio">
                <%
                  if (isReadOnly) {
                %>
                <input type="radio" name="gender" value="1" class="radio"
                  checked="checked" disabled="disabled" /> 男性
                <%
                  } else {
                %>
                <input type="radio" name="gender" value="1" class="radio"
                  checked="checked" /> 男性
                <%
                  }
                %>
              </div>
              <div class="radio my-radio">
                <%
                  if (isReadOnly) {
                %>
                <input type="radio" name="gender" value="2" class="radio"
                  disabled="disabled" /> 女性
                <%
                  } else {
                %>
                <input type="radio" name="gender" value="2" class="radio" /> 女性
                <%
                  }
                %>

              </div>
            </div>
          </div>
        </logic:equal>

        <logic:equal name="gender" value="2">
          <div class="form-group form-inline">
            <label class="col-sm-4 control-label">性別 </label>
            <div class="col-sm-2 ">
              <div class="radio my-radio">
                <%
                  if (isReadOnly) {
                %>
                <input type="radio" name="gender" value="1" class="radio"
                  disabled="disabled" /> 男性
                <%
                  } else {
                %>
                <input type="radio" name="gender" value="1" class="radio" /> 男性
                <%
                  }
                %>
              </div>
              <div class="radio my-radio">
                <%
                  if (isReadOnly) {
                %>
                <input type="radio" name="gender" value="2" class="radio"
                  checked="checked" disabled="disabled" /> 女性
                <%
                  } else {
                %>
                <input type="radio" name="gender" value="2" class="radio"
                  checked="checked" /> 女性
                <%
                  }
                %>
              </div>
            </div>
          </div>
        </logic:equal>
      </logic:present>

      <logic:notPresent parameter="gender">
        <div class="form-group form-inline">
          <label class="col-sm-4 control-label">性別 </label>
          <div class="col-sm-2 ">
            <div class="radio my-radio">
              <input type="radio" name="gender" value="1" class="radio"
                checked="checked" /> 男性
            </div>
            <div class="radio my-radio">
              <input type="radio" name="gender" value="2" class="radio" /> 女性
            </div>
          </div>
        </div>
      </logic:notPresent>

      <div class="form-group">
        <label class="col-sm-4 control-label">住所</label>
        <div class="col-sm-8">
          <%
            if (isReadOnly) {
          %>
          <html:text property="address" styleClass="form-control"
            disabled="true" />
          <%
            } else {
          %>
          <html:text property="address" styleClass="form-control" />
          <%
            }
          %>
        </div>
      </div>

      <logic:present name="empId">
        <div class="form-group form-inline">
          <label class="col-sm-4 control-label">誕生日</label>
          <div class="col-sm-2 ">
            <%
              if (isReadOnly) {
            %>
            <html:text property="birthday" styleClass="form-control"
              disabled="true"></html:text>
            <%
              } else {
            %>
            <html:text property="birthday" styleClass="form-control"></html:text>
            <%
              }
            %>
          </div>
        </div>
      </logic:present>

      <logic:notPresent name="empId">
        <div class="form-group form-inline">
          <label class="col-sm-4 control-label">誕生日</label>
          <div id="datetimepicker4" class="col-sm-4">
            <input data-format="yyyy-MM-dd" type="date" class="form-control"
              id="birthday" placeholder="yyyy-MM-dd" name="birthday">
          </div>
        </div>
      </logic:notPresent>

      <!-- start of authority block -->
      <%
        if (currentUser.getAuthority() == 1) {
      %>
      <logic:present parameter="authority">
        <bean:parameter id="authority_before" name="authority" />
        <logic:equal name="authority_before" value="1">
          <div class="form-group form-inline">
            <label class="col-sm-4 control-label">権限</label>
            <div class="col-sm-2">
              <div class="radio my-radio">
                <input type="radio" name="authority" value="1" checked="checked"
                  disabled="disabled" />一般
              </div>
              <div class="radio my-radio">
                <input type="radio" name="authority" value="2"
                  disabled="disabled" /> 管理者
              </div>
            </div>
          </div>
        </logic:equal>
        <logic:equal name="authority_before" value="2">
          <div class="form-group form-inline">
            <label class="col-sm-4 control-label">権限</label>
            <div class="col-sm-2">
              <div class="radio my-radio">
                <input type="radio" name="authority" value="1"
                  disabled="disabled" />一般
              </div>
              <div class="radio my-radio">
                <input type="radio" name="authority" value="2" checked="checked"
                  disabled="disabled" /> 管理者
              </div>
            </div>
          </div>
        </logic:equal>
      </logic:present>
      <%
        } else {
      %>

      <logic:present parameter="authority">
        <bean:parameter id="authority_before" name="authority" />
        <logic:equal name="authority_before" value="1">
          <div class="form-group form-inline">
            <label class="col-sm-4 control-label">権限</label>
            <div class="col-sm-2">
              <div class="radio my-radio">
                <input type="radio" name="authority" value="1" checked="checked" />一般
              </div>
              <div class="radio my-radio">
                <input type="radio" name="authority" value="2" /> 管理者
              </div>
            </div>
          </div>
        </logic:equal>
        <logic:equal name="authority_before" value="2">
          <div class="form-group form-inline">
            <label class="col-sm-4 control-label">権限</label>
            <div class="col-sm-2">
              <div class="radio my-radio">
                <input type="radio" name="authority" value="1" />一般
              </div>
              <div class="radio my-radio">
                <input type="radio" name="authority" value="2" checked="checked" />
                管理者
              </div>
            </div>
          </div>
        </logic:equal>
      </logic:present>
      <%
        }
      %>

      <!-- end of authority block -->

      <logic:notPresent parameter="authority">
        <div class="form-group form-inline">
          <label class="col-sm-4 control-label">権限</label>
          <div class="col-sm-2">
            <div class="radio my-radio">
              <input type="radio" name="authority" value="1" checked="checked" />一般
            </div>
            <div class="radio my-radio">
              <input type="radio" name="authority" value="2" /> 管理者
            </div>
          </div>
        </div>
      </logic:notPresent>

      <div class="form-group">
        <label class="col-sm-4 control-label">部署</label>
        <div class="col-sm-4">
          <%
            if (currentUser.getAuthority() == 1) {
          %>
          <html:select property="deptId" styleClass="form-control"
            styleId="sel1" disabled="true">
            <html:option value="1">総務部</html:option>
            <html:option value="2">営業部</html:option>
            <html:option value="3">経理部</html:option>
            <html:option value="4">資材部</html:option>
          </html:select>
          <%
            } else {
          %>
          <html:select property="deptId" styleClass="form-control"
            styleId="sel1">
            <html:option value="1">総務部</html:option>
            <html:option value="2">営業部</html:option>
            <html:option value="3">経理部</html:option>
            <html:option value="4">資材部</html:option>
          </html:select>
          <%
            }
          %>
        </div>
      </div>
      <logic:present name="empId">
        <html:hidden value="${empId}" property="empId" />
      </logic:present>

      <c:if
        test="${current_user.authority ==2 || current_user.empId == empId }">
        <div class="form-group form-inline">
          <label class="col-sm-4 control-label"></label>
          <div class="col-sm-8">
            <html:submit styleClass="btn btn-primary">確認</html:submit>
          </div>
        </div>
      </c:if>

    </html:form>
    <html:errors property="empPass" />
    <html:errors property="empName" />
    <html:errors property="gender" />
    <html:errors property="address" />
    <html:errors property="birthday" />
    <html:errors property="authority" />

  </div>
</div>
