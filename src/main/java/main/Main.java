package main;

import integration.database.mysql.MySqlOperations;
import org.apache.log4j.PropertyConfigurator;
import java.sql.SQLException;
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
    private static final String CALL_SP_LISTAR_PELICULAS= String.format("call sp_listar_peliculas()");

    private static final MySqlOperations mySqlOperations = new MySqlOperations();

    public static void main(String[] args) throws Exception {
        PropertyConfigurator.configure(USER_DIR.getValue() + LOG4J_PROPERTIES_FILE_PATH.getValue());

        login();
        selectAllFromDepartamento();
        System.out.println("*********************************************");
        System.out.println("*********************************************");
        setSelectAllFromDomicilio();
        System.out.println("*********************************************");
        System.out.println("*********************************************");
        setSelectAllFromProducto();
        System.out.println("*********************************************");
        System.out.println("*********************************************");
        setSelectAllFromTelefono();
        System.out.println("*********************************************");
        System.out.println("*********************************************");
        callSpListarPeliculas();
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

    private static void callSpListarPeliculas() throws SQLException {
        mySqlOperations.setSqlStatement(CALL_SP_LISTAR_PELICULAS);
        mySqlOperations.executeSqlStatement();
        mySqlOperations.printResultSet();
    }

    private static void logout(){
        mySqlOperations.close();
    }

}
