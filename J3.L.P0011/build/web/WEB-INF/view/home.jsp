<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/home.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Alegreya+Sans:wght@800&display=swap" rel="stylesheet">
        <title>My Blog - us-123my-life.simplesite.com</title>
    </head>
    <body>
        <div id="site-wrapper">
            <jsp:include page="jspf/header.jsp"/>
            <jsp:include page="jspf/right.jsp"/>
            <div id="left">
                <div class="page-title">My Blog</div>
                <div class="page-content">
                    <c:forEach var="entry" items="${requestScope.entries}">
                        <c:choose>
                            <c:when test="${entry.categoryName == 'Post'}">
                                <%@include file="jspf/post.jsp"%>
                            </c:when>
                            <c:when test="${entry.categoryName == 'Quote'}">
                                <%@include file="jspf/quote.jsp"%>
                            </c:when>
                            <c:when test="${entry.categoryName == 'Photo'}">
                                <%@include file="jspf/photo.jsp"%>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                    <div id="pager">
                        <a href="overview">Overview</a>
                    </div>
                </div>
            </div>
            <jsp:include page="jspf/footer.jsp"/>
        </div>
    </body>
</html>
