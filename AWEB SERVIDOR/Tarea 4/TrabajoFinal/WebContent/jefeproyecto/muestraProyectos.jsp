<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Proyectos</title>
<style type="text/css">
   table {border-collapse: collapse;} 
   table, tr, td , th {border: 1px solid blue;} 
   th {font-weight: bold;}
   td {padding-left: 2em; padding-right:2em;}
</style>
</head>
<body>

<h1> Proyectos </h1>

<table>
<tr>
 <th> Nombre proyecto </th>
 <th> Acción </th>
</tr>
<c:forEach items="${proyectos}" var="proyecto">
   <tr> 
      <td>${proyecto.nombre} </td> 
      <td><form action="/TrabajoFinal/jefeproyecto/VerTareas" method="POST">
              <input type="hidden" name="id_pr" value="${proyecto.id}"/>
              <input type="hidden" name="nombre_pr" value="${proyecto.nombre}"/>
              <input type="submit" value="Ver tareas" />
          </form>
      </td>
   </tr>
</c:forEach>
</table>

<h2> Crear un nuevo proyecto </h2>

<form action="/TrabajoFinal/jefeproyecto/AddProyecto" method="POST">
  Nombre del proyecto: <input type="text" name="nombre" />
  <input type="submit" value="Crear proyecto" />
</form>

</body>
</html>