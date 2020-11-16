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
        $.ajax({
            url: 'api/users/<%=cur.getId()%>/getClubs',
            type: 'GET',
            contentType: "application/json",
            success: function (data){
                if (data === null){
                    $("#clubs").text("No clubs");
                }
                data.forEach(function (club){
                    $("#ol").append("<li class='list-group-item'>" + "<a href='club.jsp?id="+club.id+"'>" + club.clubName + "</a>" + "</li>").append("<a href='leave.jsp?id="+club.id+"' class='btn btn-dark'>Leave</a>");
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
                                    $("#ol2").append("<li class='list-group-item'>" + "<a href='event.jsp?id="+event.id+"'>" + event.eventName + "</a>" + "</li>");
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
                                    $("#ol3").append("<li class='list-group-item'>" + "<a href='news.jsp?id="+news.id+"'>" + news.title + "</a>" + "</li>");
                                })
                            }
                    });
                })
            }
        });
        return false;
    });
</script>
<div class="container">
    <div class="row">
<div class="card col m-2" style="width: 18rem;">
    <img src="https://images.unsplash.com/photo-1522410818928-5522dacd5066?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60" class="card-img-top" alt="...">
    <div class="card-body">
        <h5 class="card-title">Clubs</h5>
        <p class="card-text">Here is listed your joined clubs</p>
    </div>
    <ul class="list-group list-group-flush" id="ol">
    </ul>
</div>
<div class="card col m-2" style="width: 18rem;">
    <img src="https://images.unsplash.com/photo-1540575467063-178a50c2df87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60" class="card-img-top" alt="...">
    <div class="card-body">
        <h5 class="card-title">Events</h5>
        <p class="card-text">Here is listed events of your joined clubs</p>
    </div>
    <ul class="list-group list-group-flush" id="ol2">
    </ul>
</div>
<div class="card col m-2" style="width: 18rem;">
    <img src="https://images.unsplash.com/photo-1585829365295-ab7cd400c167?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60" class="card-img-top" alt="...">
    <div class="card-body">
        <h5 class="card-title">News</h5>
        <p class="card-text">Here is listed news of your joined clubs</p>
    </div>
    <ul class="list-group list-group-flush" id="ol3">
    </ul>
</div>
</div>
</div>
<%--<div class="grid-container">--%>
<%--<div id="clubs">--%>
<%--    <h3>Clubs:</h3>--%>
<%--    <ul id="ol" class="list-group">--%>
<%--    </ul>--%>
<%--</div>--%>
<%--<div id="events">--%>
<%--    <h3>Events:</h3>--%>
<%--    <ul id="ol2" class="list-group">--%>
<%--    </ul>--%>
<%--</div>--%>
<%--<div id="news">--%>
<%--    <h3>News:</h3>--%>
<%--    <ul id="ol3" class="list-group">--%>
<%--    </ul>--%>
<%--</div>--%>
<%--</div>--%>
</body>
</html>
