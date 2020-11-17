<%--
  Created by IntelliJ IDEA.
  User: Beibarys
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
<body>
    <%@include file="jumbotron.jsp"%>
    <script>
        $( document ).ready(function () {
            var clubId;
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
                                        "<br><b>Organiser:</b> " +'<a href="club.jsp?id='+data2.id+'">'+ data2.clubName + '</a>' +
                                        "<br><b>Date:</b> " + data.date.substring(0,10)+ "</div><hr></li>"
                                    )
                            }
                        });
                    }
            });
        });
    </script>
    <ul type="none" id="eventInfo"></ul>
    <%
        if (cur.getPrivId() == 2){
    %><div class="container">
        <a href="eventUpdate.jsp?id=<%=request.getParameter("id")%>" class="btn btn-dark">Update</a>
        <a href="eventDelete.jsp?id=<%=request.getParameter("id")%>" class="btn btn-dark">Delete</a>
    </div>
    <%
        }
    %>
</body>
</html>
