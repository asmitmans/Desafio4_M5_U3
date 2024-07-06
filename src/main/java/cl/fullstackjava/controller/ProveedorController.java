package cl.fullstackjava.controller;

import cl.fullstackjava.model.dto.Proveedor;
import cl.fullstackjava.model.dao.ProveedorDAO;
import cl.fullstackjava.model.dao.ProveedorDAOImp;



import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/")
public class ProveedorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public ProveedorController() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ProveedorDAO aDAO = new ProveedorDAOImp();
		List<Proveedor> proveedores = aDAO.read();
		request.setAttribute("proveedores", proveedores);
		getServletContext().getRequestDispatcher("/views/index.jsp").forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
