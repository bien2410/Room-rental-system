package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.DichVu;

public class DichVuDAO extends DAO{
	public DichVu layDichVu(int id) throws Exception {
		DichVu dichVu = new DichVu();
		String sql = "SELECT * FROM tbldichvu WHERE id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			dichVu.setId(rs.getInt("id"));
			dichVu.setTen(rs.getString("ten"));
			if(rs.getString("moTa") == null) dichVu.setMoTa("");
			else dichVu.setMoTa(rs.getString("moTa"));
			dichVu.setGia(rs.getInt("gia"));
		}
		return dichVu;
	}
//	public ArrayList<DichVu> timKiemDichVu(String ten){
//		ArrayList<DichVu> result = new ArrayList<>();
//		String sql = "SELECT * FROM tbldichvu WHERE ten LIKE ?";
//		try {
//			PreparedStatement ps = con.prepareStatement(sql);
//			ps.setString(1, "%" + ten + "%");
//			ResultSet rs = ps.executeQuery();
//			while(rs.next()) {
//				DichVu dichVu = new DichVu();
//				dichVu.setId(rs.getInt("id"));
//				dichVu.setTen(rs.getString("ten"));
//				if(rs.getString("moTa") == null) dichVu.setMoTa("");
//				else dichVu.setMoTa(rs.getString("moTa"));
//				dichVu.setGia(rs.getInt("gia"));
//				result.add(dichVu);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return result;
//	}
}
