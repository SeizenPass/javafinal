<%--
  Created by IntelliJ IDEA.
  User: Beibarys
  Date: 16.11.2020
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete User</title>
    <%@include file="header.jsp"%>
</head>
<body>
<%@include file="jumbotron.jsp"%>
<script>
    $( document ).ready(function () {
        $.ajax({
            url: 'api/users/<%=request.getParameter("id")%>',
            type: 'DELETE',
            contentType: "application/json",
            success:
                function (data) {
                    if (data.status === "success") {
                        window.location.href = "club.jsp";
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
