<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="formChecker.js"></script>
<title>Registro de usuario:</title>
</head>
<body>
	<div id="cabecera">
		<a href="login.jsp">
			<img id="sparrowLogo" src="imagenes/SPARROW.jpg">
		</a> 
		
		<label id="titulo">Sparrow</label>
	</div>
	<form action="Register" method="post" onSubmit="return checkForm()">
    	Usuario: <input type="text" name="username" id="usernameField"> <br>
      	Clave: <input type="password" name="password" id="pwdField"> <br>
      	E-mail: <input type="text" name="eMail" id="mailField"> <br>
      	Nombre: <input type="text" name="nombre" id="nameField"> <br>
      	Apellidos: <input type="text" name="apellidos" id="surnameField"> <br>
      	Sexo: <input type="radio" name="sexo" value="V" id="genderV">V
      			<input type="radio" name="sexo" value="M" id="genderM">M<br>
      	Idioma: <select name="idioma" id="languageField">
      				<option value="es">Español</option>
      				<option value="en">English</option>
      				<option value="de">Deutsch</option>
      			</select> <br>
      	<input type="submit" name="subscribe" value="Continuar">
      	
      	<!-- Crear un User y rellenarlo con todo, ya se encargara el servlet de comprobar si existe el user -->
      	
   </form>
   <button id="volver" onclick="location.href='login.jsp'"> Volver </button>
</body>
</html>