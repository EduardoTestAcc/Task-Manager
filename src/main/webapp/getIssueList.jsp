<%@ include file="jsp/header.jsp"%>

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
