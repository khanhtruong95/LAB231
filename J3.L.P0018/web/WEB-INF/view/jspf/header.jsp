<div id="header">
    <div id="title-wrapper">
        <div id="title">
            <a href="home">My Fashion Blog</a>
        </div>
        <div id="subtitle">Welcome to this website</div>
    </div>
    <div id="menu-wrapper">
        <div id="menu">
            <a href="home" style="font-weight:${requestScope.blog == true ? 'bold' : 'normal'}">My Fashion Blog</a>
            <a href="about" style="font-weight:${requestScope.about == true ? 'bold' : 'normal'}">About me</a>
            <a href="contact" style="font-weight:${requestScope.contact == true ? 'bold' : 'normal'}">Contact</a>
        </div>
    </div>
</div>