<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "com.mysql.cj.jdbc.Driver"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:setDataSource var = "database" driver = "com.mysql.jdbc.Driver"
url = "jdbc:mysql://localhost:3306/shop"
user = "root"  password = ""/>

<sql:query dataSource = "${database}" var = "result">
select * from task;
</sql:query>

<c:forEach var = "row" items = "${result.rows}">
<tr>
    <td><c:out value = "${row.nom_task}"/></td>
    <td><c:out value = "${row.desc_task}"/></td>
    <td><c:out value = "${row.estado}"/></td>
</tr>
</c:forEach>