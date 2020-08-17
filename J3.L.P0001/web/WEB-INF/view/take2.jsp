<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <label>Welcome <label class="color-blue">${sessionScope.user.username}</label></label>
                <label class="label-center">Time remaining <label id="countdown" style="color:red">0${sessionScope.maxIndex + 1}:00</label></label>
            </p>
            <form id="form" method="POST" action="take">
                <c:forEach var="quiz" items="${sessionScope.quizzes}" varStatus="loop">
                    <div id="quiz${loop.index}" style="display:${loop.index eq 0 ? 'inline' : 'none'}">
                        <label>${quiz.question}</label><br>
                        <input type="checkbox" name="quiz${loop.index}.answer1">
                        <label>${quiz.option1}</label><br>
                        <input type="checkbox" name="quiz${loop.index}.answer2">
                        <label>${quiz.option2}</label><br>
                        <input type="checkbox" name="quiz${loop.index}.answer3">
                        <label>${quiz.option3}</label><br>
                        <input type="checkbox" name="quiz${loop.index}.answer4">
                        <label>${quiz.option4}</label><br>
                    </div>
                </c:forEach>
                <button id="finish" type="submit" style="display:${sessionScope.maxIndex == 0 ? 'inline' : 'none'}">Finish</button>
            </form>
            <button class="button-center" id="next" onclick="next()" style="display:${sessionScope.maxIndex == 0 ? 'none' : 'inline'}">Next</button>
        </div>
        <script>
            var index = 0;
            var maxIndex = parseInt('${sessionScope.maxIndex}');
            function next() {
                document.getElementById("quiz" + index).style.display = "none";
                index++;
                document.getElementById("quiz" + index).style.display = "inline";
                if (index === maxIndex) {
                    document.getElementById("next").style.display = "none";
                    document.getElementById("finish").style.display = "inline";
                }
            }
            var remain = ${(sessionScope.maxIndex + 1) * 60 - 1};
            setInterval(function () {
                var minutes = parseInt(remain / 60);
                var seconds = remain % 60;
                minutes = minutes < 10 ? "0" + minutes : minutes;
                seconds = seconds < 10 ? "0" + seconds : seconds;
                document.getElementById("countdown").innerHTML = minutes + ":" + seconds;
                if (--remain < 0) {
                    document.getElementById("form").submit();
                }
            }, 1000);
        </script>
    </body>
</html>
