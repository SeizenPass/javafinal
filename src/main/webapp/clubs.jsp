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
    <title>Clubs</title>
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
            url: 'api/clubs/getAll',
            type: 'GET',
            contentType: "application/json",
            success: function (data){
                if (data === null){
                    $("#clubs").text("No clubs");
                }
                data.forEach(function (club){
                    $("#ol").append("<li>" + "<a href='club.jsp?id="+club.id+"'>" + club.clubName + "</a>" + "</li>")
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
    <a href="clubAdd.jsp">Add Club</a>
</div>
</body>
</html>
