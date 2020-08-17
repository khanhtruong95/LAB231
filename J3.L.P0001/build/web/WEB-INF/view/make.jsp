<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <title>Make Quiz</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div id="main">
            <form id="form" onsubmit="return validateForm()" method="POST" action="make">
                <table>
                    <tr>
                        <td>Question:</td>
                        <td><textarea id="question-area" name="question" required="required"></textarea></td>
                    </tr>
                    <c:forEach begin="1" end="4" varStatus="loop">
                        <tr>
                            <td>Option${loop.index}:</td>
                            <td><textarea id="option-area" name="option${loop.index}" required></textarea></td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td>Answer(s):</td>
                        <td>
                            <c:forEach begin="1" end="4" varStatus="loop">
                                <input type="checkbox" name="answer${loop.index}">
                                <label>Option ${loop.index}</label>
                            </c:forEach>
                        </td>
                    <tr>
                    <tr>
                        <td></td>
                        <td><button type="submit">Save</button></td>
                    </tr>
                </table>
            </form>
        </div>
        <script>
            function validateForm() {
                var selected = false;
                for (var index = 1; index <= 4; index++) {
                    if (document.getElementsByName("answer" + index)[0].checked) {
                        selected = true;
                        break;
                    }
                }
                if (selected) {
                    return true;
                } else {
                    alert("Select answer(s) for your question.");
                    return false;
                }
            }
        </script>
    </body>
</html>
