<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/tags/struts-tiles" prefix="tiles"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
  rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/custom.css"
  rel="stylesheet">
<!-- page specific scripts -->
<script type="text/javascript" charset="utf-8">
  $(function() {
    $('.form-control').datePicker().dpSetSelected(new Date().asString());
  });
</script>

<title><tiles:getAsString name="title" /></title>
</head>
<body>
  <table border="1" width="100%" cellspacing="1">
    <tr>
      <td colspan="2" height="100" align="center"><tiles:insert
          attribute="header" /></td>
    </tr>
    <tr>
      <td width="200" height="100" align="center"><tiles:insert
          attribute="menu" /></td>
      <td height="100" align="center"><tiles:insert attribute="main" />
      </td>
    </tr>
    <tr>
      <td colspan="2" height="100" align="center"><tiles:insert
          attribute="footer" /></td>
    </tr>
  </table>

  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script
    src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>

</body>
</html:html>
