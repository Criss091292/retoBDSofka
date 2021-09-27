package main;

import integration.database.mysql.MySqlOperations;

import java.sql.SQLException;
import java.util.Scanner;

public class ProductoServiceImpl implements  ProductoService{
    private static final String SERVER = "sofka-training.cpxphmd1h1ok.us-east-1.rds.amazonaws.com";
    private static final String DATA_BASE_NAME = "CristianAyala_Supermercado_13092021";
    private static final String USER = "sofka_training";
    private static final String PASSWORD = "BZenX643bQHw";
    private static final MySqlOperations mySqlOperations = new MySqlOperations();
    private static final String SELECT_ALL_FROM_PRODUCTO= String.format("select * from %s.producto", DATA_BASE_NAME);
    Scanner leer = new Scanner(System.in);
    private static void login(){
        mySqlOperations.setServer(SERVER);
        mySqlOperations.setDataBaseName(DATA_BASE_NAME);
        mySqlOperations.setUser(USER);
        mySqlOperations.setPassword(PASSWORD);
    }
    private static void logout(){
        mySqlOperations.close();
    }
    @Override
    public void callSpInsertarProducto(Producto producto) throws SQLException {
        mySqlOperations.setSqlStatement(String.format("call sp_insertar_producto('"+producto.getCodigoBarras()+"',"+"'"+producto.getNombre()+"',"+producto.getPrecioBase() +",@respuesta)",DATA_BASE_NAME));
        mySqlOperations.executeSqlStatement();
        mySqlOperations.printResultSet();
    }

    @Override
    public void callSpBorrarProducto(String codigoBarras) throws SQLException {
        mySqlOperations.setSqlStatement(String.format("call sp_borrar_producto('"+codigoBarras+"')",DATA_BASE_NAME));
        mySqlOperations.executeSqlStatement();
    }

    @Override
    public void callSpActualizarProducto(Producto producto) throws SQLException {
        mySqlOperations.setSqlStatement(String.format("call actualizar_producto('"+producto.getCodigoBarras()+"',"+"'"+producto.getNombre()+"',"+producto.getPrecioBase() +",@respuesta)",DATA_BASE_NAME));
        mySqlOperations.executeSqlStatement();
        mySqlOperations.printResultSet();
    }

    @Override
    public void callSpListarProductos(String codigoBarras) throws SQLException {
        mySqlOperations.setSqlStatement(String.format("call sp_select_producto(\""+codigoBarras+"\")",DATA_BASE_NAME));
        mySqlOperations.executeSqlStatement();
        mySqlOperations.printResultSet();
    }

    @Override
    public void selectAllFromProducto() throws SQLException {
        mySqlOperations.setSqlStatement(SELECT_ALL_FROM_PRODUCTO);
        mySqlOperations.executeSqlStatement();
        mySqlOperations.printResultSet();
    }

    @Override
    public void menu() throws SQLException {
        login();
        int i= 500;
        Producto producto = new Producto();
        while(i!=6){
            System.out.println("Menu de opciones para producto:" +
                    "\n1:Insertar\n2:listar todos" +
                    "\n3:buscar por codigo barras\n4:actualizar" +
                    "\n5:borrar\n6:salir");
            i=Integer.parseInt(leer.nextLine());
            producto = null;
            switch (i) {
                case 1:
                    producto = leerProducto();
                    callSpInsertarProducto(producto);
                    break;
                case 2:
                    selectAllFromProducto();
                    break;
                case 3:
                    producto= leerCodigoBarras();
                    callSpListarProductos(producto.getCodigoBarras());
                    break;
                case 4:
                    producto= leerProducto();
                    callSpActualizarProducto(producto);
                    break;
                case 5:
                    producto = leerCodigoBarras();
                    callSpBorrarProducto(producto.getCodigoBarras());
                    break;
                default:
                    break;

            }
        }
        logout();
    }

    Producto leerCodigoBarras(){
        Producto producto = new Producto();
        System.out.println("Escriba el codigo de barras del producto a actualizar");
        producto.setCodigoBarras(leer.nextLine());
        return producto;
    }

    Producto leerProducto(){
        Producto producto = new Producto();
        System.out.println("Escriba el codigo de barras del producto");
        producto.setCodigoBarras(leer.nextLine());
        System.out.println("Escriba el nombre del producto");
        producto.setNombre(leer.nextLine());
        System.out.println("Escriba el precioBase del producto");
        producto.setPrecioBase(Integer.parseInt(leer.nextLine()));
        return producto;
    }
}
