<%@page import="com.bigtreetc.kenshuu.bean.UserBean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>



<ul class="nav nav-pills nav-stacked" id="menu">

  <%
    String currentSelectMenu = request.getSession()
        .getAttribute("current_select").toString();
  %>
  <%
    if ("1".equals(currentSelectMenu)) {
  %>
  <li class="active"><a href="#"
    onclick="document.forms['myProfile'].submit();"><span
      class="fa-stack fa-lg pull-left "><i
        class="fa fa-wrench fa-stack-1x "></i></span>マイプロフィール</a></li>
  <%
    } else {
  %>
  <li><a href="#" onclick="document.forms['myProfile'].submit();"><span
      class="fa-stack fa-lg pull-left"><i
        class="fa fa-wrench fa-stack-1x "></i></span>マイプロフィール</a></li>
  <%
    }
  %>

  <%
    if ("2".equals(currentSelectMenu)) {
  %>
  <li class="active"><a
    href="<%=request.getContextPath()%>/viewList.do"><span
      class="fa-stack fa-lg pull-left"><i
        class="fa fa-wrench fa-stack-1x "></i></span>社員全件表示</a></li>
  <%
    } else {
  %>
  <li><a href="<%=request.getContextPath()%>/viewList.do"><span
      class="fa-stack fa-lg pull-left"><i
        class="fa fa-wrench fa-stack-1x "></i></span>社員全件表示</a></li>
  <%
    }
  %>

<% if (((UserBean)request.getSession().getAttribute("current_user")).getAuthority()==2){ %>
  <%
    if ("3".equals(currentSelectMenu)) {
  %>
  <li class="active"><a
    href="<%=request.getContextPath()%>/register.do"><span
      class="fa-stack fa-lg pull-left"><i
        class="fa fa-wrench fa-stack-1x "></i></span>社員情報登録</a></li>
  <%
    } else {
  %>
  <li><a href="<%=request.getContextPath()%>/register.do"><span
      class="fa-stack fa-lg pull-left"><i
        class="fa fa-wrench fa-stack-1x "></i></span>社員情報登録</a></li>
  <%
    }
  %>
<%} %>

  <li><a href="<%=request.getContextPath()%>/logout.do"><span
      class="fa-stack fa-lg pull-left"><i
        class="fa fa-wrench fa-stack-1x "></i></span>ログアウト</a></li>
</ul>

<html:form styleId="myProfile" method="post" action="/update.do">
  <html:hidden name="current_user" property="empId" />
  <html:hidden name="current_user" property="empPass" />
  <html:hidden name="current_user" property="empName" />
  <html:hidden name="current_user" property="gender" />
  <html:hidden name="current_user" property="address" />
  <html:hidden name="current_user" property="birthday" />
  <html:hidden name="current_user" property="authority" />
  <html:hidden name="current_user" property="postBean.postId" />
</html:form>
