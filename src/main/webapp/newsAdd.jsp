<%--
  Created by IntelliJ IDEA.
  User: Beknur
  Date: 11/16/2020
  Time: 9:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Event</title>
    <%@include file="header.jsp"%>
</head>
<script>
    $( document ).ready(function () {
        $("#btn").click(function () {
            title = $("#title").val();
            content = $("#content").val();
            var log = {
                "id": 0,
                "clubId": <%=request.getParameter("id")%>,
                "title": title,
                "content": content,
                "publishDate": null,
            }
            $.ajax({
                url: 'api/news/',
                type: 'POST',
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
            return false;
        });
    });
</script>
<body>
<%@include file="jumbotron.jsp"%>
<form method="post">
    <span class="error text-danger" id="errormsg" style="display: none"></span>
    <div class="form-group">
        <label for="title">News Name:</label><br>
        <input type="text" name="title" class="form-control" id="title">
    </div>
    <div class="form-group">
        <label for="content">News Description:</label><br>
        <textarea name="content" class="form-control" id="content"> </textarea>
    </div>
    <input type="button" class="btn btn-dark" id="btn" value="Add News">
</form>
</body>
</html>
