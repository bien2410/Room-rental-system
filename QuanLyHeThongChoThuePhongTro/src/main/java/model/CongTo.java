package model;

import java.util.ArrayList;

import dao.ChiSoCongToDAO;
import dao.CongToDAO;

public class CongTo {
	private int id;
	private String ten;
	private String loai;
	private ChiSoCongTo chiSoCongToCu;
	private ChiSoCongTo chiSoCongToMoi;
	public CongTo() {
		super();
	}
	public CongTo(int id, String ten, String loai) {
		super();
		this.id = id;
		this.ten = ten;
		this.loai = loai;		
		chiSoCongToCu = new ChiSoCongToDAO().layChiSoTheoCongTo(id);
	}
	public CongTo(int id) throws Exception{
		super();
		CongTo congTo = new CongToDAO().layCongToTheoId(id);
		this.id = congTo.getId();
		this.ten = congTo.getTen();
		this.loai = congTo.getLoai();
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
	public String getLoai() {
		return loai;
	}
	public void setLoai(String loai) {
		this.loai = loai;
	}
	public ChiSoCongTo getChiSoCongToCu() {
		return chiSoCongToCu;
	}
	public void setChiSoCongToCu(ChiSoCongTo chiSoCongToCu) {
		this.chiSoCongToCu = chiSoCongToCu;
	}
	public ChiSoCongTo getChiSoCongToMoi() {
		return chiSoCongToMoi;
	}
	public void setChiSoCongToMoi(ChiSoCongTo chiSoCongToMoi) {
		this.chiSoCongToMoi = chiSoCongToMoi;
	}
	@Override
	public String toString() {
		return id + " " + ten + " " + loai + "\n" + chiSoCongToCu.getId() + " " + chiSoCongToCu.getChiSo() + " " + chiSoCongToCu.getNgay();
	}
}
