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
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
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
<h1 id="msg"></h1>
</body>
</html>
