package model;

public class LuyTienChiTiet {
	private int id;
	private int soLuong;
	private int gia;
	private int thanhTien;
	private GiaLuyTien giaLuyTien;
	public LuyTienChiTiet() {
		super();
	}
	
	public LuyTienChiTiet(int id, int soLuong, GiaLuyTien giaLuyTien) {
		super();
		this.id = id;
		this.soLuong = soLuong;
		this.gia = giaLuyTien.getGia();
		this.thanhTien = this.soLuong * this.gia;
		this.giaLuyTien = giaLuyTien;
	}
	public LuyTienChiTiet(int soLuong, GiaLuyTien giaLuyTien) {
		super();
		this.soLuong = soLuong;
		this.gia = giaLuyTien.getGia();
		this.thanhTien = this.soLuong * this.gia;
		this.giaLuyTien = giaLuyTien;
	}
	public LuyTienChiTiet(int id, int gia, int idGiaLuyTien) throws Exception {
		super();
		this.id = id;
		this.gia = gia;
		this.thanhTien = this.soLuong * this.gia;
		this.giaLuyTien = new GiaLuyTien(idGiaLuyTien);
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
		this.thanhTien = this.soLuong * this.gia;
	}
	public int getGia() {
		return gia;
	}
	public void setGia(int gia) {
		this.gia = gia;
		this.thanhTien = this.soLuong * this.gia;
	}
	public int getThanhTien() {
		return thanhTien;
	}
	public void setThanhTien(int thanhTien) {
		this.thanhTien = thanhTien;
	}
	public GiaLuyTien getGiaLuyTien() {
		return giaLuyTien;
	}
	public void setGiaLuyTien(GiaLuyTien giaLuyTien) {
		this.giaLuyTien = giaLuyTien;
	}
	
}
