package model;

import dao.GiaLuyTienDAO;

public class GiaLuyTien {
	private int id;
	private String loai;
	private int mucDuoi;
	private int mucTren;
	private int gia;
	public GiaLuyTien() {
		super();
	}
	public GiaLuyTien(int id) throws Exception{
		super();
		GiaLuyTien giaLuyTien = new GiaLuyTienDAO().layGiaLuyTienTheoId(id);
		this.id = giaLuyTien.getId();
		this.loai = giaLuyTien.getLoai();
		this.mucDuoi = giaLuyTien.getMucDuoi();
		this.mucTren = giaLuyTien.getMucTren();
		this.gia = giaLuyTien.getGia();
	}
	public GiaLuyTien(int id, String loai, int mucDuoi, int mucTren, int gia) {
		super();
		this.id = id;
		this.loai = loai;
		this.mucDuoi = mucDuoi;
		this.mucTren = mucTren;
		this.gia = gia;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLoai() {
		return loai;
	}
	public void setLoai(String loai) {
		this.loai = loai;
	}
	public int getMucDuoi() {
		return mucDuoi;
	}
	public void setMucDuoi(int mucDuoi) {
		this.mucDuoi = mucDuoi;
	}
	public int getMucTren() {
		return mucTren;
	}
	public void setMucTren(int mucTren) {
		this.mucTren = mucTren;
	}
	public int getGia() {
		return gia;
	}
	public void setGia(int gia) {
		this.gia = gia;
	}
	@Override
	public String toString() {
		return id + " " + loai + " " + mucDuoi + " " + mucTren + " " + gia;
	}
}
