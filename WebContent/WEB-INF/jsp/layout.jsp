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

<title><tiles:getAsString name="title" /></title>
</head>
<body>
  <tiles:insert attribute="header" />

  <div class="container">
    <div class="col-md-2">
      <tiles:insert attribute="menu" />
    </div>

    <div class="col-md-10">
      <tiles:insert attribute="main" />
    </div>

  </div>

  <footer class="footer">
    <div class="container">
      <p class="text-muted">©2015. Bigtree Technology Consulting. All
        Rights Reserved</p>
    </div>
  </footer>
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>

</body>
</html:html>
