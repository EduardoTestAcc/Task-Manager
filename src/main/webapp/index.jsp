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
            <li>Mis tareas</li>
            <li>Agenda</li>
            <li>Tareas grupales</li>
            <li>Compartir</li>
            <li>Historial</li>
        </ul>
    </nav>
    <div class="task-list">
        <table id="task-table">
        <%@ include file="getIssueList.jsp"%>
        </table>
    </div>
</div>
<dialog class="plan-issue" data-modal>
    <form id="task-form">
        <select name="lol" class="modal-team">
            <option value="eng">ENG</option>
        </select>
        <input name="title"class="modal-input-title" type="text" placeholder="Issue title"/>
        <input name="desc"class="modal-input-desc" type="text" placeholder="Issue summary"/>
        <div class="properties-tab">
        <select name="prio" class="modal-priority">
            <option value="low">Low</option>
            <option value="medium">Medium</option>
            <option value="high">High</option>
        </select>
        <data id="username" value="">user</data>
        </div>
        <input class="modal-submit" type="submit" formmethod="dialog"/>
    </form>
</dialog>
</body>
</html>
