<%@ page import="com.myslanty.models.User" %><%--
  Created by IntelliJ IDEA.
  User: Beknur
  Date: 11/16/2020
  Time: 5:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Event</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</head>
<script>
    $( document ).ready(function () {
        $.ajax({
            url: 'api/news/<%=request.getParameter("id")%>',
            type: 'GET',
            contentType: "application/json",
            success:
                function (data) {
                    $.ajax({
                        url: 'api/clubs/'+data.id,
                        type: 'GET',
                        contentType: "application/json",
                        success:
                            function (data2) {
                                $("#testing").append(
                                    "<h2>" + data.title + "</h2>" +
                                    "<b>Content: </b>" + data.content +
                                    "<br><b>Organiser:</b> " + data2.clubName +
                                    "<br><b>Publish Date:</b> " + data.publishDate.substring(0,10)
                                )
                            }
                    });

                }
        });
    });
</script>
<body>
<div id="testing"></div>
<a href="newsDelete.jsp?id=<%=request.getParameter("id")%>">Delete</a>
</body>
</html>