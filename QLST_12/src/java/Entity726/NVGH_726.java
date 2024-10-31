


package Entity726;

/**
 *
 * @author Ngọ Văn Trọng
 */


import java.sql.Date;

public class NVGH_726 {
    private String id;
    private String hoTen;
    private String sdt;
    private String email;
    private String password;
    private Date ngaySinh;
    private String maNV;
    private String chucVu;
    private int sieuThiId;

    public NVGH_726() {}

    public NVGH_726(String id, String hoTen, String sdt, String email, String password, Date ngaySinh, String maNV, String chucVu, int sieuThiId) {
        this.id = id;
        this.hoTen = hoTen;
        this.sdt = sdt;
        this.email = email;
        this.password = password;
        this.ngaySinh = ngaySinh;
        this.maNV = maNV;
        this.chucVu = chucVu;
        this.sieuThiId = sieuThiId;
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

    public String getMaNV() { return maNV; }
    public void setMaNV(String maNV) { this.maNV = maNV; }

    public String getChucVu() { return chucVu; }
    public void setChucVu(String chucVu) { this.chucVu = chucVu; }

    public int getSieuThiId() { return sieuThiId; }
    public void setSieuThiId(int sieuThiId) { this.sieuThiId = sieuThiId; }
}

