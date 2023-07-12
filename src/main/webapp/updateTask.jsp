<%@ include file="jsp/header.jsp"%>

<sql:setDataSource var = "database"
url = "jdbc:mysql://localhost:3306/shop"
user = "root"  password = ""/>

<sql:update dataSource = "${database}" var = "result">
    update task
    set state = "${param.status}",
    priority = "${param.priority}"
    where id = ${param.id};
</sql:update>
