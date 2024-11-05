package DAO726;

import Entity726.TKKH726;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ngọ Văn Trọng
 */
public class TKKH_DAO726 {

    private static Connection con;

    public TKKH_DAO726() throws Exception {
        DAO726 dao = new DAO726();
        con = dao.getConnection(); // Kiểm tra kết nối tại đây
        if (con == null) {
            System.err.println("Không thể kết nối đến cơ sở dữ liệu.");
        }
    }

    // Method to get customer statistics using a stored procedure
    public List<TKKH726> getTKKH(String nbd, String nkt) {
        List<TKKH726> ListTKKH = new ArrayList<>();
        String sql = "{CALL TKKH726(?, ?)}"; // Replace with your actual stored procedure name

        try (CallableStatement cstmt = con.prepareCall(sql)) {
            // Convert String dates to java.sql.Date
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date startDate = new Date(format.parse(nbd).getTime());
            Date endDate = new Date(format.parse(nkt).getTime());

            // Set dates in the stored procedure call
            cstmt.setDate(1, startDate);
            cstmt.setDate(2, endDate);

            try (ResultSet rs = cstmt.executeQuery()) {
                while (rs.next()) {
                    TKKH726 tkkh = new TKKH726();
                    tkkh.setId(rs.getInt("KhachHangID"));
                    tkkh.setMaKH(rs.getString("MaKhachHang")); 
                    tkkh.setHoTen(rs.getString("TenKhachHang"));
                    tkkh.setTongDT(rs.getDouble("TongDoanhThu")); 

                    // Set ngayBatDau and ngayKetThuc fields
                    tkkh.setNgayBatDau(startDate);
                    tkkh.setNgayKetThuc(endDate);

                    ListTKKH.add(tkkh);
                }
            }
        } catch (SQLException | ParseException e) {
            e.printStackTrace(); // Handle exceptions properly in production code
        }

        return ListTKKH;
    }
    public static void main(String[] args) {
        try {
            TKKH_DAO726 tkkhDao = new TKKH_DAO726();
            String startDate = "2024-10-01"; // Set a test start date
            String endDate = "2024-10-31"; // Set a test end date

            // Retrieve customer statistics
            List<TKKH726> resultList = tkkhDao.getTKKH(startDate, endDate);

            // Check if data was returned and display it
            if (resultList != null && !resultList.isEmpty()) {
                for (TKKH726 record : resultList) {
                    System.out.println("ID: " + record.getId());
                    System.out.println("Mã KH: " + record.getMaKH());
                    System.out.println("Tên KH: " + record.getHoTen());
                    System.out.println("Tổng Doanh Thu: " + record.getTongDT());
                    System.out.println("-------------------------");
                }
            } else {
                System.out.println("Không có dữ liệu thống kê cho khoảng thời gian này.");
            }
        } catch (Exception e) {
            System.err.println("Đã xảy ra lỗi khi thực hiện kiểm tra: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
