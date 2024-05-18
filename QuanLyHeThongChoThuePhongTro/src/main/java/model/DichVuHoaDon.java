package model;

public class DichVuHoaDon{
	private int id;
	private int soLuong;
	private int gia;
	private int thanhTien;
	private DichVu dichVu;
	public DichVuHoaDon() {
		super();
	}
	
	public DichVuHoaDon(int id, int soLuong, DichVu dichVu) {
		super();
		this.id = id;
		this.soLuong = soLuong;
		this.gia = dichVu.getGia();
		this.thanhTien = this.soLuong * this.gia;
		this.dichVu = dichVu;
	}
	public DichVuHoaDon(int id, int soLuong, int gia, DichVu dichVu) {
		super();
		this.id = id;
		this.soLuong = soLuong;
		this.gia = gia;
		this.thanhTien = this.soLuong * this.gia;
		this.dichVu = dichVu;
	}
	public DichVuHoaDon(DichVu dichVu, int soLuong) {
		super();
		this.soLuong = soLuong;
		this.gia = dichVu.getGia();
		this.thanhTien = soLuong * gia;
		this.dichVu = dichVu;
	}
	public DichVuHoaDon(int id, int soLuong, int gia, int idDichVu) throws Exception {
		super();
		this.id = id;
		this.soLuong = soLuong;
		this.gia = gia;
		this.thanhTien = this.soLuong * this.gia;
		this.dichVu = new DichVu(idDichVu);
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
		this.thanhTien = soLuong * gia;
	}
	public int getGia() {
		return gia;
	}
	public void setGia(int gia) {
		this.gia = gia;
		this.thanhTien = soLuong * gia;
	}
	public DichVu getDichVu() {
		return dichVu;
	}
	public void setDichVu(DichVu dichVu) {
		this.dichVu = dichVu;
	}
	public int getThanhTien() {
		return thanhTien;
	}
	public void setThanhTien(int thanhTien) {
		this.thanhTien = thanhTien;
	}
	@Override
	public String toString() {
		return id + " " + soLuong + " " + gia + "\n" + dichVu;
	}

}
