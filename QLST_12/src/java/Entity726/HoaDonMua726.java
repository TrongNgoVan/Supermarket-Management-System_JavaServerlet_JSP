


package Entity726;

/**
 *
 * @author Ngọ Văn Trọng
 */
import java.util.Date;
import java.util.List;

public class HoaDonMua726 {
    private String id;
    private Date ngayMua;
    private String trangThai; // Trạng thái của hóa đơn (ví dụ: "Pending", "Completed")
    private double tongTien;
    private int maKH; // Khách hàng


    // Constructor, getter và setter
    public HoaDonMua726(String id, Date ngayMua, String trangThai, double tongTien, int kh) {
        this.id = id;
        this.ngayMua = ngayMua;
        this.trangThai = trangThai;
        this.tongTien = tongTien;
        this.maKH =  kh;
        
    }

    public HoaDonMua726() {
       
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public Date getNgayMua() { return ngayMua; }
    public void setNgayMua(Date ngayMua) { this.ngayMua = ngayMua; }

    public String getTrangThai() { return trangThai; }
    public void setTrangThai(String trangThai) { this.trangThai = trangThai; }

    public double getTongTien() { return tongTien; }
    public void setTongTien(double tongTien) { this.tongTien = tongTien; }

    public int getMaKH() { return maKH; }
    public void setMaKH(int kh) { this.maKH = kh; }

 
}
