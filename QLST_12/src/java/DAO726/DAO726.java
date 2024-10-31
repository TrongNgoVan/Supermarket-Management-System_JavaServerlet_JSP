


package DAO726;

/**
 *
 * @author Ngọ Văn Trọng
 */


import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAO726 {

    private static Connection con;

    // Constructor chỉ khởi tạo kết nối cơ sở dữ liệu
    public DAO726() {
        try {
            String url = "jdbc:mysql://localhost:3306/12_qlst_726"; 
            String user = "root";
            String password = ""; 
            con = DriverManager.getConnection(url, user, password);
            System.out.println("Kết nối thành công đến CSDL");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Kết nối thất bại");
        }
    }

    public static Connection getConnection() {
        return con;
    }

   
}

