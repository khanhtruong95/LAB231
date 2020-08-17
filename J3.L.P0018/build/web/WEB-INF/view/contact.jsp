<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact - us-123my-life.simplesite.com</title>
        <link href="css/style.css" rel="stylesheet">
        <link href="css/contact.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Great+Vibes&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    </head>
    <body>
        <div id="site-wrapper">
            <jsp:include page="jspf/header.jsp"/>
            <jsp:include page="jspf/right.jsp"/>
            <div id="left">
                <div class="page-content">
                    <div class="page-title">Contact me</div>
                    <div class="content">
                        <p>Send your message</p>
                    </div>
                    <form action="contact" onsubmit="return validateForm()" method="POST">
                        <div class="contact-form">
                            <div class="alert-success" id="alert-success">Thank you for your message.</div>
                            <div class="contact-form-text">Write your message here. Fill out the form:</div>
                            <div class="form-wrapper">
                                <div class="input-wrapper">
                                    <input name="name" type="text" placeholder="Write your name here" value="${param.name}">
                                </div>
                                <div class="input-wrapper">
                                    <input name="email" type="text" placeholder="Write your email here" value="${param.email}">
                                </div>
                                <div>
                                    <textarea name="message" placeholder="Write your message here">${param.message}</textarea>
                                </div>
                                <div class="send-button-wrapper">
                                    <button type="submit" class="send-button" id="send-button">Send - Click here</button>
                                </div>
                            </div>
                    </form>
                </div>
            </div>
            <jsp:include page="jspf/footer.jsp"/>
        </div>
        <script>
            function validateForm() {
                var validName = validateName();
                var validEmail = validateEmail();
                var validMessage = validateMessage();
                if (validName && validEmail && validMessage) {
                    return true;
                } else {
                    return false;
                }
            }
            function validateName() {
                var element = document.getElementsByName("name")[0];
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
            function validateMessage() {
                var element = document.getElementsByName("message")[0];
                if (element.value.trim() === "") {
                    element.style["border-color"] = "#b94a48";
                    return false;
                } else {
                    element.style["border-color"] = "#ccc";
                    return true;
                }
            }
            function init() {
                if ('${requestScope.sent}' === "sent") {
                    document.getElementById("alert-success").style["display"] = "block";
                    document.getElementsByName("name")[0].classList.toggle('disable');
                    document.getElementsByName("name")[0].disabled = true;
                    document.getElementsByName("email")[0].classList.toggle('disable');
                    document.getElementsByName("email")[0].disabled = true;
                    document.getElementsByName("message")[0].classList.toggle('disable');
                    document.getElementsByName("message")[0].disabled = true;
                    document.getElementById("send-button").classList.toggle('disable');
                    document.getElementById("send-button").disabled = true;
                    document.getElementById("send-button").innerHTML = "Sent";
                }
            }
            window.onload = init;
        </script>
    </body>
</html>
