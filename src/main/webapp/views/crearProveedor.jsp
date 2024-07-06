<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Crear Proveedor</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
</head>
<body class="bg-dark text-light">

	<div class="container">

		<h1 class="text-center text-light py-4">Crear Proveedor</h1>

		<!-- Mostrar ERROR Validacion -->
		<c:if test="${not empty error}">
			<div class="alert alert-danger">${error}</div>
		</c:if>

		<form name="formulario" class="form" method="post"
			action="${pageContext.request.contextPath}/crearProveedor">
			<div class="row mb-3 d-flex justify-content-center">
				<div class="col-md-6">
					<div class="mb-3">
						<label for="nombre" class="form-label">Nombre</label> <input
							type="text" class="form-control bg-dark text-light" id="nombre"
							name="nombre" required pattern="[A-Za-z0-9\s]+"
							title="Debe contener solo letras, números y espacios"
							value="${nombre}">
					</div>
					<div class="mb-3">
						<label for="rut" class="form-label">RUT</label> <input type="text"
							class="form-control bg-dark text-light" id="rut" name="rut"
							required pattern="[0-9\-]+"
							title="Debe contener solo números y guiones" value="${rut}">
					</div>
					<div class="mb-3">
						<label for="direccion" class="form-label">Dirección</label> <input
							type="text" class="form-control bg-dark text-light"
							id="direccion" name="direccion" required pattern="[A-Za-z0-9\s]+"
							title="Debe contener solo letras, números y espacios"
							value="${direccion}">
					</div>
					<div class="mb-3">
						<label for="correo" class="form-label">Correo</label> <input
							type="email" class="form-control bg-dark text-light" id="correo"
							name="correo" required
							title="Debe ser un correo electrónico válido" value="${correo}">
					</div>
					<div class="mb-3">
						<label for="telefono" class="form-label">Teléfono</label> <input
							type="text" class="form-control bg-dark text-light" id="telefono"
							name="telefono" required pattern="[0-9\s]+"
							title="Debe contener solo números y espacios" value="${telefono}">
					</div>
					<div class="mb-3">
						<label for="contacto" class="form-label">Contacto</label> <input
							type="text" class="form-control bg-dark text-light" id="contacto"
							name="contacto" required pattern="[A-Za-z0-9\s]+"
							title="Debe contener solo letras, números y espacios"
							value="${contacto}">
					</div>
					<div class="mb-3">
						<label for="telefono_contacto" class="form-label">Teléfono
							Contacto</label> <input type="text"
							class="form-control bg-dark text-light" id="telefono_contacto"
							name="telefono_contacto" required pattern="[0-9\s]+"
							title="Debe contener solo números y espacios"
							value="${telefono_contacto}">
					</div>
					<div class="text-center pt-4">
						<button type="submit" class="btn btn-primary">Crear
							Proveedor</button>
					</div>
				</div>
			</div>
		</form>

		<div class="text-center">
			<form name="volver" action="${pageContext.request.contextPath}"
				method="get">
				<button type="submit" class="btn btn-secondary mt-3">Volver
					a Lista</button>
			</form>
		</div>
	</div>

</body>
</html>