package cl.fullstackjava.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.fullstackjava.model.dao.ProveedorDAO;
import cl.fullstackjava.model.dao.ProveedorDAOImp;
import cl.fullstackjava.model.dto.Proveedor;

@WebServlet("/crearProveedor")
public class CrearProveedorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CrearProveedorController() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Leer Parametros
		String nombre = request.getParameter("nombre");
		String rut = request.getParameter("rut");
		String direccion = request.getParameter("direccion");
		String correo = request.getParameter("correo");
		String telefono = request.getParameter("telefono");
		String contacto = request.getParameter("contacto");
		String telefonoContacto = request.getParameter("telefono_contacto");
			
		// Validar que la información ingresada en el formulario no sean null o vacío.
		if (isNullOrEmpty(nombre) || isNullOrEmpty(rut) || isNullOrEmpty(direccion) ||
	        isNullOrEmpty(correo) || isNullOrEmpty(telefono) || isNullOrEmpty(contacto) ||
	        isNullOrEmpty(telefonoContacto)) {
			
			request.setAttribute("error", "Todos los campos son obligatorios.");
			request.getRequestDispatcher("/views/crearProveedor.jsp").forward(request, response);
			return;
		}
		
		// Crear el objeto DAO para la creacion del registro
		ProveedorDAO aDAO = new ProveedorDAOImp();
		String mensaje = aDAO.create(new Proveedor(nombre,rut,direccion,correo,telefono,contacto,telefonoContacto));
		
				
		// Redirigir con el mensaje como parámetro de consulta
		// NOTA: Patrón PRG 
	    response.sendRedirect(request.getContextPath() + "?mensaje=" + URLEncoder.encode(mensaje, "UTF-8"));

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getServletContext().getRequestDispatcher("/views/crearProveedor.jsp").forward(request, response);
	}
	
	private boolean isNullOrEmpty(String str) {
        return str == null || str.trim().isEmpty();
    }

}
