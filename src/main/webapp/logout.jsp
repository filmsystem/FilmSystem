<html>
<head>
    <title>Title</title>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;

    %>
</head>
<body>
    <%
        session.invalidate();
        response.sendRedirect(basePath + "/firstPage.jsp");
    %>
</body>
</html>
