package main;

import java.sql.SQLException;

public interface ProductoService {
    public void callSpInsertarProducto(Producto producto) throws SQLException;
    public void callSpBorrarProducto(String codigoBarras) throws SQLException;
    public void callSpActualizarProducto(Producto producto) throws SQLException;
    public void callSpListarProductos(String codigoBarras) throws SQLException;
    public void selectAllFromProducto() throws SQLException;
    public void menu() throws SQLException;
}
