<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Listado de Proveedores</title>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
		crossorigin="anonymous">
	<link
		href="//cdn.datatables.net/2.0.8/css/dataTables.dataTables.min.css"
		rel="stylesheet">
</head>
<body class="bg-dark text-light">

	<div class="container">
		<h1 class="text-center text-light py-4">Listado de Proveedores</h1>
		
	    <!-- Mostrar Mensaje -->
        <c:if test="${not empty param.mensaje}">
            <div class="alert ${fn:contains(param.mensaje, 'ERROR') ? 'alert-danger' : 'alert-success'}">${param.mensaje}</div>
        </c:if>
		
		
		<table class="table table-dark table-striped" id="tblProveedor">
			<thead>
				<tr>
					<th>Id</th>
					<th>Nombre</th>
					<th>RUT</th>
					<th>Dirección</th>
					<th>Correo</th>
					<th>Telefono</th>
					<th>Contacto</th>
					<th>Telefono Contacto</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="p" items="${proveedores}">
					<tr>
						<td><c:out value="${p.getId()}" /></td>
						<td><c:out value="${p.getNombre()}" /></td>
						<td><c:out value="${p.getRut()}" /></td>
						<td><c:out value="${p.getDireccion()}" /></td>
						<td><c:out value="${p.getCorreo()}" /></td>
						<td><c:out value="${p.getTelefono()}" /></td>
						<td><c:out value="${p.getContacto()}" /></td>
						<td><c:out value="${p.getTelefonoContacto()}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="text-center pt-3">
			<a href="${pageContext.request.contextPath}/crearProveedor"
				class="btn btn-primary">Crear Proveedor</a>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script src="https://cdn.datatables.net/2.0.8/js/dataTables.min.js"></script>
	<script>
		$(document).ready(() => {
	        $('#tblProveedor').DataTable({
	            "order": [[1, 'asc']] // Ordenar por la segunda columna (Nombre) de manera ascendente
	        });
	    });
    </script>
     
    <script>
        window.onload = function() {
            if (window.location.search.indexOf('mensaje=') !== -1) {
                // Remover el parámetro 'mensaje' de la URL sin recargar la página
                const url = new URL(window.location);
                url.searchParams.delete('mensaje');
                window.history.replaceState({}, document.title, url);
            }
        };
    </script>
</body>
</html>