<%@ page import="com.myslanty.models.User" %><%--
  Created by IntelliJ IDEA.
  User: Beknur
  Date: 11/16/2020
  Time: 5:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>News</title>
    <%@include file="header.jsp"%>
</head>
<body>
<%@include file="jumbotron.jsp"%>
<script>
    $( document ).ready(function () {
        $.ajax({
            url: 'api/news/getAll',
            type: 'GET',
            contentType: "application/json",
            success:
                function (data) {
                    for (var i = 0; i < data.length; i++) {
                        $("#listOfEvents").append(
                            "<li><div><h3><a href='news.jsp?id=" + data[i].id +"'>" + data[i].title + "</a></h3>" +
                            "<b>Description: </b>" + "<p>" + data[i].content + "</p>" +
                            "Date: " + data[i].publishDate.substring(0,10) + "</div><hr></li>"
                        )
                    }
                }
        });
        return false;
    });
</script>
<body>

<%
    User cur = (User)request.getSession().getAttribute("user");
%>
<div class="jumbotron jumbotron-fluid">
    <div class="container">
        <h1 class="display-4">Welcome <%=cur.getName()%></h1>
    </div>
    <div class="list">
        <ul class="list-group list-group-horizontal">
            <li class="list-group-item"><a href="#">Clubs</a></li>
            <li class="list-group-item"><a href="allNews.jsp">News</a></li>
            <li class="list-group-item"><a href="event.jsp">Events</a></li>
            <li class="list-group-item"><a href="#">Users</a></li>
            <input type="button" class="btn btn-dark" id="butn" value="Log Out">
        </ul>
    </div>
</div>
<ul type="none" id="listOfEvents">
</ul>
</body>
</html>
