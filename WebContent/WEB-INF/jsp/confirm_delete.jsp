<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
  ID=
  <bean:write name="empId" />
  のユーザーが削除します。よろしいですか？
  <html:form action="/delete.do" method="post">
    <html:hidden property="empId" />
    <html:submit>確認</html:submit>
  </html:form>
  <button name="back" onclick="history.back()">戻る</button>
