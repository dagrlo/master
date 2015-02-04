<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Crear tarea</title>
<link rel="stylesheet" type="text/css" href="./css/mainJefe.css"/>
</head>
<body>
	<h1>Nueva tarea</h1>
	<div id="cuadro">	
		<form id="loginForm" class="ta-c" action="CrearTarea" method="post">
		<table class="tabla">		   
			<tr><td>Nombre de la tarea: </td><td><input type="text" name="tarea"class="textoTabla"/></td></tr>
			<tr><td>Proyecto: </td><td>
				<select name="proyecto">		
						<c:forEach items="${proyectos}" var="proyecto">
							<option value='${proyecto.id}'>${proyecto.nombre}</option>							
						</c:forEach>
				</select>
			</td></tr>
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
		</form>	
	
	</div>
	

</body>
</html>