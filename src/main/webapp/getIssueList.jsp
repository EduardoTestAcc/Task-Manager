<%@ include file="jsp/header.jsp"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<sql:setDataSource var = "database"
url = "jdbc:mysql://localhost:3306/shop"
user = "root"  password = ""/>

<sql:query dataSource = "${database}" var = "unstarted">
select * from task where state = "unstarted" order by priority = 'high' desc, priority = 'medium' desc, id asc;
</sql:query>

<sql:query dataSource = "${database}" var = "started">
select * from task where state = "started" order by priority = 'high' desc, priority = 'medium' desc, id asc;
</sql:query>

<sql:query dataSource = "${database}" var = "done">
select * from task where state = "done" order by priority = 'high' desc, priority = 'medium' desc, id asc;
</sql:query>

<tr><td id="state-title">Started<span><c:out value = "${fn:length(started.rows)}"/></span></td></tr>
<c:forEach var = "row" items = "${started.rows}">
<tr id="T-${row.id}">
    <td><c:out value = "T-${row.id}"/></td>
    <td><c:out value = "${row.name}"/></td>
    <td><c:out value = "${row.priority}"/></td>
</tr>
<script>
document.getElementById("T-${row.id}").addEventListener('click', async () => {
    document.querySelector("#task-id").innerHTML = "T-${row.id}";
    document.querySelector("#task-id").value = "${row.id}";
    document.querySelector(".task-title").innerHTML = "${row.name}";
    document.querySelector(".task-summary").innerHTML = "${row.summary}";
    document.querySelector(".task-details").showModal();
});
</script>
</c:forEach>

<tr><td id="state-title">Unstarted<span><c:out value = "${fn:length(unstarted.rows)}"/></span></td></tr>
<c:forEach var = "row" items = "${unstarted.rows}">
<tr id="T-${row.id}">
    <td><c:out value = "T-${row.id}"/></td>
    <td><c:out value = "${row.name}"/></td>
    <td><c:out value = "${row.priority}"/></td>
</tr>
<script>
document.getElementById("T-${row.id}").addEventListener('click', async () => {
    document.querySelector("#task-id").innerHTML = "T-${row.id}";
    document.querySelector("#task-id").value = "${row.id}";
    document.querySelector(".task-title").innerHTML = "${row.name}";
    document.querySelector(".task-summary").innerHTML = "${row.summary}";
    document.querySelector(".task-details").showModal();
});
</script>
</c:forEach>

<tr><td id="state-title">Done<span><c:out value = "${fn:length(done.rows)}"/></span></td></tr>
<c:forEach var = "row" items = "${done.rows}">
<tr id="T-${row.id}">
    <td><c:out value = "T-${row.id}"/></td>
    <td><c:out value = "${row.name}"/></td>
    <td><c:out value = "${row.priority}"/></td>
</tr>
<script>
document.getElementById("T-${row.id}").addEventListener('click', async () => {
    document.querySelector("#task-id").innerHTML = "T-${row.id}";
    document.querySelector("#task-id").value = "${row.id}";
    document.querySelector(".task-title").innerHTML = "${row.name}";
    document.querySelector(".task-summary").innerHTML = "${row.summary}";
    document.querySelector(".task-details").showModal();
});
</script>
</c:forEach>
