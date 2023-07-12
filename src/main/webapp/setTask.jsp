<%@ include file="jsp/header.jsp"%>

<sql:setDataSource var = "database"
url = "jdbc:mysql://localhost:3306/shop"
user = "root"  password = ""/>

<sql:update dataSource = "${database}" var = "result">
    insert into task(nom_task, desc_task, estado)
    values ("${param.title}", "${param.desc}", "${param.prio}");
</sql:update>
