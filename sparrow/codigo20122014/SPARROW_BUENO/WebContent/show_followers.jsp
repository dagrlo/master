<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Followers</title>
</head>
<body>
	<h1>Lista de seguidores</h1>
	<ul>
		<core:forEach items="${followList}" var="fList">
			<li>${fList.username}</li>
		</core:forEach>
	</ul>
</body>
</html>