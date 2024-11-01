package DAO726;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Entity726.KhachHang_726;
import java.sql.Date;
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

    public static boolean addKH(KhachHang_726 kh) {
        if (con == null) {
            System.err.println("Kết nối cơ sở dữ liệu là null.");
            return false; // Không thể thêm khách hàng nếu không có kết nối
        }
        
        String sql = "INSERT INTO khachhang_726 (hoTen, sdt, email, ngaySinh, password) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, kh.getHoTen());
            ps.setString(2, kh.getSdt());
            ps.setString(3, kh.getEmail());
            ps.setDate(4, kh.getNgaySinh());
            ps.setString(5, kh.getPassword());

            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int id = generatedKeys.getInt(1);
                        String maKH = "KH" + id;
                        updateMaKH(id, maKH);
                        return true;
                    } else {
                        return false;
                    }
                }
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.err.println("SQL State: " + e.getSQLState());
            System.err.println("Error Code: " + e.getErrorCode());
            e.printStackTrace();
            return false;
        }
    }

    private static void updateMaKH(int id, String maKH) {
        String sql = "UPDATE khachhang_726 SET maKH = ? WHERE id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, maKH);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
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
            khachHang.setMaKH(rs.getString("maKH"));
            khachHang.setPassword(rs.getString("password"));
            // Thêm các thuộc tính khác nếu cần
            
            return khachHang; // Trả về đối tượng người dùng
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return null; // Nếu không tìm thấy hoặc có lỗi, trả về null
}




    public static void main(String[] args) throws Exception {
        String username = "t";
        String sdt = "0904708498";
        String email = "ngovantrong1308@gmail.com";
        String dob = "13/08/2003"; // Định dạng dd/MM/yyyy
        String password = "123";
        String repass = "123";

        if (username.isEmpty() || sdt.isEmpty() || email.isEmpty() || dob.isEmpty() || password.isEmpty() || repass.isEmpty()) {
            System.out.println("Vui lòng điền đầy đủ thông tin.");
        } else {
            KhachHang_726 khachHang = new KhachHang_726();
            khachHang.setHoTen(username);
            khachHang.setSdt(sdt);
            khachHang.setEmail(email);
            try {
                SimpleDateFormat inputFormat = new SimpleDateFormat("dd/MM/yyyy");
                java.util.Date parsedDate = inputFormat.parse(dob);
                Date sqlDate = new Date(parsedDate.getTime());
                khachHang.setNgaySinh(sqlDate);
            } catch (ParseException e) {
                e.printStackTrace();
                return;
            }
            khachHang.setPassword(password);

            KH_DAO726 khDao = new KH_DAO726();
            boolean isRegistered = khDao.addKH(khachHang);
            System.out.println(isRegistered ? "Đăng ký thành công." : "Đăng ký thất bại.");
        }
    }
    
    
}
