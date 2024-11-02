


package DAO726;

/**
 *
 * @author Ngọ Văn Trọng
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Entity726.NVQL_726;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class NVQL_DAO726 {
    private static Connection con;

    public NVQL_DAO726() throws Exception {
        DAO726 dao = new DAO726();
        con = dao.getConnection(); // Kiểm tra kết nối tại đây
        if (con == null) {
            System.err.println("Không thể kết nối đến cơ sở dữ liệu.");
        }
    }

   

  
  
  public NVQL_726 checkLogin(String userId, String password) {
    String sql = "SELECT * FROM nvql_726 WHERE maNV = ? AND password = ?";
    try (PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setString(1, userId);
        ps.setString(2, password);
        
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            // Nếu có kết quả trả về thì tạo đối tượng KhachHang_726
            NVQL_726 ql = new NVQL_726();
            ql.setId(rs.getInt("id")); // Gán ID
            ql.setHoTen(rs.getString("hoTen")); // Gán họ tên
            ql.setSdt(rs.getString("sdt")); // Gán số điện thoại
            ql.setEmail(rs.getString("email")); // Gán địa chỉ email
            ql.setNgaySinh(rs.getDate("ngaySinh")); // Gán ngày sinh
            ql.setPassword(rs.getString("password")); // Gán mật khẩu
            ql.setMaNV(rs.getString("maNV")); // Gán mã khách hàng
            ql.setChucVu(rs.getString("chucVu")); // Gán mã khách hàng
            ql.setSieuThiId(rs.getInt("sieuThi_Id")); // Gán ID siêu thị (nếu có)

            return ql; // Trả về đối tượng người dùng
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return null; // Nếu không tìm thấy hoặc có lỗi, trả về null
}





   
    
    
}
