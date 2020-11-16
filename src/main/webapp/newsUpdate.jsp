<%--
  Created by IntelliJ IDEA.
  User: Beknur
  Date: 11/16/2020
  Time: 8:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Event</title>
    <%@include file="header.jsp"%>
</head>
<script>
    $( document ).ready(function () {
        var clubId
        $.ajax({
            url: 'api/news/<%=request.getParameter("id")%>',
            type: 'GET',
            contentType: "application/json",
            success:
                function (data) {
                    $("#title").val(data.title);
                    $("#content").val(data.content);
                    clubId = data.clubId
                }
        });
        $("#btn").click(function () {
            title = $("#title").val();
            content = $("#content").val();
            var log = {
                "id": <%=request.getParameter("id")%>,
                "clubId": clubId,
                "title": title,
                "content": content,
                "publishDate": null,
            }
            $.ajax({
                url: 'api/news/',
                type: 'PUT',
                data: JSON.stringify(log),
                contentType: "application/json",
                success:
                    function (data) {
                        if (data.status === "success") {
                            window.location.href = "allNews.jsp";
                        } else {
                            $("#errormsg").text('Error: Incorrect data - ' + data.status);
                            $("#errormsg").show();
                        }
                    },
                fail:
                    function (data) {
                        $("#errormsg").text('Error: Incorrect data - ' + data.status);
                        $("#errormsg").show();
                    }
            });

            });
    });
</script>
<body>
<%@include file="jumbotron.jsp"%>
<div class="container">
<form method="post">
    <span class="error text-danger" id="errormsg" style="display: none"></span>
    <div class="form-group">
        <label for="title">Title:</label><br>
        <input type="text" name="title" class="form-control" id="title">
    </div>
    <div class="form-group">
        <label for="content">Content:</label><br>
        <textarea name="content" class="form-control" id="content"> </textarea>
    </div>
    <input type="button" class="btn btn-dark" id="btn" value="Update News">
</form>
</div>
</body>
</html>

