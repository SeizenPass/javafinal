<%@ page import="com.myslanty.models.ClubMembership" %><%--
  Created by IntelliJ IDEA.
  User: Beibarys
  Date: 16.11.2020
  Time: 13:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Info</title>
    <%@include file="header.jsp"%>
</head>
<body>
<%@include file="jumbotron.jsp"%>
<%
    ClubMembership clubMembership = ClubMembershipDB.getInstance().getPrivIdByUserAndClubId(cur.getId(),
            Integer.parseInt(request.getParameter("id")));
    int privId;
    if (clubMembership == null) privId = 0;
    else privId = clubMembership.getPrivId();
%>
<script>
    $( document ).ready(function () {
        $.ajax({
            url: 'api/users/<%=request.getParameter("id")%>',
            type: 'GET',
            contentType: "application/json",
            success:
                function (data) {
                    $("#userInfo").append(
                        "<tr>" +
                        "<td>" + data.id + "</td>" +
                        "<td>" + data.privId + "<td>" +
                        "<td>" + data.majorId+ "</td>" +
                        "<td>" + data.groupId + "</td>" +
                        "<td>" + data.graduationYear + "</td>" +
                        "<td>" + data.name + "</td>" +
                        "<td>" + data.surname + "</td>" +
                        "<td>" + data.email + "</td>" +
                        "</tr>"
                    )
                }
        });
    });
</script>
<div class="container">
    <table class="table">
    <thead>
    <tr>
        <th scope="col">Id</th>
        <th scope="col">Privilege Id</th>
        <th scope="col">Major Id</th>
        <th scope="col">Group Id</th>
        <th scope="col">Graduation Year</th>
        <th scope="col">Name</th>
        <th scope="col">Surname</th>
        <th scope="col">Email</th>
    </tr>
    </thead>
        <tbody id="userInfo"></tbody>
    </table>
    <%
        if (cur.getPrivId() == 2 || privId == 3){
    %>
    <div class="row">
        <a href="userDelete.jsp?id=<%=request.getParameter("id")%>" class="btn btn-dark col-12">Delete</a>
    </div>
    <%
        }
    %>
</div>
</body>
</html>
