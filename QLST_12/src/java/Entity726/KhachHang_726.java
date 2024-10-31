


package Entity726;

/**
 *
 * @author Ngọ Văn Trọng
 */


import java.sql.Date;

public class KhachHang_726 {
    private String id;
    private String hoTen;
    private String sdt;
    private String email;  
    private Date ngaySinh;
    private String password;
    private String maKH;
    private int sieuthiId;

    public KhachHang_726() {}

    public KhachHang_726(String id, String hoTen, String sdt, String email, Date ngaySinh, String password, String maKH, int sieuthiId) {
        this.id = id;
        this.hoTen = hoTen;
        this.sdt = sdt;
        this.email = email;
        this.ngaySinh = ngaySinh;
        this.password = password;
        this.maKH = maKH;
        this.sieuthiId = sieuthiId;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getHoTen() { return hoTen; }
    public void setHoTen(String hoTen) { this.hoTen = hoTen; }

    public String getSdt() { return sdt; }
    public void setSdt(String sdt) { this.sdt = sdt; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public Date getNgaySinh() { return ngaySinh; }
    public void setNgaySinh(Date ngaySinh) { this.ngaySinh = ngaySinh; }

    public String getMaKH() { return maKH; }
    public void setMaNV(String maNV) { this.maKH = maKH; }



    public int getSieuthiId() { return sieuthiId; }
    public void setSieuthiId(int sieuThiId) { this.sieuthiId = sieuthiId; }
}
