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
    private static final String SELECT_ALL_FROM_TELEFONO= String.format("select * from %s.Telefono", DATA_BASE_NAME);
    private static final String SELECT_ALL_FROM_TIPODOCUMENTO= String.format("select * from %s.TipoDocumento", DATA_BASE_NAME);
    private static final MySqlOperations mySqlOperations = new MySqlOperations();
    ProductoServiceImpl productoService = new ProductoServiceImpl();
    public static void main(String[] args) throws Exception {
        PropertyConfigurator.configure(USER_DIR.getValue() + LOG4J_PROPERTIES_FILE_PATH.getValue());

        login();
        selectAllFromDepartamento();
        System.out.println("*********************************************");
        setSelectAllFromDomicilio();
        System.out.println("*********************************************");
        setSelectAllFromTelefono();
        System.out.println("*********************************************");
        ProductoService productoService = (ProductoService) new ProductoServiceImpl();
        productoService.menu();
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

    private static void setSelectAllFromTelefono() throws SQLException {
        mySqlOperations.setSqlStatement(SELECT_ALL_FROM_TELEFONO);
        mySqlOperations.executeSqlStatement();
        mySqlOperations.printResultSet();
    }

    private static void logout(){
        mySqlOperations.close();
    }
}
