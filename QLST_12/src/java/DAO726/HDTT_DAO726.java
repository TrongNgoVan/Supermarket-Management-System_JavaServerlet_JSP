


package DAO726;

/**
 *
 * @author Ngọ Văn Trọng
 */


import Entity726.HDTrucTiep726;
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
public class HDTT_DAO726 {
    private static Connection con;

    public HDTT_DAO726() throws Exception {
        DAO726 dao = new DAO726();
        con = dao.getConnection(); // Kiểm tra kết nối tại đây
        if (con == null) {
            System.err.println("Không thể kết nối đến cơ sở dữ liệu.");
        }
    }

    public List<HDTrucTiep726> getHDTT(int maKH, Date nbd,  Date nkt) {
        List<HDTrucTiep726> dshd = new ArrayList<>();
        String sql = "{CALL GetListHDTT726(?, ?, ?)}"; // Gọi stored procedure

        try (CallableStatement cstmt = con.prepareCall(sql)) {
            cstmt.setInt(1, maKH);      // Tham số đầu tiên là mã khách hàng
            cstmt.setDate(2, nbd);     // Tham số thứ hai là ngày bắt đầu
            cstmt.setDate(3, nkt);     // Tham số thứ ba là ngày kết thúc

            try (ResultSet rs = cstmt.executeQuery()) {
                while (rs.next()) {
                    HDTrucTiep726 hdtt = new HDTrucTiep726();
                    hdtt.setId(rs.getString("id"));
                    hdtt.setNgayMua(rs.getDate("ngayMua"));
               
                    hdtt.setTongTien(rs.getDouble("tongTien"));
                    hdtt.setMaNVBH(rs.getInt("maNVBH"));
                    hdtt.setMaKH(rs.getInt("maKH"));
                    dshd.add(hdtt);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Thao tác với exception trong sản phẩm thực tế
        }

        return dshd;
    }
}
