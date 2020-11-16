<%@ page import="com.myslanty.models.User" %><%--
  Created by IntelliJ IDEA.
  User: Sungat Kaparov
  Date: 16.11.2020
  Time: 17:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Club</title>
    <%@include file="header.jsp"%>
</head>

<body>
<%@include file="jumbotron.jsp"%>
<script>
    $( document ).ready(function () {
        $.ajax({
            url: 'api/clubs/<%=request.getParameter("id")%>',
            type: 'DELETE',
            contentType: "application/json",
            success:
                function (data) {
                    if (data.status === "success") {
                        window.location.href = "clubs.jsp";
                    } else {
                        $("msg").text("There is somewhere mistake")
                    }
                }
        });
    });
</script>
<h1 id="msg"></h1>
</body>
</html>
