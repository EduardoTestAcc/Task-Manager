<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "com.mysql.cj.jdbc.Driver"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "sql" uri="http://java.sun.com/jsp/jstl/sql"%>

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
<% int number = 0;%>
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

<%
try{
    while( resultSet.next() ){ %>
    <tr>
        <td>
        <%= resultSet.getString("item_attribute")%>
        </td>
    </tr>
<%
    } 
} catch(Exception e){
                e.printStackTrace();
            } 
%>
"okk"

<c:set var="income" value="${200-4}"/>  
<c:out value="${income}"/>  
<% databaseSession.close(); %>