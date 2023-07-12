<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="jsp/header.jsp" %>
<html>
<head>
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <script src="js/home.js" defer></script>
</head>

<body>
<div class="content-wrapper">
    <nav class="nav-menu">
        <h1>Nombre*</h1>
        <button data-open-modal class="add-issue">Añadir tarea</button>
        <ul>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </nav>
    <div class="task-list">
        <div class="proyect-name">
            <select name="proyect-name" class="proyect-option">
                <option value="title" selected>New Proyect</option>
            </select>
        </div>
        <table id="task-table">
            <tbody>
                <%@ include file="getIssueList.jsp"%>  
            </tbody>
        </table>
    </div>
</div>
<dialog class="plan-issue" data-modal>
    <form id="task-form">
        <select name="team" class="modal-team">
            <option value="eng">ENG</option>
        </select>
        <input name="title" class="modal-title" type="text" placeholder="Issue title"/>
        <input name="summary" class="modal-summary" type="text" placeholder="Issue summary"/>
        <div class="properties-tab">
        <select name="priority" class="modal-priority">
            <option value="low">Low</option>
            <option value="medium">Medium</option>
            <option value="high">High</option>
        </select>
        <data id="username" value="">user</data>
        </div>
        <input class="modal-submit" type="submit" formmethod="dialog"/>
    </form>
</dialog>
<dialog class="task-details" data-modal>
    <form>
        <data id="task-id" value=""></data>
        <h1 class="task-title"></h1>
        <h2 class="task-summary"></h2>
        <select name="status" class="details-status">
            <option value="unstarted">Unstarted</option>
            <option value="started">Started</option>
            <option value="done">Done</option>
        </select>
        <select name="priority" class="details-priority">
            <option value="low">Low</option>
            <option value="medium">Medium</option>
            <option value="high">High</option>
        </select>
        <input name="delete" id="delete-task" type="checkbox"/>
        <label for="delete-task">Delete task</label>
        <input class="details-submit" type="submit" formmethod="dialog"/>
    </form>
</dialog>
</body>
</html>
