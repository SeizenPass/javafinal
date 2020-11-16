<%@ page import="com.myslanty.models.User" %><%--
  Created by IntelliJ IDEA.
  User: Sungat Kaparov
  Date: 16.11.2020
  Time: 18:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Club</title>
    <%@include file="header.jsp"%>
</head>
<body>
<%@include file="jumbotron.jsp"%>
<script>
    $( document ).ready(function () {
        $("#btn").click(function () {
            clubName = $("#clubName").val();
            description = $("#description").val();
            if (clubName === "" || description === ""){
                $("#errormsg").text('Fill the fields');
                $("#errormsg").show()
                return false;
            }
            var log = {
                "clubName": clubName,
                "description": description,
            }
            $.ajax({
                url: 'api/clubs/',
                type: 'POST',
                data: JSON.stringify(log),
                contentType: "application/json",
                success:
                    function (data) {
                        if (data.name === null || data.description === null){
                            $("#errormsg").text('Fill the fields' + data.status);
                            $("#errormsg").show()
                        }else {
                            window.location.href = "clubs.jsp";
                        }
                    },
            });
            return false;
        });
    });
</script>
<div class="container">
<form method="post">
    <span class="error text-danger" id="errormsg" style="display: none"></span>
    <div class="form-group">
        <label for="clubName">Club Name:</label><br>
        <input type="text" name="clubName" class="form-control" id="clubName">
    </div>
    <div class="form-group">
        <label for="description">Club Description:</label><br>
        <textarea name="description" class="form-control" id="description"> </textarea>
    </div>
    <input type="button" class="btn btn-dark" id="btn" value="Add Club">
</form>
</div>
</body>
</html>
