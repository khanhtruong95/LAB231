<div class="section">
    <div class="quote-icon"></div>
    <div class="section-content">
        <div class="control">
            <fmt:formatDate pattern="dd-MM-yyyy" value="${entry.published}"/>
        </div>
        <div class="${entries == null ? 'page-title' : 'heading'}">
            <a href="detail?entryID=${entry.entryID}">${entry.heading}</a>
        </div>
        <div class="content">
            <blockquote class="pull-right">
                ${entry.content}
                <small>${entry.author} &mdash; </small>
            </blockquote>
        </div>
    </div>
</div>