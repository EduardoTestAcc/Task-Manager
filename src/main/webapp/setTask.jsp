<%@ include file="jsp/header.jsp"%>

<sql:setDataSource var = "database"
url = "jdbc:mysql://localhost:3306/shop"
user = "root"  password = ""/>

<sql:update dataSource = "${database}" var = "result">
    insert into task(name, summary, priority, state)
    values ("${param.title}", "${param.summary}", "${param.priority}", "unstarted");
</sql:update>
