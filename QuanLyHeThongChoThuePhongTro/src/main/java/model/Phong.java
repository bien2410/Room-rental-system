package model;

import java.util.ArrayList;

public class Phong {
	private int id;
	private int soPhong;
	private float dienTich;
	private int giaPhong;
	private boolean trangThai;
	private String moTa;
	private int tienCoc;
	private int duNo;
	private ArrayList<CongTo> dsCongTo;
	public Phong() {
		super();
		this.dsCongTo = new ArrayList<>();
	}
	public Phong(int id) {
		super();
		this.id = id;
	}
	public Phong(int id, int soPhong, float dienTich, int giaPhong, boolean trangThai, String moTa, int tienCoc,
			int duNo) {
		super();
		this.id = id;
		this.soPhong = soPhong;
		this.dienTich = dienTich;
		this.giaPhong = giaPhong;
		this.trangThai = trangThai;
		this.moTa = moTa;
		this.tienCoc = tienCoc;
		this.duNo = duNo;
		this.dsCongTo = new ArrayList<>();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSoPhong() {
		return soPhong;
	}
	public void setSoPhong(int soPhong) {
		this.soPhong = soPhong;
	}
	public float getDienTich() {
		return dienTich;
	}
	public void setDienTich(float dienTich) {
		this.dienTich = dienTich;
	}
	public int getGiaPhong() {
		return giaPhong;
	}
	public void setGiaPhong(int giaPhong) {
		this.giaPhong = giaPhong;
	}
	public int getTrangThai() {
		return (trangThai) ? 1 : 0;
	}
	public void setTrangThai(int trangThai) {
		this.trangThai = (trangThai == 1) ? true : false;
	}
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	public int getTienCoc() {
		return tienCoc;
	}
	public void setTienCoc(int tienCoc) {
		this.tienCoc = tienCoc;
	}
	public int getDuNo() {
		return duNo;
	}
	public void setDuNo(int duNo) {
		this.duNo = duNo;
	}
	public ArrayList<CongTo> getDsCongTo() {
		return dsCongTo;
	}
	public void addCongTo(CongTo congTo) {
		this.dsCongTo.add(congTo);
	}
	public void setDsCongTo(ArrayList<CongTo> dsCongTo) {
		this.dsCongTo = dsCongTo;
	}
	@Override
	public String toString() {
		return id + " " + soPhong + " " + dienTich + " " + giaPhong + " " + trangThai + " " + moTa + " " + tienCoc + " " + duNo;
	}
}
