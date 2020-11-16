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
    <title>Events</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</head>
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
