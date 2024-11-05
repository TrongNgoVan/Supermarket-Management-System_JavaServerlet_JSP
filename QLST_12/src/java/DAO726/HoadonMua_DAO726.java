package DAO726;

import Entity726.HoaDonMua726;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ngọ Văn Trọng
 */
public class HoadonMua_DAO726 {
    private static Connection con;

    public HoadonMua_DAO726() throws Exception {
        DAO726 dao = new DAO726();
        con = dao.getConnection(); // Kiểm tra kết nối tại đây
        if (con == null) {
            System.err.println("Không thể kết nối đến cơ sở dữ liệu.");
        }
    }

    public List<HoaDonMua726> getHDM(int maKH, Date nbd,  Date nkt) {
        List<HoaDonMua726> dshd = new ArrayList<>();
        String sql = "{CALL GETLISTHDM(?, ?, ?)}"; // Gọi stored procedure

        try (CallableStatement cstmt = con.prepareCall(sql)) {
            cstmt.setInt(1, maKH);      // Tham số đầu tiên là mã khách hàng
            cstmt.setDate(2, nbd);     // Tham số thứ hai là ngày bắt đầu
            cstmt.setDate(3, nkt);     // Tham số thứ ba là ngày kết thúc

            try (ResultSet rs = cstmt.executeQuery()) {
                while (rs.next()) {
                    HoaDonMua726 hdm = new HoaDonMua726();
                    hdm.setId(rs.getString("MaHD"));
                    hdm.setNgayMua(rs.getDate("NgayMua"));
                    hdm.setTrangThai(rs.getString("TrangThai"));
                    hdm.setTongTien(rs.getDouble("TongTien"));
                    hdm.setMaKH(rs.getInt("IDKH"));
                    dshd.add(hdm);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Thao tác với exception trong sản phẩm thực tế
        }

        return dshd;
    }
}
