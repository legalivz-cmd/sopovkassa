/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package javaapplication3;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author zz
 */
public class DbConnection {
     private static final String URL = "jdbc:postgresql://localhost:5432/sopovkassa";
    private static final String USER = "postgres";
    private static final String PASSWORD = "123";  

    public static Connection getConnection() {
        try {
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null,
                "Ошибка подключения к базе:\n" + ex.getMessage() +
                "\n\nПроверьте:\n1. Запущен ли PostgreSQL\n2. Правильный пароль\n3. Существует ли база",
                "Ошибка базы данных", JOptionPane.ERROR_MESSAGE);
            ex.printStackTrace(System.err); 
            return null;
        }
    }
}

