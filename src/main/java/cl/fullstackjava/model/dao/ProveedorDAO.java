package cl.fullstackjava.model.dao;

import java.util.List;

import cl.fullstackjava.model.dto.Proveedor;

public interface ProveedorDAO {
	String create(Proveedor p);
	Proveedor read(int id);
	List<Proveedor> read();
	void update(Proveedor p);
	void delete(int id);
}