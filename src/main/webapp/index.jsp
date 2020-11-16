<%@ page import="com.myslanty.models.User" %>
<%@ page import="com.myslanty.models.Club" %><%--
  Created by IntelliJ IDEA.
  User: Sungat Kaparov
  Date: 15.11.2020
  Time: 17:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    User cur = (User)request.getSession().getAttribute("user");
%>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</head>
<script>
    $( document ).ready(function () {
        $("#butn").click(function () {
            $.ajax({
                url: 'api/auth',
                type: 'GET',
                contentType: "application/json",
                success:
                    function (data) {
                        if (data.status === "success") {
                            window.location.href = "login.jsp";
                        }
                    }
            });
            return false;
        });
    });
</script>
<script>
    $( document ).ready(function () {
        $.ajax({
            url: 'api/users/<%=cur.getId()%>/getClubs',
            type: 'GET',
            contentType: "application/json",
            success: function (data){
                if (data === null){
                    $("#clubs").text("No clubs");
                }
                data.forEach(function (club){
                    $("#ol").append("<li>" + "<a href='club.jsp?id="+club.id+"'>" + club.clubName + "</a>" + "</li>");
                    $.ajax({
                        url: 'api/events/club/'+club.id,
                        type: 'GET',
                        contentType: "application/json",
                        success:
                            function (data2) {
                                if (data2 === null){
                                    $("#events").text("No events");
                                }
                                data2.forEach(function (event){
                                    $("#ol2").append("<li>" + "<a href='event.jsp?id="+event.id+"'>" + event.eventName + "</a>" + "</li>");
                                })
                            }
                    });
                    $.ajax({
                        url: 'api/news/club/'+club.id,
                        type: 'GET',
                        contentType: "application/json",
                        success:
                            function (data3) {
                                if (data3 === null){
                                    $("#news").text("No news");
                                }
                                data3.forEach(function (news){
                                    $("#ol3").append("<li>" + "<a href='new.jsp?id="+news.id+"'>" + news.title + "</a>" + "</li>");
                                })
                            }
                    });
                })
            }
        });
        return false;
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
        <li class="list-group-item"><a href="#">News</a></li>
        <li class="list-group-item"><a href="events.jsp">Events</a></li>
        <li class="list-group-item"><a href="#">Users</a></li>
        <input type="button" class="btn btn-dark" id="butn" value="Log Out">
    </ul>
</div>
</div>
<div id="clubs">
    <h3>Clubs:</h3>
    <ol id="ol">
    </ol>
</div>
<div id="events">
    <h3>Events:</h3>
    <ol id="ol2">
    </ol>
</div>
<div id="news">
    <h3>News:</h3>
    <ol id="ol3">
    </ol>
</div>
</body>
</html>
