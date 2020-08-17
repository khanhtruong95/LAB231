<img id="top-box" src="img/top_box.gif">
<div class="background-white">
    <div id="menu">
        <div class="table-row">
            <div class="table-cell"><a href="login">Home</a></div>
            <div class="table-cell"><a href="take">Take Quiz</a></div>
            <div class="table-cell"><a href="make" style="display:${sessionScope.user.roleName eq 'Student' ? 'none' : 'inline'}">Make Quiz</a></div>
            <div class="table-cell"><a href="manage" style="display:${sessionScope.user.roleName eq 'Student' ? 'none' : 'inline'}">Manage Quiz</a></div>
            <div class="table-cell"><a href="logout" style="display:${sessionScope.user eq null ? 'none' : 'inline'}">Log out</a></div>
        </div>
    </div>
</div>