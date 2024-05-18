package model;

import java.util.Date;

public class ChiSoCongTo {
	private int id;
	private int chiSo;
	private Date ngay;
	private CongTo congTo;
	public ChiSoCongTo() {
		super();
	}
	public ChiSoCongTo(int id, int chiSo, Date ngay) {
		super();
		this.id = id;
		this.chiSo = chiSo;
		this.ngay = ngay;
	}
	public ChiSoCongTo(int chiSo, CongTo congTo) {
		this.chiSo = chiSo;
		this.ngay = new Date();
		this.congTo = congTo;
	}
	public ChiSoCongTo(int id, int chiSo, Date ngay, int idCongTo) throws Exception {
		super();
		this.id = id;
		this.chiSo = chiSo;
		this.ngay = ngay;
		this.congTo = new CongTo(idCongTo);
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getChiSo() {
		return chiSo;
	}
	public void setChiSo(int chiSo) {
		this.chiSo = chiSo;
	}
	public Date getNgay() {
		return ngay;
	}
	public void setNgay(Date ngay) {
		this.ngay = ngay;
	}
	public CongTo getCongTo() {
		return congTo;
	}
	public void setCongTo(CongTo congTo) {
		this.congTo = congTo;
	}
	
}
