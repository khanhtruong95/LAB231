<div class="section">
    <div class="camera-icon"></div>
    <div class="section-content">
        <div class="control">
            <fmt:formatDate pattern="dd-MM-yyyy" value="${entry.published}"/>
        </div>
        <div class="${entries == null ? 'page-title' : 'heading'}">
            <a href="detail?entryID=${entry.entryID}">${entry.heading}</a>
        </div>
        <div class="content">
            <div class="photo-image-wrapper">
                <img src="images/${entry.imageName}">
            </div>
        </div>
    </div>
</div>