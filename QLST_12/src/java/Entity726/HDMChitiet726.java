


package Entity726;

/**
 *
 * @author Ngọ Văn Trọng
 */

public class HDMChitiet726 {
    private MatHang726 matHang;
    private int soLuong;
    private double gia;

    // Constructor, getter và setter
    public HDMChitiet726(MatHang726 matHang, int soLuong, double gia) {
        this.matHang = matHang;
        this.soLuong = soLuong;
        this.gia = gia;
    }

    public MatHang726 getMatHang() { return matHang; }
    public void setMatHang(MatHang726 matHang) { this.matHang = matHang; }

    public int getSoLuong() { return soLuong; }
    public void setSoLuong(int soLuong) { this.soLuong = soLuong; }

    public double getGia() { return gia; }
    public void setGia(double gia) { this.gia = gia; }
}
