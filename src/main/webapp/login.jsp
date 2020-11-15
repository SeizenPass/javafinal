<%--
  Created by IntelliJ IDEA.
  User: Sungat Kaparov
  Date: 15.11.2020
  Time: 17:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login page</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</head>
<body class="container">
<div class="form">
    <h1>Login Form</h1>
    <script>
        $("#btn").click(function (){
            event.preventDefault();
            email = $("#email").val();
            password = $("#password").val();
            console.log(email + " " + password);
            $.ajax({
                url: '',
                type: 'POST',
                data: {
                    "email" : email,
                    "password" : password
                },
                accepts: "application/json; charset=utf-8",
                success:
                    function() {
                        window.location.href = "index.jsp"
                    },
                error :
                    function(response) {
                        if (response.status === 404) {
                            $('#addResultDiv').html(response.responseText);
                        }
                    }
            });
            return false;
        });
    </script>
    <form method="post">
        <div class="form-group">
            <label for="email">Email:</label><br>
            <input type="text" name="username" class="form-control" id="email">
        </div>
        <div class="form-group">
            <label for="password">Password:</label><br>
            <input type="password" name="password" class="form-control" id="password">
        </div>
        <input type="submit" class="btn btn-primary" id="btn" value="Log In">
    </form>
</div>
</body>
</html>
