package model;

import java.util.ArrayList;
import java.util.Date;

public class HoaDon {
	private int id;
	private Date ngay;
	private int tienPhong;
	private int tienDuNo;
	private int tongTienHoaDon;
	private String ghiChu;
	private Phong phong;
	private ArrayList<TieuThu> dsTieuThu;
	private ArrayList<DichVuHoaDon> dsDichVuHoaDon;
	
	public HoaDon() {
		super();
		this.ngay = new Date();
	}
	public HoaDon(Phong phong, ArrayList<DichVuHoaDon> dsDichVuHoaDon, String ghiChu) {
		super();
		this.phong = phong;
		this.dsDichVuHoaDon = dsDichVuHoaDon;
		this.ngay = new Date();
		this.tienPhong = phong.getGiaPhong();
		this.tienDuNo = phong.getDuNo();
		this.ghiChu = ghiChu;
		this.dsTieuThu = new ArrayList<>();
		for(CongTo congTo : phong.getDsCongTo()) {
			ArrayList<ChiSoTieuThu> listChiSoTieuThu = new ArrayList<>();
			
			listChiSoTieuThu.add(new ChiSoTieuThu(congTo.getChiSoCongToMoi()));
			listChiSoTieuThu.add(new ChiSoTieuThu(congTo.getChiSoCongToCu()));		
			TieuThu tieuThu = new TieuThu(listChiSoTieuThu);
			this.dsTieuThu.add(tieuThu);
		}
		this.tongTienHoaDon = tienPhong;
		for(DichVuHoaDon dichVuHoaDon : dsDichVuHoaDon) {
			tongTienHoaDon += dichVuHoaDon.getThanhTien();
		}
		for(TieuThu tieuThu : dsTieuThu) {
			tongTienHoaDon += tieuThu.getThanhTien();
		}
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getNgay() {
		return ngay;
	}
	public void setNgay(Date ngay) {
		this.ngay = ngay;
	}
	public int getTienPhong() {
		return tienPhong;
	}
	public void setTienPhong(int tienPhong) {
		this.tienPhong = tienPhong;
		if(this.tongTienHoaDon == 0) this.tongTienHoaDon = tienPhong;
	}
	public int getTienDuNo() {
		return tienDuNo;
	}
	public void setTienDuNo(int tienDuNo) {
		this.tienDuNo = tienDuNo;
	}
	public int getTongTienHoaDon() {
		return tongTienHoaDon;
	}
	public void setTongTienHoaDon(int tongTienHoaDon) {
		this.tongTienHoaDon = tongTienHoaDon;
	}
	public String getGhiChu() {
		return (ghiChu == null) ? "" : ghiChu;
	}
	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}
	public Phong getPhong() {
		return phong;
	}
	public void setPhong(Phong phong) {
		this.phong = phong;
	}
	public ArrayList<TieuThu> getDsTieuThu() {
		return dsTieuThu;
	}
	public void setDsTieuThu(ArrayList<TieuThu> dsTieuThu) {
		this.dsTieuThu = dsTieuThu;
		for(TieuThu tieuThu : dsTieuThu) {
			tongTienHoaDon += tieuThu.getThanhTien();		
		}
	}
	public ArrayList<DichVuHoaDon> getDsDichVuHoaDon() {
		return dsDichVuHoaDon;
	}
	public void setDsDichVuHoaDon(ArrayList<DichVuHoaDon> dsDichVuHoaDon) {
		this.dsDichVuHoaDon = dsDichVuHoaDon;
		for(DichVuHoaDon dichVuHoaDon : dsDichVuHoaDon) {
			tongTienHoaDon += dichVuHoaDon.getThanhTien();
		}
	}
	
}
