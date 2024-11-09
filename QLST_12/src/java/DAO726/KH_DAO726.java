package DAO726;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Entity726.KhachHang_726;
import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.Types;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class KH_DAO726 {
    private static Connection con;

    public KH_DAO726() throws Exception {
        DAO726 dao = new DAO726();
        con = dao.getConnection(); // Kiểm tra kết nối tại đây
        if (con == null) {
            System.err.println("Không thể kết nối đến cơ sở dữ liệu.");
        }
    }

    public static String addKH(KhachHang_726 kh) {
        if (con == null) {
            System.err.println("Kết nối cơ sở dữ liệu là null.");
            return null;  // Không thể thêm khách hàng nếu không có kết nối
        }

        String sql = "{CALL DangKyKhachHang726(?, ?, ?, ?, ?, ?)}";  // Call the stored procedure

        try (CallableStatement cs = con.prepareCall(sql)) {
            cs.setString(1, kh.getHoTen());
            cs.setString(2, kh.getSdt());
            cs.setString(3, kh.getEmail());
            cs.setDate(4, kh.getNgaySinh());
            cs.setString(5, kh.getPassword());

            // Register the OUTPUT parameter for maKH
            cs.registerOutParameter(6, Types.VARCHAR);

            // Execute the stored procedure
            cs.executeUpdate();

            // Get the generated maKH from the output parameter
            String maKH = cs.getString(6);

            return maKH;  // Return the generated maKH
        } catch (SQLException e) {
            System.err.println("SQL State: " + e.getSQLState());
            System.err.println("Error Code: " + e.getErrorCode());
            e.printStackTrace();
            return null;
        }
    }

  public KhachHang_726 checkLogin(String userId, String password) {
    String sql = "SELECT * FROM khachhang_726 WHERE maKH = ? AND password = ?";
    try (PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setString(1, userId);
        ps.setString(2, password);
        
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            // Nếu có kết quả trả về thì tạo đối tượng KhachHang_726
            KhachHang_726 khachHang = new KhachHang_726();
            khachHang.setId(rs.getInt("id")); // Gán ID
            khachHang.setHoTen(rs.getString("hoTen")); // Gán họ tên
            khachHang.setSdt(rs.getString("sdt")); // Gán số điện thoại
            khachHang.setEmail(rs.getString("email")); // Gán địa chỉ email
            khachHang.setNgaySinh(rs.getDate("ngaySinh")); // Gán ngày sinh
            khachHang.setPassword(rs.getString("password")); // Gán mật khẩu
            khachHang.setMaKH(rs.getString("maKH")); // Gán mã khách hàng
            khachHang.setSieuthiId(rs.getInt("sieuThi_Id")); // Gán ID siêu thị (nếu có)

            return khachHang; // Trả về đối tượng người dùng
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return null; // Nếu không tìm thấy hoặc có lỗi, trả về null
}





    public static void main(String[] args) throws Exception {
      
    }
    
    
}
