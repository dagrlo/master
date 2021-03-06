<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Página Principal</title>
</head>
<body>
    id:${userId}<br/>
	<table>
		<tr>
			<th>Temas Iniciados</th>
		</tr>
	</table>
	<table>
			<c:forEach var="topics" items="${topics_null}">
				<c:choose>
					<c:when test="${topics.id == -1}">
						<tr>
							<td>No hay temas creados.</td>
						</tr>
					</c:when>
					<c:when test="${topics.id == -2}">
						<tr>
							<td>No se puede establecer conexión con la base de datos.</td>
						</tr>
					</c:when>
					<c:when test="${topics.id > -1}">
						<tr>
							<td>${topics.id}</td>
						</tr>
					</c:when>
				</c:choose>
			</c:forEach>
	</table>
</body>
</html>