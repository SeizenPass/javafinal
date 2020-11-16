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
<%@include file="jumbotron.jsp"%>
<%
    int privId = ClubMembershipDB.getInstance().getPrivIdByUserAndClubId(cur.getId(),
            Integer.parseInt(request.getParameter("id")));
%>
<script>
    $( document ).ready(function () {
        $.ajax({
            url: 'api/clubs/<%=request.getParameter("id")%>',
            type: 'GET',
            contentType: "application/json",
            success:
                function (data) {
                    $("#testing").append(
                        "<h2>" + data.clubName + "</h2>" +
                        "<b>Description: </b>" + data.description
                    )
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
                                    $("#ol5").append("<li>" + "<a href='news.jsp?id="+news.id+"'>" + news.title + "</a>" + "</li>");
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
                                    $("#ol4").append("<li>" + "<a href='user.jsp?id="+user.id+"'>" + user.name + " " + user.surname + "</a>" + "</li>");
                                })
                            }
                    });
                }
        });
    });
</script>
<div id="testing"></div>
<div id="testing2">
    <ul id="ol5"></ul>
</div>
<div id="members">
    <ul id="ol4"></ul>
</div>
<a href="clubDelete.jsp?id=<%=request.getParameter("id")%>">Delete</a>
<a href="clubUpdate.jsp?id=<%=request.getParameter("id")%>">Update Club</a>
<a href="eventAdd.jsp?id=<%=request.getParameter("id")%>">Add Event</a>
</body>
</html>
