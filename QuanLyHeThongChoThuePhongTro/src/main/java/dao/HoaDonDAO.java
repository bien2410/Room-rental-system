package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;

import model.ChiSoTieuThu;
import model.CongTo;
import model.DichVuHoaDon;
import model.HoaDon;
import model.LuyTienChiTiet;
import model.TieuThu;

public class HoaDonDAO extends DAO{
	public boolean themHoaDon(HoaDon hoaDon) {
		boolean result = true;
		String luuChiSoCongTo = "INSERT INTO tblchisocongto (chiSo, ngay, tblCongToid) VALUES (?, ?, ?)";
		String luuHoaDon = "INSERT INTO tblhoadon (ngay, tienPhong, tienDuNo, ghiChu, tblPhongid) VALUES (?, ?, ?, ?, ?)";
		String luuDichVuHoaDon = "INSERT INTO tbldichvuhoadon (soLuong, gia, tblDichVuid, tblHoaDonid) VALUES (?, ?, ?, ?)";
		String luuTieuThu = "INSERT INTO tbltieuthu (tblHoaDonid) VALUES (?)";
		String luuLuyTienChiTiet = "INSERT INTO tblluytienchitiet (gia, tblTieuThuid, tblGiaLuyTienid) VALUES (?, ?, ?)";
		String luuChiSoTieuThu = "INSERT INTO tblchisotieuthu (tblTieuThuid, tblChiSoCongToid) VALUES (?, ?)";
		try {
			con.setAutoCommit(false);
			PreparedStatement ps = con.prepareStatement(luuChiSoCongTo, Statement.RETURN_GENERATED_KEYS);
			for(CongTo congTo : hoaDon.getPhong().getDsCongTo()) {
				ps.setInt(1, congTo.getChiSoCongToMoi().getChiSo());
				ps.setDate(2, new Date(congTo.getChiSoCongToMoi().getNgay().getTime()));
				ps.setInt(3, congTo.getId());
				ps.execute();
				ResultSet generatedKey = ps.getGeneratedKeys();
				if(generatedKey.next()) congTo.getChiSoCongToMoi().setId(generatedKey.getInt(1));
			}
			ps = con.prepareStatement(luuHoaDon, Statement.RETURN_GENERATED_KEYS);
			ps.setDate(1, new Date(hoaDon.getNgay().getTime()));
			ps.setInt(2, hoaDon.getTienPhong());
			ps.setInt(3, hoaDon.getTienDuNo());
			ps.setString(4, hoaDon.getGhiChu());
			ps.setInt(5, hoaDon.getPhong().getId());
			ps.execute();
			ResultSet generatedKey = ps.getGeneratedKeys();
			if(generatedKey.next()) hoaDon.setId(generatedKey.getInt(1));
			ps = con.prepareStatement(luuDichVuHoaDon);
			for(DichVuHoaDon dichVuHoaDon : hoaDon.getDsDichVuHoaDon()) {
				ps.setInt(1, dichVuHoaDon.getSoLuong());
				ps.setInt(2, dichVuHoaDon.getGia());
				ps.setInt(3, dichVuHoaDon.getDichVu().getId());
				ps.setInt(4, hoaDon.getId());
				ps.execute();
			}
			ps = con.prepareStatement(luuTieuThu, Statement.RETURN_GENERATED_KEYS);
			for(TieuThu tieuThu : hoaDon.getDsTieuThu()) {
				ps.setInt(1, hoaDon.getId());
				ps.execute();
				generatedKey = ps.getGeneratedKeys();
				if(generatedKey.next()) tieuThu.setId(generatedKey.getInt(1));
				PreparedStatement ps2 = con.prepareStatement(luuLuyTienChiTiet);
				for(LuyTienChiTiet luyTienChiTiet : tieuThu.getDsLuyTienChiTiet()) {
					if(luyTienChiTiet.getSoLuong() <= 0) continue;
					ps2.setInt(1, luyTienChiTiet.getGia());
					ps2.setInt(2, tieuThu.getId());
					ps2.setInt(3, luyTienChiTiet.getGiaLuyTien().getId());
					ps2.execute();
				}
				ps2 = con.prepareStatement(luuChiSoTieuThu);
				ArrayList<ChiSoTieuThu> reverseArrayList = new ArrayList<>();
				reverseArrayList.addAll(tieuThu.getDsChiSoTieuThu());
				Collections.reverse(reverseArrayList);
				for(ChiSoTieuThu chiSoTieuThu : reverseArrayList) {
					ps2.setInt(1, tieuThu.getId());
					ps2.setInt(2, chiSoTieuThu.getChiSoCongTo().getId());
					ps2.execute();
				}
			}
			con.commit();
		}
		catch (Exception e) {
			result = false;
			try {
				con.rollback();
			}
			catch(Exception ex) {
				result = false;
				ex.printStackTrace();
			}
			e.printStackTrace();
		}
		finally {
			try {
				con.setAutoCommit(true);
			}
			catch (Exception ex) {
				result = false;
				ex.printStackTrace();
			}
		}
		return result;
	}
}
