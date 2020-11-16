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
    <title>News</title>
    <%@include file="header.jsp"%>
</head>
<body>
<%@include file="jumbotron.jsp"%>
<script>
    $( document ).ready(function () {
        $.ajax({
            url: 'api/news/<%=request.getParameter("id")%>',
            type: 'GET',
            contentType: "application/json",
            success:
                function (data) {
                    $.ajax({
                        url: 'api/clubs/'+data.clubId,
                        type: 'GET',
                        contentType: "application/json",
                        success:
                            function (data2) {
                                $("#testing").append(
                                    "<h2>" + data.title + "</h2>" +
                                    "<b>Content: </b>" + data.content +
                                    "<br><b>Organiser:</b> " +'<a href="club.jsp?id='+data2.id+'">'+ data2.clubName + '</a>' +
                                    "<br><b>Publish Date:</b> " + data.publishDate.substring(0,10)

                                )
                            }
                    });

                }
        });
    });
</script>
<div class="container">
<div class="card" style="width: 18rem;">
    <div class="card-header" id="testing">

    </div>
</div>
<%
    if (cur.getPrivId() == 2){
%>
    <div class="row m-3">
<a href="newsUpdate.jsp?id=<%=request.getParameter("id")%>" class="btn btn-dark m-1 col">Update</a>
<a href="newsDelete.jsp?id=<%=request.getParameter("id")%>" class="btn btn-dark m-1 col">Delete</a>
    </div>
<%}%>
</div>
</body>
</html>
