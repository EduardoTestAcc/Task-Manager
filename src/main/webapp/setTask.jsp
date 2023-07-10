<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "com.mysql.cj.jdbc.Driver"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:setDataSource var = "database" driver = "com.mysql.jdbc.Driver"
url = "jdbc:mysql://localhost:3306/shop"
user = "root"  password = ""/>

<sql:update dataSource = "${database}" var = "result">
    insert into task(nom_task, desc_task, estado)
    values ("${param.tit}", "${param.desc}", "${param.prio}");
</sql:update>
