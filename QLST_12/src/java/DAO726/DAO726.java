package DAO726;

/**
 *
 * @author Ngọ Văn Trọng
 */

import java.sql.*;

public class DAO726 {

    private static Connection con;

    // Constructor chỉ khởi tạo kết nối cơ sở dữ liệu
    public DAO726() throws ClassNotFoundException {
        try {
            // Nạp driver MySQL
            Class.forName("com.mysql.jdbc.Driver");

            // Cấu hình kết nối
            String url = "jdbc:mysql://localhost:3306/12_qlst_726?useUnicode=true&characterEncoding=utf8";

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

    public static void main(String[] args) {
        try {
            DAO726 dao = new DAO726(); // Khởi tạo đối tượng DAO726

            // Kiểm tra xem kết nối có hợp lệ không
            if (dao.getConnection() != null) {
                System.out.println("Kết nối hợp lệ");
               

            } else {
                System.out.println("Kết nối không hợp lệ");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Driver không được tìm thấy");
        }
    }
}
