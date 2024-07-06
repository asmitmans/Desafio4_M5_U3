package cl.fullstackjava.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import cl.fullstackjava.model.conexion.Conexion;
import cl.fullstackjava.model.dto.Proveedor;

// Ejecutar query para la inserción y obtención de 
//   proveedores en clase de acceso a datos.
public class ProveedorDAOImp implements ProveedorDAO {

	@Override
	public String create(Proveedor p) {

		// Para evitar la insersion de valores null
		// como String "null" usamos PreparedStatement
		String resultMessage = "";
		String sql = "INSERT INTO proveedores (nombre, rut, direccion, correo, telefono, contacto, telefono_contacto) VALUES (?, ?, ?, ?, ?, ?, ?)";

		try {
			Connection c = Conexion.getCon();
			PreparedStatement ps = c.prepareStatement(sql);

			ps.setString(1, p.getNombre());
			ps.setString(2, p.getRut());
			ps.setString(3, p.getDireccion());
			ps.setString(4, p.getCorreo());
			ps.setString(5, p.getTelefono());
			ps.setString(6, p.getContacto());
			ps.setString(7, p.getTelefonoContacto());

			int rowAffected = ps.executeUpdate();

			if (rowAffected > 0) {
				resultMessage = "Datos insertados correctamente.";
			} else {
				resultMessage = "No se insertaron datos.";
			}
		} catch (SQLException e) {
			resultMessage = "Error en la base de datos: " + e.getMessage();
			e.printStackTrace();
		}
		
		return resultMessage;
	}

	@Override
	public Proveedor read(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Proveedor> read() {

		List<Proveedor> proveedores = new ArrayList<Proveedor>();

		try {

			Connection c = Conexion.getCon();
			Statement s = c.createStatement();
			String sql = "SELECT id,nombre,rut,direccion,correo,telefono,contacto,telefono_contacto FROM proveedores ORDER BY nombre ASC;";
			ResultSet rs = s.executeQuery(sql);

			while (rs.next()) {
				proveedores.add(new Proveedor(rs.getInt("id"), rs.getString("nombre"), rs.getString("rut"),
						rs.getString("direccion"), rs.getString("correo"), rs.getString("telefono"),
						rs.getString("contacto"), rs.getString("telefono_contacto")));
			}

		} catch (SQLException e) {
			System.out.println("ERROR en método read()");
			e.printStackTrace();
		}

		return proveedores;
	}

	@Override
	public void update(Proveedor p) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub

	}

}
