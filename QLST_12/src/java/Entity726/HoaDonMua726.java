


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
    private KhachHang_726 kh; // Khách hàng
    private List<HDMChitiet726> chiTiet; // Chi tiết các mặt hàng trong hóa đơn

    // Constructor, getter và setter
    public HoaDonMua726(String id, Date ngayMua, String trangThai, double tongTien, KhachHang_726 kh, List<HDMChitiet726> chiTiet) {
        this.id = id;
        this.ngayMua = ngayMua;
        this.trangThai = trangThai;
        this.tongTien = tongTien;
        this.kh = kh;
        this.chiTiet = chiTiet;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public Date getNgayMua() { return ngayMua; }
    public void setNgayMua(Date ngayMua) { this.ngayMua = ngayMua; }

    public String getTrangThai() { return trangThai; }
    public void setTrangThai(String trangThai) { this.trangThai = trangThai; }

    public double getTongTien() { return tongTien; }
    public void setTongTien(double tongTien) { this.tongTien = tongTien; }

    public KhachHang_726 getKh() { return kh; }
    public void setKh(KhachHang_726 kh) { this.kh = kh; }

    public List<HDMChitiet726> getChiTiet() { return chiTiet; }
    public void setChiTiet(List<HDMChitiet726> chiTiet) { this.chiTiet = chiTiet; }
}
