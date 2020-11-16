<%--
  Created by IntelliJ IDEA.
  User: Amiran
  Date: 16-Nov-20
  Time: 2:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
        <script>
        $( document ).ready(function () {
            $("#btn").click(function () {
                    var log = {
                        "id": 0,
                        "clubId": 2,
                        "eventName": "event",
                        "description": "description",
                        "publishDate": null,
                        "date": $("#val").val()
                    }
                    $.ajax({
                        url: 'api/events',
                        type: 'POST',
                        data: JSON.stringify(log),
                        contentType: "application/json",
                        success:
                            function (data) {

                            },
                        fail:
                            function (data) {

                            }
                    });
            });
        });
    </script>
</head>
<body>
<input type="datetime-local" name="dateTime" id="val">
<input type="button" id="btn">
<c:out value="Miras" />
</body>
</html>
