package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;

import model.ChiSoCongTo;
import model.ChiSoTieuThu;
import model.DichVuHoaDon;
import model.HoaDon;
import model.LuyTienChiTiet;
import model.Phong;
import model.PhongTK;
import model.TieuThu;

public class PhongTKDAO extends DAO{
	public ArrayList<PhongTK> thongKePhong(String bd, String kt, String tt, String td) throws ParseException{
		Date ngayBd = null;
		if(!bd.equals("")) ngayBd = new SimpleDateFormat("dd-MM-yyyy").parse(bd);
		Date ngayKt = null;
		if(!kt.equals("")) ngayKt = new SimpleDateFormat("dd-MM-yyyy").parse(kt);
		int toiThieu = (tt.trim().equals("")) ? 0 : Integer.parseInt(tt);
		int toiDa = (td.trim().equals("")) ? -1 : Integer.parseInt(td);
		ArrayList<PhongTK> result = new ArrayList<>();	
		ArrayList<PhongTK> listPhongTK = new ArrayList<>();
		String layIdPhong = "SELECT id, soPhong FROM tblphong";
		String layHoaDon0 = "SELECT * FROM tblhoadon WHERE tblPhongid = ? ORDER BY ngay DESC";
		String layHoaDon1 = "SELECT * FROM tblhoadon WHERE tblPhongid = ? and ngay >= ? ORDER BY ngay DESC";
		String layHoaDon2 = "SELECT * FROM tblhoadon WHERE tblPhongid = ? and ngay <= ? ORDER BY ngay DESC";
		String layHoaDon3 = "SELECT * FROM tblhoadon WHERE tblPhongid = ? and ngay >= ? and ngay <= ? ORDER BY ngay DESC";
		String layDichVuHoaDon = "SELECT * FROM tbldichvuhoadon WHERE tblHoaDonid = ?";
		String layTieuThu = "SELECT * FROM tbltieuthu WHERE tblHoaDonid = ?";
		String layChiSoTieuThu = "SELECT * FROM tblchisotieuthu WHERE tblTieuThuid = ?";
		String layChiSoCongTo = "SELECT * FROM tblchisocongto WHERE id = ?";
		String layLuyTienChiTiet = "SELECT * FROM tblluytienchitiet WHERE tblTieuThuid = ?";
		try {
			PreparedStatement ps = con.prepareStatement(layIdPhong);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				PhongTK phongTK = new PhongTK();
				phongTK.setId(rs.getInt("id"));
				phongTK.setSoPhong(rs.getInt("soPhong"));
				listPhongTK.add(phongTK);
			}
			if(ngayBd == null && ngayKt == null) {
				ps = con.prepareStatement(layHoaDon0);
			}
			if(ngayBd != null && ngayKt == null) {
				ps = con.prepareStatement(layHoaDon1);
				ps.setDate(2, new java.sql.Date(ngayBd.getTime()));
			}
			if(ngayBd == null && ngayKt != null) {
				ps = con.prepareStatement(layHoaDon2);
				ps.setDate(2, new java.sql.Date(ngayKt.getTime()));
			}
			if(ngayBd != null && ngayKt != null) {
				ps = con.prepareStatement(layHoaDon3);
				ps.setDate(2, new java.sql.Date(ngayBd.getTime()));
				ps.setDate(3, new java.sql.Date(ngayKt.getTime()));
			}
			for(PhongTK p : listPhongTK) {
				Phong phong = new Phong();
				phong.setSoPhong(p.getSoPhong());
				ArrayList<HoaDon> listHoaDon = new ArrayList<>();
				ps.setInt(1, p.getId());
				rs = ps.executeQuery();
				while(rs.next()) {
					HoaDon hoaDon = new HoaDon();
					hoaDon.setId(rs.getInt("id"));
					hoaDon.setNgay(rs.getDate("ngay"));
					hoaDon.setTienPhong(rs.getInt("tienPhong"));
					hoaDon.setTienDuNo(rs.getInt("tienDuNo"));;
					hoaDon.setGhiChu(rs.getString("ghiChu"));
					hoaDon.setPhong(phong);
					ArrayList<DichVuHoaDon> listDichVuHoaDon = new ArrayList<>();
					PreparedStatement ps2 = con.prepareStatement(layDichVuHoaDon);
					ps2.setInt(1, hoaDon.getId());
					ResultSet rs2 = ps2.executeQuery();
					while(rs2.next()) {
						DichVuHoaDon dichVuHoaDon = new DichVuHoaDon(rs2.getInt("id"), rs2.getInt("soLuong"), rs2.getInt("gia"), rs2.getInt("tblDichVuid"));
						listDichVuHoaDon.add(dichVuHoaDon);
					}
					hoaDon.setDsDichVuHoaDon(listDichVuHoaDon);
					ArrayList<TieuThu> listTieuThu = new ArrayList<>();
					ps2 = con.prepareStatement(layTieuThu);
					ps2.setInt(1, hoaDon.getId());
					rs2 = ps2.executeQuery();
					while(rs2.next()) {
						TieuThu tieuThu = new TieuThu();
						tieuThu.setId(rs2.getInt("id"));
						ArrayList<ChiSoTieuThu> listChiSoTieuThu = new ArrayList<>();
						PreparedStatement ps3 = con.prepareStatement(layChiSoTieuThu);
						ps3.setInt(1, tieuThu.getId());
						ResultSet rs3 = ps3.executeQuery();
						while(rs3.next()) {
							ChiSoTieuThu chiSoTieuThu = new ChiSoTieuThu();
							chiSoTieuThu.setId(rs3.getInt("id"));
							PreparedStatement ps4 = con.prepareStatement(layChiSoCongTo);
							ps4.setInt(1, rs3.getInt("tblChiSoCongToid"));
							ResultSet rs4 = ps4.executeQuery();
							if(rs4.next()) {
								ChiSoCongTo chiSoCongTo = new ChiSoCongTo(rs4.getInt("id"), rs4.getInt("chiSo"), rs4.getDate("ngay"), rs4.getInt("tblCongToid"));
								chiSoTieuThu.setChiSoCongTo(chiSoCongTo);
							}
							listChiSoTieuThu.add(chiSoTieuThu);
						}
						tieuThu.setDsChiSoTieuThu(listChiSoTieuThu);
						ArrayList<LuyTienChiTiet> listLuyTienChiTiet = new ArrayList<>();
						ps3 = con.prepareStatement(layLuyTienChiTiet);
						ps3.setInt(1, tieuThu.getId());
						rs3 = ps3.executeQuery();
						while(rs3.next()) {
							LuyTienChiTiet luyTienChiTiet = new LuyTienChiTiet(rs3.getInt("id"), rs3.getInt("gia"), rs3.getInt("tblGiaLuyTienid"));
							listLuyTienChiTiet.add(luyTienChiTiet);
						}
						tieuThu.setDsLuyTienChiTiet(listLuyTienChiTiet);
						listTieuThu.add(tieuThu);
					}
					hoaDon.setDsTieuThu(listTieuThu);
					listHoaDon.add(hoaDon);
				}
				p.setDsHoaDon(listHoaDon);
				if(p.getDoanhThu() >= toiThieu && (toiDa == -1 || p.getDoanhThu() <= toiDa)) result.add(p);
				Collections.sort(result);
			}		
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
