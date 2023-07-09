<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <script src="aplication.js" defer></script>
</head>

<body>
<div class="content-wrapper">
    <nav class="nav-menu">
        <h1>Nombre*</h1>
        <button class="add-issue">Añadir tarea</button>
        <ul>
            <li>Agenda</li>
            <li>Tareas grupales</li>
            <li>Compartir</li>
            <li>Editar tarea</li>
            <li>Historial</li>
        </ul>
    </nav>
    <div class="task-list">
        <table>
        <%@ include file="getIssueList.jsp"%>
        </table>
    </div>
</div>
</body>
</html>
