<div class="section">
    <div class="pencil-icon"></div>
    <div class="section-content">
        <div class="control">
            <fmt:formatDate pattern="dd-MM-yyyy" value="${entry.published}"/>
        </div>
        <c:choose>
            <c:when test="${requestScope.entries == null}">
                <div class="page-title">
                    ${entry.heading}
                </div>
            </c:when>
            <c:otherwise>
                <div class="heading">
                    <a href="detail?entryID=${entry.entryID}">${entry.heading}</a>
                </div>
            </c:otherwise>
        </c:choose>
        <div class="content">
            <c:if test="${entry.imageName != null}">
                <div class="post-image-wrapper">
                    <img src="images/${entry.imageName}">
                </div>
            </c:if>
            ${entry.content}
        </div>
    </div>
</div>