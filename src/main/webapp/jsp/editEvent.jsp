<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<s:setDataSource var="snapshot" driver="org.postgresql.Driver"
                 url="jdbc:postgresql://localhost:5432/ADJ_Final"
                 user="postgres" password="3418533"/>

<s:query dataSource="${snapshot}" var="events">
    SELECT * FROM events WHERE event_id=${cookie.get('eventId').value};
</s:query>

<html>
<head>
    <title>Edit Event</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>

    <link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <style>
        <%@include file="../css/index.css"%>
    </style>
</head>
<body>
<!-- main -->
<div class="main-w3layouts wrapper">
    <h1>Edit Event</h1>
    <div class="main-agileinfo">
        <div class="agileits-top">

            <form action="<c:url value="/event"/>" method="post">
                <c:forEach var="row" items="${events.rows}">
                    <input type="hidden" name="id" value="${row.event_id}" required><br>
                    <input class="text" type="text" name="name" value="${row.event_name}" required><br>
                    <input class="text" type="datetime-local" name="start_date" value="${row.event_start_date}" required><br>
                    <input class="text" type="datetime-local" name="end_date" value="${row.event_end_date}" required><br>
                    <br>
                    <input type="submit" name="btnVal" value="EDIT">
                </c:forEach>
            </form>
        </div>
    </div>
</div>
<%@include file="../js/bootstrap.js" %>
</body>
</html>