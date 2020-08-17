<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <title>Login</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div id="main">
            <p id="form-title">Login Form</p>
            <form method="POST" action="login">
                <table>
                    <tr>
                        <td>User Name:</td>
                        <td><input type="text" name="username" value="${param.username}" required></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input type="password" name="password" value="${param.password}" required></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><button type="submit">Sign in</button><a href="register"> Register</a></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <label style="display:${param.username eq null ? 'none' : 'inline'};color:red">
                                Login failed: username or password is incorrect.
                            </label>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
