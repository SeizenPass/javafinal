<%--
  Created by IntelliJ IDEA.
  User: Sungat Kaparov, Beibarys
  Date: 16.11.2020
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Event</title>
    <%@include file="header.jsp"%>
</head>
<script>
    $( document ).ready(function () {
        $.ajax({
            url: 'api/events/<%=request.getParameter("id")%>',
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
                                $("#eventInfo").append(
                                    "<li><div><h2>" + data.eventName + "</h2>" +
                                    "<b>Description: </b>" + data.description +
                                    "<br><b>Organiser:</b> " + data2.clubName +
                                    "<br><b>Date:</b> " + data.date.substring(0,10)+ "</div><hr></li>"
                                )
                            }
                    });

                }
        });
    });
</script>
<body>
    <%@include file="jumbotron.jsp"%>
    <ul type="none" id="eventInfo"></ul>
    <a href="eventUpdate.jsp?id=<%=request.getParameter("id")%>">Update</a>
</body>
</html>
