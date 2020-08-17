<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <title>Manage Quiz</title>
    </head>
    <body>
        <fmt:setLocale value="en"/>
        <jsp:include page="header.jsp"/>
        <div id="main">
            <p>Number of questions: <label style="color:blue">${requestScope.numberOfQuestions}</label></p>
            <table>
                <tr style="color:blue">
                    <td>Question</td>
                    <td>Date Created</td>
                </tr>
                <c:forEach var="quiz" items="${requestScope.quizzes}">
                    <tr>
                        <td>${quiz.question}</td>
                        <td><fmt:formatDate pattern="dd-MMM-YYYY" value="${quiz.created}"/></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
