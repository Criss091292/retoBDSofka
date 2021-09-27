package main;

import integration.database.mysql.MySqlOperations;
import org.apache.log4j.PropertyConfigurator;
import java.sql.SQLException;
import java.util.Scanner;

import static util.enums.Log4jValues.LOG4J_PROPERTIES_FILE_PATH;
import static util.enums.SystemProperties.USER_DIR;

public class Main {

    private static final String SERVER = "sofka-training.cpxphmd1h1ok.us-east-1.rds.amazonaws.com";
    private static final String DATA_BASE_NAME = "CristianAyala_Supermercado_13092021";
    private static final String USER = "sofka_training";
    private static final String PASSWORD = "BZenX643bQHw";

    private static final String SELECT_ALL_FROM_DEPARTAMENTO = String.format("select * from %s.Departamento", DATA_BASE_NAME);
    private static final String SELECT_ALL_FROM_DOMICILIO= String.format("select * from %s.Domicilio", DATA_BASE_NAME);
    private static final String SELECT_ALL_FROM_PRODUCTO= String.format("select * from %s.producto", DATA_BASE_NAME);
    private static final String SELECT_ALL_FROM_TELEFONO= String.format("select * from %s.Telefono", DATA_BASE_NAME);
    private static final String SELECT_ALL_FROM_TIPODOCUMENTO= String.format("select * from %s.TipoDocumento", DATA_BASE_NAME);

    private static final MySqlOperations mySqlOperations = new MySqlOperations();

    public static void main(String[] args) throws Exception {
        PropertyConfigurator.configure(USER_DIR.getValue() + LOG4J_PROPERTIES_FILE_PATH.getValue());

        login();
        selectAllFromDepartamento();
        System.out.println("*********************************************");
        setSelectAllFromDomicilio();
        System.out.println("*********************************************");
        setSelectAllFromTelefono();
        System.out.println("*********************************************");
        menu();
        logout();

    }

    private static void login(){
        mySqlOperations.setServer(SERVER);
        mySqlOperations.setDataBaseName(DATA_BASE_NAME);
        mySqlOperations.setUser(USER);
        mySqlOperations.setPassword(PASSWORD);
    }

    private static void selectAllFromDepartamento() throws SQLException {
        mySqlOperations.setSqlStatement(SELECT_ALL_FROM_DEPARTAMENTO);
        mySqlOperations.executeSqlStatement();
        mySqlOperations.printResultSet();
    }

    private static void setSelectAllFromDomicilio() throws SQLException {
        mySqlOperations.setSqlStatement(SELECT_ALL_FROM_DOMICILIO);
        mySqlOperations.executeSqlStatement();
        mySqlOperations.printResultSet();
    }

    private static void setSelectAllFromProducto() throws SQLException {
        mySqlOperations.setSqlStatement(SELECT_ALL_FROM_PRODUCTO);
        mySqlOperations.executeSqlStatement();
        mySqlOperations.printResultSet();
    }

    private static void setSelectAllFromTelefono() throws SQLException {
        mySqlOperations.setSqlStatement(SELECT_ALL_FROM_TELEFONO);
        mySqlOperations.executeSqlStatement();
        mySqlOperations.printResultSet();
    }

    private static void callSpListarProductos() throws SQLException {
        Scanner leer = new Scanner(System.in);
        System.out.println("Escriba el codigo de barras del producto a buscar");
        String codigoBarras=leer.nextLine();
        mySqlOperations.setSqlStatement(String.format("call sp_select_producto(\""+codigoBarras+"\")",DATA_BASE_NAME));
        mySqlOperations.executeSqlStatement();
        mySqlOperations.printResultSet();
    }

    private static void callSpActualizarProducto() throws SQLException {
        Scanner leer = new Scanner(System.in);
        System.out.println("Escriba el codigo de barras del producto a actualizar");
        String codigoBarras=leer.nextLine();
        System.out.println("Escriba el nuevo nombre del producto a actualizar");
        String nombre=leer.nextLine();
        System.out.println("Escriba el nuevo precioBase del producto a actualizar");
        Long precioBase= Long.parseLong(leer.nextLine());
        mySqlOperations.setSqlStatement(String.format("call actualizar_producto('"+codigoBarras+"',"+"'"+nombre+"',"+precioBase +",@respuesta)",DATA_BASE_NAME));
        mySqlOperations.executeSqlStatement();
        mySqlOperations.printResultSet();
    }

    private static void callSpInsertarProducto() throws SQLException {
        Scanner leer = new Scanner(System.in);
        System.out.println("Escriba el codigo de barras del producto");
        String codigoBarras=leer.nextLine();
        System.out.println("Escriba el nombre del producto");
        String nombre=leer.nextLine();
        System.out.println("Escriba el precioBase del producto");
        Long precioBase= Long.parseLong(leer.nextLine());
        mySqlOperations.setSqlStatement(String.format("call sp_insertar_producto('"+codigoBarras+"',"+"'"+nombre+"',"+precioBase +",@respuesta)",DATA_BASE_NAME));
        mySqlOperations.executeSqlStatement();
        mySqlOperations.printResultSet();
    }


    private static void callSpBorrarProducto() throws SQLException {
        Scanner leer = new Scanner(System.in);
        System.out.println("Escriba el codigo de barras del producto a borrar");
        String codigoBarras=leer.nextLine();
        mySqlOperations.setSqlStatement(String.format("call sp_borrar_producto('"+codigoBarras+"')",DATA_BASE_NAME));
        mySqlOperations.executeSqlStatement();
    }

    private static void menu() throws SQLException {
        Scanner leer = new Scanner(System.in);
        int i= 500;
        while(i!=6){
            System.out.println("Menu de opciones para producto:" +
                    "\n1:Insertar\n2:listar todos" +
                    "\n3:buscar por codigo barras\n4:actualizar" +
                    "\n5:borrar\n6:salir");
            i=leer.nextInt();
            switch (i) {
                case 1:
                    callSpInsertarProducto();
                    break;
                case 2:
                    setSelectAllFromProducto();
                    break;
                case 3:
                    callSpListarProductos();
                    break;
                case 4:
                    callSpActualizarProducto();
                    break;
                case 5:
                    callSpBorrarProducto();
                    break;
                default:
                    break;

            }
        }
    }

    private static void logout(){
        mySqlOperations.close();
    }

}
