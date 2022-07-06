<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>all List</title>
<style>
body{	
	height: 50;
    display: flex;
    align-content: center;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    width: 1450px;
    }
table{
    text-align: center;
    border: 1px solid black;
    }
    </style>
</head>
<body>
<table width = 100% align="center" border = 1>
	<tr bgcolor = "Aliceblue" align="center" height="30">
		<th>seq</th><th>codename</th><th>content</th><th>작성일자</th>
	</tr>
	<c:if test="${not empty content1}">
		<c:forEach var="m" varStatus="list_vs" items="${content1}">
			<tr align="center">
				<td>${m.seq}</td><td>${m.codename}</td><td>${m.content}</td><td>${m.regdate}</td>
			</tr>
		</c:forEach>
	</c:if>
	<c:if test="${empty content1}">
		<tr height="30"><td colspan=4> ** 출력할 자료가 1건도 없습니다.
	</c:if>
</table>	
</body>
</html>