<%@ page import="com.myslanty.models.User" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 16.11.2020
  Time: 13:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Events</title>
    <%@include file="header.jsp"%>
</head>
<script>
    $( document ).ready(function () {
        $.ajax({
            url: 'api/events/getAll',
            type: 'GET',
            contentType: "application/json",
            success:
                function (data) {
                    for (var i = 0; i < data.length; i++) {
                        $("#listOfEvents").append(
                            "<li><div><h3><a href='event.jsp?id=" + data[i].id +"'>" + data[i].eventName + "</a></h3>" +
                            "<b>Description: </b>" + "<p>" + data[i].description + "</p>" +
                            "Date: " + data[i].date.substring(0,10) + "</div><hr></li>"
                        )
                    }
                }
        });
        return false;
    });
</script>
<body>
    <%@include file="jumbotron.jsp"%>
    <ul type="none" id="listOfEvents"></ul>
</body>
</html>
