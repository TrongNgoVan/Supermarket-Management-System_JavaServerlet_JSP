


package Entity726;

/**
 *
 * @author Ngọ Văn Trọng
 */


import java.sql.Date;

public class TKKH726 extends KhachHang_726 {
    private Date ngayBatDau;
    private Date ngayKetThuc;
    private double tongDT;

    public TKKH726() {}

    public TKKH726(int id, String hoTen, String sdt, String email, Date ngaySinh, String password, 
                String maKH, int sieuthiId, Date ngayBatDau, Date ngayKetThuc, double tongDT) {
        // Gọi constructor của lớp cha
        super(id, hoTen, sdt, email, ngaySinh, password, maKH, sieuthiId);
        this.ngayBatDau = ngayBatDau;
        this.ngayKetThuc = ngayKetThuc;
        this.tongDT = tongDT;
    }

    // Getter và setter cho ngayBatDau
    public Date getNgayBatDau() {
        return ngayBatDau;
    }

    public void setNgayBatDau(Date ngayBatDau) {
        this.ngayBatDau = ngayBatDau;
    }

    // Getter và setter cho ngayKetThuc
    public Date getNgayKetThuc() {
        return ngayKetThuc;
    }

    public void setNgayKetThuc(Date ngayKetThuc) {
        this.ngayKetThuc = ngayKetThuc;
    }

    // Getter và setter cho tongDoanhThu
    public double getTongDT() {
        return tongDT;
    }

    public void setTongDT(double tongDT) {
        this.tongDT = tongDT;
    }
}
