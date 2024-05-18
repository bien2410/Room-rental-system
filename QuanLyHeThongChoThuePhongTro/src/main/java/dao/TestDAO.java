package dao;

import java.util.ArrayList;

import model.CongTo;
import model.DichVu;
import model.DichVuHoaDon;
import model.GiaLuyTien;
import model.HoaDon;
import model.Phong;
import model.PhongTK;

public class TestDAO {
	public static void main(String[] args) {
//		ArrayList<Phong> listPhong = new PhongDAO().timKiemPhong(2, 3300000);
//		for(Phong p : listPhong) {
//			System.out.println(p);
//		}
//		Phong p = new Phong();
////		p.setId(4);
//		p.setSoPhong(207);
//		p.setDienTich(24.2f);
//		p.setGiaPhong(3000);
//		p.setTrangThai(0);
//		p.setTienCoc(0);
//		p.setDuNo(0);
//		System.out.println(new PhongDAO().themPhong(p));
//		System.out.println(new PhongDAO().luuPhong(p));
//		System.out.println(new PhongDAO().xoaPhong(4));
//		ArrayList<DichVuHoaDon> listDichVuHoaDon = new DichVuHoaDonDAO().layDichVuThangTruoc(1);
//		for(DichVuHoaDon dvhd : listDichVuHoaDon) {
//			System.out.println(dvhd);
//		}
//		ArrayList<DichVu> listDichVu = new DichVuDAO().timKiemDichVu("");
//		for(DichVu dv : listDichVu) {
//			System.out.println(dv);
//		}
//		ArrayList<CongTo> listCongTo = new CongToDAO().layCongToPhong(1);
//		for(CongTo ct : listCongTo) {
//			System.out.println(ct);
//		}
//		ArrayList<DichVuHoaDon> listDichVuHoaDon = new DichVuHoaDonDAO().layDichVuThangTruoc(1);
//		for(DichVuHoaDon dvhd : listDichVuHoaDon) {
//			System.out.println(dvhd);
//		}
//		ArrayList<GiaLuyTien> listGiaLuyTien = new GiaLuyTienDAO().layGiaLuyTien("nuoc");
//		for(GiaLuyTien glt : listGiaLuyTien) {
//			System.out.println(glt);
//		}
//		HoaDon hoaDon = new HoaDon();
//		hoaDon.setPhong(new Phong());
//		System.out.println(new HoaDonDAO().luuHoaDon(hoaDon));
		try {
			ArrayList<PhongTK> listPhongTK = new PhongTKDAO().thongKePhong("", "", "", "");
			System.out.println("---------------------------");
			System.out.println(listPhongTK.get(0).getDoanhThu());
		}
		catch (Exception e) {
			System.out.println("Vui lòng nhập đúng thông tin thống kê");
		}
	}
}
