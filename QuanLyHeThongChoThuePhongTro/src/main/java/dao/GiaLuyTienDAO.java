package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.GiaLuyTien;

public class GiaLuyTienDAO extends DAO{
	public ArrayList<GiaLuyTien> layGiaLuyTien(String loai) {
		ArrayList<GiaLuyTien> result = new ArrayList<>();
		String sql = "SELECT * FROM tblgialuytien WHERE loai = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, loai);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				GiaLuyTien giaLuyTien = new GiaLuyTien();
				giaLuyTien.setId(rs.getInt("id"));
				giaLuyTien.setLoai(loai);
				giaLuyTien.setMucDuoi(rs.getInt("mucDuoi"));
				giaLuyTien.setMucTren(rs.getInt("mucTren"));
				giaLuyTien.setGia(rs.getInt("gia"));
				result.add(giaLuyTien);
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public GiaLuyTien layGiaLuyTienTheoId(int id) throws Exception{
		GiaLuyTien giaLuyTien = new GiaLuyTien();
		String sql = "SELECT * FROM tblgialuytien WHERE id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			giaLuyTien.setId(rs.getInt("id"));
			giaLuyTien.setLoai(rs.getString("loai"));
			giaLuyTien.setMucDuoi(rs.getInt("mucDuoi"));
			giaLuyTien.setMucTren(rs.getInt("mucTren"));
			giaLuyTien.setGia(rs.getInt("gia"));
		}
		return giaLuyTien;
	}
}
