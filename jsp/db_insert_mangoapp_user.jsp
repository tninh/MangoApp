<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
<head>
<title>INSERT Operation</title>
</head>
<body>
 
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/mydb"
     user="root"  password="root"/>

<small>
Showing:<br/>
 <%= request.getParameter("username")%><br/>
 <%= request.getParameter("email")%><br/>
 <%= request.getParameter("password")%><br/>
</small>

<sql:update dataSource="${snapshot}" var="result">
INSERT INTO Users VALUES ( NULL, '<%= request.getParameter("username")%>', '<%= request.getParameter("password")%>', '<%= request.getParameter("email")%>', '2016-12-03', NULL );
</sql:update>
 
<sql:query dataSource="${snapshot}" var="result">
SELECT * from Users;
</sql:query>
 
<table border="1" width="100%">
<tr>
   <th>idUsers</th>
   <th>Username</th>
   <th>Email</th>
   <th>Date</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.idUsers}"/></td>
   <td><c:out value="${row.Username}"/></td>
   <td><c:out value="${row.Email}"/></td>
   <td><c:out value="${row.Date}"/></td>
</tr>
</c:forEach>
</table>
<script>
window.location.href = "http://"+window.location.hostname+":80/MangoApp-gh-pages/index.html";
</script>
</body>
</html>