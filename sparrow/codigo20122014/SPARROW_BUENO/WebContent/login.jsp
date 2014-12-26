<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="userbean" scope="session" class="es.uv.isw.sparrow.bean.UserBeanImpl"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="css/login.css" rel="stylesheet">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
	<div class="ta-c">
	 <img id="sparrowLogo" src="imagenes/SPARROW.jpg" alt="Smiley face" height="200" width="270"> 
	</div>
	<div class="loginZone">
	   	<form id="loginForm" class="ta-c" action="pages/mainPage.jsp" method="post">
	      Username: <input type="text" name="username" value=<jsp:getProperty name="userbean" property="username"/>>
	      <br>
	      Password: <input type="text" name="password">
	      <br>
	      <input id="entrar" type="submit" value="Entrar"/>
	    </form>
	    <div class="ta-c">
	    	<a href="RegisterForm.jsp">Usuario nuevo: Registrar</a> 
	    </div>
	    <div class="ta-c">
	    	<a href="ForgetPasswordForm.jsp">Recuperar clave</a> 
	    </div>
    </div>
</body>
</html>
