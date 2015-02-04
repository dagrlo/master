<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Finalizar tareas</title>
<link rel="stylesheet" type="text/css" href="./css/mainProgramador.css"/>
</head>
<body>
	<h1>Tareas:</h1>
	
	<form id="loginForm" class="ta-c" action="MarcarFinalizadas" method="post">
	<div id="cuadro">
		<table>
		<tr><th>Tarea</th><th>Fecha finalizacion</th><th>Finalizada</th><th>Marcar como finalizada</th></tr>
		<c:forEach var="tareas" items="${tareas}">
				<tr><td>	[${tareas.id}] - ${tareas.nombre} </td>
				<td>  ${tareas.fechaTope}</td>
				<td>  ${tareas.fechaFinalizacion}</td>
				<td>
				<c:choose>
					<c:when test="${tareas.fechaFinalizacion==null }">
						<input type="checkbox" name="finalizadas" value='${tareas.id}'>Finalizar
					</c:when>
					<c:otherwise>
						<b>TAREA FINALIZADA</b>
					</c:otherwise> 
				</c:choose>
				 </td>
				</tr>
									
		</c:forEach>
	</table>
	<br/><br/>
	<input type="submit" value="Enviar">
	</div>
	</form>
</body>
</html>