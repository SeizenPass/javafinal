<%@ page import="com.myslanty.models.User" %>
<%@ page import="com.myslanty.db.DictionaryUserPrivilegeDB" %>
<%@ page import="com.myslanty.db.UserDB" %>
<%@ page import="com.myslanty.db.ClubDB" %>
<%@ page import="com.myslanty.db.ClubMembershipDB" %><%--
  Created by IntelliJ IDEA.
  User: Sungat Kaparov, Beibarys
  Date: 16.11.2020
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Club</title>
    <%@include file="header.jsp"%>
</head>
<body>
<%
    int privId = ClubMembershipDB.getInstance().getPrivIdByUserAndClubId(cur.getId(),
            Integer.parseInt(request.getParameter("id")));
%>
<%@include file="jumbotron.jsp"%>
<script>
    $( document ).ready(function () {
        $.ajax({
            url: 'api/clubs/<%=request.getParameter("id")%>',
            type: 'GET',
            contentType: "application/json",
            success:
                function (data) {
                    $("#testing").append(
                        "<h2 class='display-3'>" + data.clubName + "</h2>" +
                        "<b>Description: </b>" + data.description
                    )
                    $.ajax({
                        url: 'api/events/club/'+data.id,
                        type: 'GET',
                        contentType: "application/json",
                        success:
                            function (data2) {
                                if (data2.length === 0){
                                    $("#testing1").text("No events");
                                }
                                data2.forEach(function (event){
                                    $("#ol6").append("<li class='list-group-item list-group-item-action'>" + "<a href='events.jsp?id="+event.id+"'>" + event.eventName + "</a>" + "</li>");
                                })
                            }
                    });
                    $.ajax({
                        url: 'api/news/club/'+data.id,
                        type: 'GET',
                        contentType: "application/json",
                        success:
                            function (data2) {
                                if (data2.length === 0){
                                    $("#testing2").text("No news");
                                }
                                data2.forEach(function (news){
                                    $("#ol5").append("<li class='list-group-item list-group-item-action'>" + "<a href='news.jsp?id="+news.id+"'>" + news.title + "</a>" + "</li>");
                                })
                            }
                    });
                    $.ajax({
                        url: 'api/users/club/'+data.id,
                        type: 'GET',
                        contentType: "application/json",
                        success:
                            function (data2) {
                                if (data2.length === 0){
                                    $("#members").text("No members");
                                }
                                data2.forEach(function (user){
                                    $("#ol4").append("<li class='list-group-item list-group-item-action'>" + "<a href='user.jsp?id="+user.id+"'>" + user.name + " " + user.surname + "</a>" + "</li>");
                                })
                            }
                    });
                }
        });
    });
</script>
<center>
<div id="testing"></div>
</center>
<div class="row m-3">
    <div class="list-group col m-3" id="testing1">
        <ul id="ol6">
            Events
        </ul>
    </div>
    <div class="list-group col m-3" id="testing2">
        <ul id="ol5">
            News
        </ul>
    </div>
    <div class="list-group col m-3" id="members">
        <ul id="ol4">
            Members
        </ul>
    </div>
</div>
<%
    if (cur.getId() == 2){
%>
<div class="container">
<div class="row m-3">
<a href="clubDelete.jsp?id=<%=request.getParameter("id")%>" class="btn btn-dark m-1 col">Delete</a>
<a href="clubUpdate.jsp?id=<%=request.getParameter("id")%>" class="btn btn-dark m-1 col">Update Club</a>
<a href="eventAdd.jsp?id=<%=request.getParameter("id")%>" class="btn btn-dark m-1 col">Add Event</a>
<a href="newsAdd.jsp?id=<%=request.getParameter("id")%>" class="btn btn-dark m-1 col">Add News</a>
<%}%>
<a href="join.jsp?id=<%=request.getParameter("id")%>" class="btn btn-dark m-1 col">Join</a>
</div>
</div>
</body>
</html>
