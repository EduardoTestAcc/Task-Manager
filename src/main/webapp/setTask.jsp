<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "com.mysql.cj.jdbc.Driver"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
databaseSession= DriverManager.getConnection(url, user, password);

PreparedStatement insertar = databaseSession.prepareStatement("insert into task(name_task,des_task,priority) values(?,?,?)");

insertar.setString(1,request.getParameter("tit"));
insertar.setString(2,request.getParameter("desc"));
insertar.setString(3,request.getParameter("prio"));

Class.forName("com.mysql.cj.jdbc.Driver");
%>

<%
try{
    insertar.executeUpdate();
}catch(Exception e){
    e.printStackTrace();
}
%>

<% databaseSession.close();%>

