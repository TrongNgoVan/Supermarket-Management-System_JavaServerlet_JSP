


package Entity726;

/**
 *
 * @author Ngọ Văn Trọng
 */
import java.util.Date;
import java.util.List;

public class HDTrucTiep726 {
    private String id;
    private Date ngayMua;
    private double tongTien;
    private NVBH_726 nvBH; // Nhân viên bán hàng
    private KhachHang_726 kh; // Khách hàng
    private List<HDTTChitiet726> chiTiet; // Chi tiết các mặt hàng trong hóa đơn

    // Constructor, getter và setter
    public HDTrucTiep726(String id, Date ngayMua, double tongTien, NVBH_726 nvBH, KhachHang_726 kh, List<HDTTChitiet726> chiTiet) {
        this.id = id;
        this.ngayMua = ngayMua;
        this.tongTien = tongTien;
        this.nvBH = nvBH;
        this.kh = kh;
        this.chiTiet = chiTiet;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public Date getNgayMua() { return ngayMua; }
    public void setNgayMua(Date ngayMua) { this.ngayMua = ngayMua; }

    public double getTongTien() { return tongTien; }
    public void setTongTien(double tongTien) { this.tongTien = tongTien; }

    public NVBH_726 getNvBH() { return nvBH; }
    public void setNvBH(NVBH_726 nvBH) { this.nvBH = nvBH; }

    public KhachHang_726 getKh() { return kh; }
    public void setKh(KhachHang_726 kh) { this.kh = kh; }

    public List<HDTTChitiet726> getChiTiet() { return chiTiet; }
    public void setChiTiet(List<HDTTChitiet726> chiTiet) { this.chiTiet = chiTiet; }
}

