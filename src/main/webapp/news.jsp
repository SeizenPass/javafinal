<%@ page import="com.myslanty.models.User" %><%--
  Created by IntelliJ IDEA.
  User: Beknur
  Date: 11/16/2020
  Time: 5:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="header.jsp"%>
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
<%@include file="jumbotron.jsp"%>
<div id="testing"></div>
<a href="newsUpdate.jsp?id=<%=request.getParameter("id")%>">Update</a>
<a href="newsDelete.jsp?id=<%=request.getParameter("id")%>">Delete</a>
</body>
</html>
