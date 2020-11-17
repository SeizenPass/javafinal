<%--
  Created by IntelliJ IDEA.
  User: Amiran
  Date: 16-Nov-20
  Time: 8:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search</title>
    <%@include file="header.jsp"%>
    <script>
        function findUser() {
            majorId = $("#major").val(),
                groupId = $("#group").val(),
                graduationYear = $("#graduation-year").val(),
                name = $("#name").val(),
                surname = $("#surname").val(),
                email = $("#email").val()
            if (graduationYear === "") {
                graduationYear = 0
            } else {
                graduationYear = Number(graduationYear)
            }
            if (groupId === "") {
                groupId = 0
            } else {
                groupId = Number(groupId)
            }
            if (majorId === "") {
                majorId = 0
            } else {
                majorId = Number(majorId)
            }
            var myParams = {
                "id": 0,
                "privId": 0,
                "majorId": majorId,
                "groupId": groupId,
                "graduationYear": graduationYear,
                "name": name,
                "surname": surname,
                "email": email,
                "password": '',
            };
            console.log(myParams)
            $.ajax({
                url: 'api/users/find',
                type: 'POST',
                data: JSON.stringify(myParams),
                contentType: "application/json",
                success:
                    function (data) {
                        $("#users").empty()
                        for (var i = 0; i < data.length; i++) {
                            $("#users").append('<div class="row">\n' +
                                '    <div class="col-2">'+data[i].name+'</div>\n' +
                                '    <div class="col-2">'+data[i].surname+'</div>\n' +
                                '    <div class="col-2">'+data[i].email+'</div>\n' +
                                '    <div class="col-2">'+data[i].graduationYear+'</div>\n' +
                                '    <div class="col-2">'+data[i].majorId+'</div>\n' +
                                '    <div class="col-2">'+data[i].groupId+'</div>\n' +
                                '</div>')
                        }
                    }
            });
        }
        $( document ).ready(function () {

                $.ajax({
                    url: 'api/majors',
                    type: 'GET',
                    contentType: "application/json",
                    success:
                        function (data) {
                        $("#major").append("<option value=\"\" selected>Choose Major</option>")
                            for (var i = 0; i < data.length; i++) {
                                $("#major").append('<option value="'+ data[i].id + '">'+data[i].majorName+'</option>')
                            }
                        }
                });
            $.ajax({
                url: 'api/groups',
                type: 'GET',
                contentType: "application/json",
                success:
                    function (data) {
                        $("#group").append("<option value=\"\" selected>Choose Group</option>")
                        for (var i = 0; i < data.length; i++) {
                            var postfix = "";
                            if (data[i].hasOwnProperty('postfix')) {
                                postfix = data[i].postfix
                            }
                            $("#group").append('<option value="'+ data[i].id + '">'+data[i].id+'-'+postfix +'</option>')
                        }
                    }
            });
            $("#search").click(function () {
                findUser()
            });
        });
    </script>
</head>
<body>
<%@include file="jumbotron.jsp"%>
<div class="container">
    <div class="row">
        <div class="col-2">
            <label for="name">Name:</label>
            <input type="text" class="form-control" id="name" placeholder="Name">
        </div>
        <div class="col-2">
            <label for="surname">Surname:</label>
            <input type="text" class="form-control" id="surname" placeholder="Surname">
        </div>
        <div class="col-2">
            <label for="email">Email:</label>
            <input type="text" class="form-control" id="email" placeholder="example@gmail.com">
        </div>
        <div class="col-2">
            <label for="graduation-year">Graduation Year:</label>
            <input type="number" class="form-control" id="graduation-year" placeholder="2022">
        </div>
        <div class="col-2">
            <label for="major">Major</label>
            <select name="major" id="major">

            </select>
        </div>
        <div class="col-2">
            <label for="group">Group</label>
            <select name="group" id="group">
            </select>
        </div>
    </div>
    <div class="row">
        <button type="button" class="btn btn-success col-12" id="search">Search</button>
    </div>
</div>
<div class="container" id="users">

</div>
</body>
</html>
