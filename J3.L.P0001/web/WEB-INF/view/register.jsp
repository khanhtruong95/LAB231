<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <title>Register</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div id="main">
            <p id="form-title">Registration Form</p>
            <form method="POST" action="register" onsubmit="return validateForm()">
                <table>
                    <tr>
                        <td>User Name:</td>
                        <td>
                            <input type="text" name="username" value="${param.username}">
                            <label style="display:${param.username eq null ? 'none' : 'inline'};color:red">
                                This username has been taken. Please try another.
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input type="password" name="password" value="${param.password}"></td>
                    </tr>
                    <tr>
                        <td>User Type:</td>
                        <td>
                            <select name="roleID">
                                <c:forEach var="role" items="${requestScope.roles}">
                                    <option value="${role.roleID}" ${param.roleID eq role.roleID ? 'selected' : ''}>${role.roleName}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><input type="text" name="email" value="${param.email}"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><button type="submit">Register</button></td>
                    </tr>
                </table>
            </form>
        </div>
        <script>
            function validateForm() {
                var validUsername = validateUsername();
                var validPassword = validatePassword();
                var validEmail = validateEmail();
                return validUsername && validPassword && validEmail;
            }
            function validateUsername() {
                var element = document.getElementsByName("username")[0];
                if (element.value.trim() === "") {
                    element.style["border-color"] = "#b94a48";
                    return false;
                } else {
                    element.style["border-color"] = "#ccc";
                    return true;
                }
            }
            function validatePassword() {
                var element = document.getElementsByName("password")[0];
                if (element.value.trim() === "") {
                    element.style["border-color"] = "#b94a48";
                    return false;
                } else {
                    element.style["border-color"] = "#ccc";
                    return true;
                }
            }
            function validateEmail() {
                var element = document.getElementsByName("email")[0];
                if (element.value.trim() === "") {
                    element.style["border-color"] = "#b94a48";
                    return false;
                } else {
                    element.style["border-color"] = "#ccc";
                    return true;
                }
            }
        </script>
    </body>
</html>
