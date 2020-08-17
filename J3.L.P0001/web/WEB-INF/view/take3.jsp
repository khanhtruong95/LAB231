<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <title>Take Quiz</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div id="main">
            <p>
                <label>Your score </label>
                <label class="color-blue">${requestScope.score} (${requestScope.percentage}%) - ${requestScope.status}</label>
            </p>
            <form method="POST" action="take">
                <input type="hidden" name="top" value="${sessionScope.top}">
                <label>Take another test</label>
                <button type="submit">Start</button>
            </form>
        </div>
    </body>
</html>
