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
                    $("#ol").append("<li class='list-group-item'>" + "<a href='club.jsp?id="+club.id+"'>" + club.clubName + "</a>" + "</li>")
                })
            }
        });
        return false;
    });
</script>
<div class="container">
<div id="clubs">
    <div class="card mb-3" style="max-width: 540px;">
        <div class="row no-gutters">
            <div class="col-md-4">
                <img src="https://thumbs.dreamstime.com/b/reading-lovers-book-club-reading-lovers-book-club-group-people-giant-books-discussing-students-study-prepare-178228393.jpg" class="card-img" alt="...">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <h5 class="card-title">Clubs</h5>
                    <p class="card-text">
                    <ul id="ol" class="list-group list-group-flush">
                    </ul>
                    <a href="clubAdd.jsp" class="btn btn-dark">Add Club</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
