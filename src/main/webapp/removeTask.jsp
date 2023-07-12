<%@ include file="jsp/header.jsp"%>

<sql:setDataSource var = "database"
url = "jdbc:mysql://localhost:3306/shop"
user = "root"  password = ""/>

<sql:update dataSource = "${database}" var = "result">
    delete from task
    where id = ${param.id};
</sql:update>