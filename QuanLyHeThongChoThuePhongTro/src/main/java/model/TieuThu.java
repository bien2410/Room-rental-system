package model;

import java.util.ArrayList;

import dao.GiaLuyTienDAO;

public class TieuThu implements Comparable<TieuThu>{
	private int id;
	private int soLuongTieuThu;
	private int thanhTien;
	private ArrayList<ChiSoTieuThu> dsChiSoTieuThu;
	private ArrayList<LuyTienChiTiet> dsLuyTienChiTiet;
	
	public TieuThu() {
		super();
	}
	public TieuThu(ArrayList<ChiSoTieuThu> dsChiSoTieuThu) {
		super();
		this.dsChiSoTieuThu = dsChiSoTieuThu;
		this.soLuongTieuThu = Math.abs(dsChiSoTieuThu.get(0).getChiSoCongTo().getChiSo() - dsChiSoTieuThu.get(1).getChiSoCongTo().getChiSo());
		ArrayList<GiaLuyTien> listGiaLuyTien = new GiaLuyTienDAO().layGiaLuyTien(dsChiSoTieuThu.get(0).getChiSoCongTo().getCongTo().getLoai());
		this.dsLuyTienChiTiet = new ArrayList<>();
		this.thanhTien = 0;
		for(GiaLuyTien giaLuyTien : listGiaLuyTien) {
			if(soLuongTieuThu < giaLuyTien.getMucTren() || giaLuyTien.getMucTren() == 0) {
				int sl = soLuongTieuThu - giaLuyTien.getMucDuoi() + 1;
				dsLuyTienChiTiet.add(new LuyTienChiTiet(sl, giaLuyTien));
				break;
			}
			else{
				int sl = giaLuyTien.getMucTren() - giaLuyTien.getMucDuoi() + 1;
				dsLuyTienChiTiet.add(new LuyTienChiTiet(sl, giaLuyTien));
			}
		}
		for(LuyTienChiTiet luyTienChiTiet : dsLuyTienChiTiet) {
			thanhTien += luyTienChiTiet.getThanhTien();
		}
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSoLuongTieuThu() {
		return soLuongTieuThu;
	}
	public void setSoLuongTieuThu(int soLuongTieuThu) {
		this.soLuongTieuThu = soLuongTieuThu;
	}
	public int getThanhTien() {
		return thanhTien;
	}
	public void setThanhTien(int thanhTien) {
		this.thanhTien = thanhTien;
	}
	public ArrayList<ChiSoTieuThu> getDsChiSoTieuThu() {
		return dsChiSoTieuThu;
	}
	public void setDsChiSoTieuThu(ArrayList<ChiSoTieuThu> dsChiSoTieuThu) {
		this.dsChiSoTieuThu = dsChiSoTieuThu;
		this.soLuongTieuThu = Math.abs(dsChiSoTieuThu.get(0).getChiSoCongTo().getChiSo() - dsChiSoTieuThu.get(1).getChiSoCongTo().getChiSo());
	}
	public ArrayList<LuyTienChiTiet> getDsLuyTienChiTiet() {
		return dsLuyTienChiTiet;
	}
	public void setDsLuyTienChiTiet(ArrayList<LuyTienChiTiet> dsLuyTienChiTiet) {
		this.dsLuyTienChiTiet = dsLuyTienChiTiet;
		for(LuyTienChiTiet luyTienChiTiet : dsLuyTienChiTiet) {
			if(soLuongTieuThu < luyTienChiTiet.getGiaLuyTien().getMucTren() || luyTienChiTiet.getGiaLuyTien().getMucTren() == 0) {
				int sl = soLuongTieuThu - luyTienChiTiet.getGiaLuyTien().getMucDuoi() + 1;
				luyTienChiTiet.setSoLuong(sl);
				break;
			}
			else{
				int sl = luyTienChiTiet.getGiaLuyTien().getMucTren() - luyTienChiTiet.getGiaLuyTien().getMucDuoi() + 1;
				luyTienChiTiet.setSoLuong(sl);
			}
		}
		this.thanhTien = 0;
		for(LuyTienChiTiet luyTienChiTiet : dsLuyTienChiTiet) {
			thanhTien += luyTienChiTiet.getThanhTien();
		}		
	}
	@Override
	public int compareTo(TieuThu o) {
		if(this.getDsChiSoTieuThu().get(0).getChiSoCongTo().getCongTo().getLoai().equals("dien") && o.getDsChiSoTieuThu().get(0).getChiSoCongTo().getCongTo().getLoai().equals("nuoc")) return -1;
		if(o.getDsChiSoTieuThu().get(0).getChiSoCongTo().getCongTo().getLoai().equals("dien") && this.getDsChiSoTieuThu().get(0).getChiSoCongTo().getCongTo().getLoai().equals("nuoc")) return 1;
		int tmp = this.getDsChiSoTieuThu().get(0).getChiSoCongTo().getCongTo().getTen().compareTo(o.getDsChiSoTieuThu().get(0).getChiSoCongTo().getCongTo().getTen());
		if(tmp > 0) return 1;
		if(tmp < 0) return -1;
		return 0;
	}
	
}
