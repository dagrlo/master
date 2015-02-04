<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ver Tareas</title>
<link rel="stylesheet" type="text/css" href="./css/mainJefe.css"/>
</head>
<body>
			
	<c:choose>
		<c:when test="${tareas !=null}">
			<h1>Tareas de ${nombreProyecto}:</h1>
		    			
				<table align="center">
					<tr><th>Nombre de tarea</th><th>Asignada a </th><th>Fecha prevista de finalizacion</th><th>Fecha finalizada</th></tr>
					<c:forEach var="tareas" items="${tareas}">
						<tr><td>[${tareas.id}] - ${tareas.nombre}</td><td>${tareas.programador}</td><td>${tareas.fechaTope}</td><td>${tareas.fechaFinalizacion}</td></tr>					
					</c:forEach>
				</table>
				<br/><br/>
				<form id="loginForm" class="ta-c" action="CrearTarea" method="post">				
				<input type="hidden" name="proyecto" value="${proyecto}"/>
				<div id="cuadro">
					<h2>Crear nueva tarea:</h2>					
					<table>						
						<tr><td>Nombre de la tarea: </td><td><input type="text" name="tarea"class="textoTabla"/></td></tr>
						<tr><td>Usuario:</td><td>
						<select name="usuario" class="textoTabla">
							<c:forEach var="usuarios" items="${usuarios}">
								<option value='${usuarios.id}'>${usuarios.nombre}</option>
							</c:forEach>
						</select>
						</td></tr>
						<tr><td>Año:</td><td><input type="text" name="year" class="textoTabla"/></td></tr>
						<tr><td>Mes:</td><td><input type="text" name="mes" class="textoTabla"/></td></tr>
						<tr><td>Dia:</td><td><input type="text" name="dia"class="textoTabla"/></td></tr>
						<tr><td colspan="2"><input type="submit" value="Enviar"></td></tr>
					</table>
				</div>
				</form>
		</c:when>
		<c:otherwise>
		<form id="loginForm" class="ta-c" action="VerTareas" method="post">
			<h1>Elegir proyecto:</h1>
			<div id="cuadro">				
				<select name="proyecto">		
					<c:forEach var="proyecto" items="${proyectos}">
						<option value='${proyecto.id}'>${proyecto.nombre}</option>
					</c:forEach>
				</select>					
				<input type="submit" value="Enviar">
			</div>
		</form>
		</c:otherwise>
	</c:choose>
	
	
	
	
	

</body>
</html>