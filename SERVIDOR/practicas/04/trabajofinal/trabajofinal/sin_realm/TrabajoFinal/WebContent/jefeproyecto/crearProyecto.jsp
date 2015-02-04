<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Crear proyecto</title>
<link rel="stylesheet" type="text/css" href="./css/mainJefe.css"/>
</head>
<body>	
	<h1>Crear nuevo proyecto</h1>
	<div id="cuadro">
		<form id="loginForm" class="ta-c" action="AddProyecto" method="post">
			Nombre del proyecto: <input type="text" name="nombre" class="cuadroTexto"/>
			<br/><br/>
			<input type="submit" value="Enviar">
		</form>	
	</div>
</body>
</html>