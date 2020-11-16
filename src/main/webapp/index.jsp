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
<head>
    <title>Main</title>
    <%@include file="header.jsp"%>
</head>

<body>
<%@include file="jumbotron.jsp"%>
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
                                    $("#ol3").append("<li>" + "<a href='news.jsp?id="+news.id+"'>" + news.title + "</a>" + "</li>");
                                })
                            }
                    });
                })
            }
        });
        return false;
    });
</script>
<div id="clubs">
    <h3>Clubs:</h3>
    <ul id="ol">
    </ul>
</div>
<div id="events">
    <h3>Events:</h3>
    <ul id="ol2">
    </ul>
</div>
<div id="news">
    <h3>News:</h3>
    <ul id="ol3">
    </ul>
</div>
</body>
</html>
