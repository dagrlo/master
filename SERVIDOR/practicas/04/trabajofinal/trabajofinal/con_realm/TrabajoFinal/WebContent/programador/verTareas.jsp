<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ver tareas</title>
<link rel="stylesheet" type="text/css" href="./css/mainProgramador.css"/>
</head>
<body>
	<h1>Programador. Tareas</h1>
	<div id="cuadro">
	<table align="center">
		<tr><th>Tarea</th><th>Fecha finalizacion</th><th>Finalizada</th></tr>
		<c:forEach var="tareas" items="${tareas}">
				<tr>
					<td>[${tareas.id}] - ${tareas.nombre}</td>
					<td>${tareas.fechaTope }</td>
					<td>${tareas.fechaFinalizacion }</td>
				</tr>					
		</c:forEach>
	</table>
	</div>

</body>
</html>