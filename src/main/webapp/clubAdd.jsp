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
    <title>Add Club</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</head>
<script>
    $( document ).ready(function () {
        $("#btn").click(function () {
            clubName = $("#clubName").val();
            description = $("#description").val();
            if (clubName === "" || description === ""){
                $("#errormsg").text('Fill the fields');
                $("#errormsg").show()
                return false;
            }
            var log = {
                "clubName": clubName,
                "description": description,
            }
            $.ajax({
                url: 'api/clubs/',
                type: 'POST',
                data: JSON.stringify(log),
                contentType: "application/json",
                success:
                    function (data) {
                        if (data.name === null || data.description === null){
                            $("#errormsg").text('Fill the fields' + data.status);
                            $("#errormsg").show()
                        }else {
                            window.location.href = "clubs.jsp";
                        }
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
    <input type="button" class="btn btn-dark" id="btn" value="Add Club">
</form>
</body>
</html>
