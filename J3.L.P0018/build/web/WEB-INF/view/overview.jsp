<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Blog - us-123my-life.simplesite.com</title>
        <link href="css/style.css" rel="stylesheet">
        <link href="css/overview.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Great+Vibes&display=swap" rel="stylesheet">
    </head>
    <body>
        <fmt:setLocale value="en_US"/>
        <div id="site-wrapper">
            <jsp:include page="jspf/header.jsp"/>
            <jsp:include page="jspf/right.jsp"/>
            <div id="left">
                <div class="page-title">Overview - Blog</div>
                <div class="page-content">
                    <c:forEach var="entries" items="${requestScope.lists}">
                        <table>
                            <thead>
                            <th>
                                <fmt:formatDate pattern="MMMM yyyy" value="${entries[0].published}" var="monthYear"/>
                                ${fn:toUpperCase(monthYear)}
                            </th>
                            <th>Date</th>
                            </thead>
                            <tbody>
                                <c:forEach var="entry" items="${entries}">
                                    <tr>
                                        <td><a href="detail?entryID=${entry.entryID}">${entry.heading}</a></td>
                                        <td><fmt:formatDate pattern="dd-MM-yyyy" value="${entry.published}"/></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:forEach>
                </div>
            </div>
            <jsp:include page="jspf/footer.jsp"/>
        </div>
    </body>
</html>
