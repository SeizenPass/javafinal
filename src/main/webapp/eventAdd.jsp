<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 16.11.2020
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Event</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</head>
<script>
    $( document ).ready(function () {
        $("#btn").click(function () {
            eventName = $("#eventName").val();
            description = $("#description").val();
            date = $("#date").val();
            var log = {
                "id": 0,
                "clubId": <%=request.getParameter("id")%>,
                "eventName": eventName,
                "description": description,
                "publishDate": null,
                "date": date
            }
            $.ajax({
                url: 'api/events/',
                type: 'POST',
                data: JSON.stringify(log),
                contentType: "application/json",
                success:
                    function (data) {
                        if (data.status === "success") {
                            window.location.href = "events.jsp";
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
    <form method="post">
        <span class="error text-danger" id="errormsg" style="display: none"></span>
        <div class="form-group">
            <label for="eventName">Event Name:</label><br>
            <input type="text" name="eventName" class="form-control" id="eventName">
        </div>
        <div class="form-group">
            <label for="description">Event Description:</label><br>
            <textarea name="description" class="form-control" id="description"> </textarea>
        </div>
        <div class="form-group">
            <label for="date">Date:</label><br>
            <input type="datetime-local" name="date" id="date">
        </div>
        <input type="button" class="btn btn-dark" id="btn" value="Add Event">
    </form>
</body>
</html>
