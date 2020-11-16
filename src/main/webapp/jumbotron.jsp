<%@ page import="com.myslanty.models.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User cur = (User)request.getSession().getAttribute("user");
%>
<div class="jumbotron jumbotron-fluid">
    <div class="container">
        <h1 class="display-4">Welcome <%=cur.getName()%></h1>
    </div>
    <div class="list">
        <ul class="list-group list-group-horizontal">
            <li class="list-group-item"><a href="index.jsp">Main</a></li>
            <li class="list-group-item"><a href="clubs.jsp">Clubs</a></li>
            <li class="list-group-item"><a href="allNews.jsp">News</a></li>
            <li class="list-group-item"><a href="events.jsp">Events</a></li>
            <li class="list-group-item"><a href="users.jsp">Users</a></li>
            <input type="button" class="btn btn-dark" id="butn" value="Log Out">
        </ul>
    </div>
</div>
