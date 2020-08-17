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
            <p>Welcome <label class="color-blue">${sessionScope.user.username}</label></p>
            <form onsubmit="return validateForm()" method="POST" action="take">
                <label>Enter number of questions:</label><br>
                <input type="text" name="top" size="7" required><br>
                <button class="button-center" type="submit">Start</button>
            </form>
        </div>
        <script>
            function isInt(n) {
                return !isNaN(parseInt(n, 10)) && !isNaN(n) && parseInt(Number(n)) == n;
            }
            function validateForm() {
                var max = parseInt('${requestScope.max}');
                var top = document.getElementsByName("top")[0].value;
                if (!isInt(top) || top <= 0) {
                    alert("Valid number of questions from 1 to " + max);
                    return false;
                } else if (top > max) {
                    alert("Maximum number of question: " + max);
                    return false;
                } else {
                    return true;
                }
            }
        </script>
    </body>
</html>
