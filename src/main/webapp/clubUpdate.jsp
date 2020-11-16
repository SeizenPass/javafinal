<%@ page import="com.myslanty.models.User" %><%--
  Created by IntelliJ IDEA.
  User: Sungat Kaparov
  Date: 16.11.2020
  Time: 18:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    User cur = (User)request.getSession().getAttribute("user");
%>
<head>
    <title>Update Event</title>
    <%@include file="header.jsp"%>
</head>
<script>
    $( document ).ready(function () {
        $("#btn").click(function () {
            clubName = $("#clubName").val();
            description = $("#description").val();
            var log = {
                "id": <%=request.getParameter("id")%>,
                "clubName": clubName,
                "description": description,
            }
            $.ajax({
                url: 'api/clubs/',
                type: 'PUT',
                data: JSON.stringify(log),
                contentType: "application/json",
                success:
                    function (data) {
                        window.location.href = "clubs.jsp";
                    },
            });
            return false;
        });
    });
</script>
<body>
<div class="jumbotron jumbotron-fluid">
    <div class="container">
        <h1 class="display-4">Welcome <%=cur.getName()%></h1>
    </div>
    <div class="list">
        <ul class="list-group list-group-horizontal">
            <li class="list-group-item"><a href="clubs.jsp">Clubs</a></li>
            <li class="list-group-item"><a href="allNews.jsp">News</a></li>
            <li class="list-group-item"><a href="events.jsp">Events</a></li>
            <li class="list-group-item"><a href="#">Users</a></li>
            <input type="button" class="btn btn-dark" id="butn" value="Log Out">
        </ul>
    </div>
</div>
<form method="post">
    <span class="error text-danger" id="errormsg" style="display: none"></span>
    <div class="form-group">
        <label for="clubName">Club Name:</label><br>
        <input type="text" name="clubName" class="form-control" id="clubName">
    </div>
    <div class="form-group">
        <label for="description">Club Description:</label><br>
        <textarea name="description" class="form-control" id="description"> </textarea>
    </div>
    <input type="button" class="btn btn-dark" id="btn" value="Update Club">
</form>
</body>
</html>
