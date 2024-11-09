


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
    private int maNVBH; // Nhân viên bán hàng
    private int maKH; // Khách hàng


    // Constructor, getter và setter
    
    public HDTrucTiep726() {
       
    }
    public HDTrucTiep726(String id, Date ngayMua, double tongTien, int maNVBH, int maKH) {
        this.id = id;
        this.ngayMua = ngayMua;
        this.tongTien = tongTien;
        this.maNVBH  = maNVBH;
        this.maKH = maKH;
      
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public Date getNgayMua() { return ngayMua; }
    public void setNgayMua(Date ngayMua) { this.ngayMua = ngayMua; }

    public double getTongTien() { return tongTien; }
    public void setTongTien(double tongTien) { this.tongTien = tongTien; }
    
    
    public int getMaNVBH() { return maNVBH; }
    public void setMaNVBH(int maNVBH) { this.maNVBH = maNVBH; }
    
    public int getMaKH() { return maKH; }
    public void setMaKH(int maKH) { this.maKH = maKH; }
  

  
}

