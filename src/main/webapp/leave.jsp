<%--
  Created by IntelliJ IDEA.
  User: Sungat Kaparov
  Date: 17.11.2020
  Time: 0:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.myslanty.models.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>leave</title>
    <%@include file="header.jsp"%>
</head>
<body>
<script>
    $( document ).ready(function () {
        $.ajax({
            url: 'api/clubs/<%=request.getParameter("id")%>/subscription/<%=cur.getId()%>',
            type: 'DELETE',
            contentType: "application/json",
            success:
                function (data) {
                    window.location.href = "index.jsp";
                }
        });
        return false;
    });
</script>
</body>
</html>
