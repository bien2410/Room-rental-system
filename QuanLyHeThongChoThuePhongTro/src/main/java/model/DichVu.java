package model;

import dao.DichVuDAO;

public class DichVu {
	private int id;
	private String ten;
	private String moTa;
	private int gia;
	public DichVu() {
		super();
	}
	public DichVu(int id)throws Exception{
		super();
		DichVu dichVu = new DichVuDAO().layDichVu(id);
		this.id = dichVu.getId();
		this.ten = dichVu.getTen();
		this.moTa = dichVu.getMoTa();
		this.gia = dichVu.getGia();
	}
	public DichVu(int id, String ten, String moTa, int gia) {
		super();
		this.id = id;
		this.ten = ten;
		this.moTa = moTa;
		this.gia = gia;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTen() {
		return ten;
	}
	public void setTen(String ten) {
		this.ten = ten;
	}
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	public int getGia() {
		return gia;
	}
	public void setGia(int gia) {
		this.gia = gia;
	}
	@Override
	public String toString() {
		return id + " " + ten + " " + moTa + " " + gia;
	}
}
