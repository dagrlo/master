<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Resultados de mesas</title>
<link rel="stylesheet" type="text/css" href="estilos.css"/>
</head>
<body>
	<table>
		<tr>
			<th>Distrito</th>
			<th>Seccion</th>
			<th>Mesa</th>
			<th>Colegio</th>
			<th>Electores</th>
			<th>Votos efectuados</th>
			<th>Porcentaje participacion</th>
			<th>Votos efectivos</th>
			<th>Porcentaje efectivos</th>
			<th>Votos blancos</th>
			<th>Porcentaje blancos</th>
			<th>Votos nulos</th>
			<th>Porcentaje nulos</th>
		</tr>
		<core:forEach items="${lista}" var="listaR">
		  <core:choose>
		    <core:when test="${listaR.porcParticipacion<70}">
		    <%-- Se puede comprobar que cambia la clase CSS, no entiendo por qué no cambia el color de fondo
		      ya que si que puede cambiar la configuración de la fuente. He probado el mismo CSS en un
		      html cualquiera y sí que me cambia el fondo --%>
		    	<tr class="menor">
		    </core:when>
			<core:otherwise>
				<tr>
			</core:otherwise>
		  </core:choose>
				<td>${listaR.distrito}</td>
				<td>${listaR.seccion}</td>
				<td>${listaR.mesa}</td>
				<td>${listaR.colegio}</td>
				<td>${listaR.electores}</td>
				<td>${listaR.votosEfectuados}</td>
				<td>${listaR.porcParticipacion}</td>
				<td>${listaR.votosEfectivos}</td>
				<td>${listaR.porcEfectivos}</td>
				<td>${listaR.votosBlancos}</td>
				<td>${listaR.porcBlancos}</td>
				<td>${listaR.votosNulos}</td>
				<td>${listaR.porcNulos}</td>
			</tr>
		</core:forEach>
	</table>
</body>
</html>