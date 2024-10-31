


package DAO726;

/**
 *
 * @author Ngọ Văn Trọng
 */


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import Entity726.KhachHang_726;

public class KH_DAO726 {
    
    private Connection con;

    // Constructor sử dụng kết nối từ lớp DAO726
    public KH_DAO726() {
        con = DAO726.getConnection(); // Kết nối thông qua DAO726
    }

    // Phương thức để thêm khách hàng mới
    public boolean addKH(KhachHang_726 kh) {
        String sql = "INSERT INTO KhachHang_726 (id, hoTen, sdt, email, ngaySinh, password, maKH, sieuthiId) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            // Thiết lập các giá trị cho các tham số SQL từ đối tượng KhachHang_726
            ps.setString(1, kh.getId());
            ps.setString(2, kh.getHoTen());
            ps.setString(3, kh.getSdt());
            ps.setString(4, kh.getEmail());
            ps.setDate(5, kh.getNgaySinh());
            ps.setString(6, kh.getPassword());
            ps.setString(7, kh.getMaKH());
            ps.setInt(8, kh.getSieuthiId());
            
            // Thực thi câu lệnh SQL
            return ps.executeUpdate() > 0; // Nếu chèn thành công, trả về true
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Trả về false nếu có lỗi xảy ra
        }
    }
}

