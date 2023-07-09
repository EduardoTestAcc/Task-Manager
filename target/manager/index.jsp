<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <script src="aplication.js" defer></script>
</head>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "com.mysql.cj.jdbc.Driver"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<%!
public static Connection getSession(String url, String user, String password) throws SQLException {
    DriverManager.registerDriver(new Driver());
    return DriverManager.getConnection(url, user, password);
}

public static ResultSet getStatementResult(Connection connection, String query) throws SQLException {
    Statement statement = connection.createStatement();
    return statement.executeQuery(query);
}
%>

<%
String url = "jdbc:mysql://localhost:3306/shop";
String user = "root";
String password = "";
Connection databaseSession = getSession(url, user, password);
            
String sqlStatement = "select * from item";
ResultSet resultSet = getStatementResult(databaseSession, sqlStatement);
String[] attributes = {"item_id", "item_name"};
Class.forName("com.mysql.cj.jdbc.Driver");

%>

<body>
<header>
    <div class="container">
        <div class="logo">
        <h3>Nombre*</h6>
        <p>Task Manager</p>
    </div>
    <div class="navigation">
        <nav>
            <ul>
                <li><a class="nav-text" href="/store">Inicio</a></li>
            </ul>
        </nav>
        </div>
    </div>
</header>
<div class="content-wrapper">
    <h1>Nombre*</h1>
    <button class="add-issue">Añadir tarea</button>
    <nav class="nav-menu">
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
        <%
            try{
                while( resultSet.next() ){ %>
                <tr>
                    <td>
                        <%= resultSet.getString("item_name")%>
                    </td>
                </tr>
                <% } 
            } catch(Exception e){
                e.printStackTrace();
            } 
        %>
        <% databaseSession.close(); %>
        </table>
    </div>
</div>
</body>
</html>
