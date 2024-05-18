package model;

import java.util.ArrayList;

public class PhongTK extends Phong implements Comparable<PhongTK>{
	private int soThangLapDay;
	private int doanhThu;
	private ArrayList<HoaDon> dsHoaDon;
	public PhongTK() {
		super();
	}

	public PhongTK(int id) {
		super();
		this.setId(id);
	}
	
	public int getSoThangLapDay() {
		return soThangLapDay;
	}
	public void setSoThangLapDay(int soThangLapDay) {
		this.soThangLapDay = soThangLapDay;
	}
	public int getDoanhThu() {
		return doanhThu;
	}
	public void setDoanhThu(int doanhThu) {
		this.doanhThu = doanhThu;
	}

	public ArrayList<HoaDon> getDsHoaDon() {
		return dsHoaDon;
	}

	public void setDsHoaDon(ArrayList<HoaDon> dsHoaDon) {
		this.dsHoaDon = dsHoaDon;
		this.soThangLapDay = dsHoaDon.size();
		this.doanhThu = 0;
		for(HoaDon hoaDon : dsHoaDon) {
			this.doanhThu += hoaDon.getTongTienHoaDon();
		}
	}

	@Override
	public int compareTo(PhongTK o) {
		if(this.doanhThu > o.doanhThu) return -1;
		if(this.doanhThu < o.doanhThu) return 1;
		return 0;
	}
	
}
