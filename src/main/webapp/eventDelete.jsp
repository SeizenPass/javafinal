<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 16.11.2020
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Event</title>
    <%@include file="header.jsp"%>
</head>
<script>
    $( document ).ready(function () {
        $.ajax({
            url: 'api/events/<%=request.getParameter("id")%>',
            type: 'DELETE',
            contentType: "application/json",
            success:
                function (data) {
                    if (data.status === "success") {
                        window.location.href = "events.jsp";
                    } else {
                        $("msg").text("There is somewhere mistake")
                    }
                }
        });
    });
</script>
<body>
<%@include file="jumbotron.jsp"%>
<h1 id="msg"></h1>
</body>
</html>
