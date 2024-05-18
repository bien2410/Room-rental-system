package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.Phong;

public class PhongDAO extends DAO {
	public ArrayList<Phong> timKiemPhong(int sp, int gp){
		ArrayList<Phong> result = new ArrayList<>();
		String sql = "SELECT * FROM tblphong WHERE soPhong LIKE ? and giaPhong >= ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			if(sp == -1) {
				ps.setString(1, "%%");
			}
			else {
				ps.setString(1, "%" + sp + "%");
			}
			ps.setInt(2, gp);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Phong phong = new Phong();
				phong.setId(rs.getInt("id"));
				phong.setSoPhong(rs.getInt("soPhong"));
				phong.setDienTich(rs.getFloat("dienTich"));
				phong.setGiaPhong(rs.getInt("giaPhong"));
				phong.setTrangThai(rs.getInt("trangThai"));
				if(rs.getString("moTa") == null) {
					phong.setMoTa("");
				}
				else phong.setMoTa(rs.getString("moTa"));
				phong.setTienCoc(rs.getInt("tienCoc"));
				phong.setDuNo(rs.getInt("duNo"));
				result.add(phong);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public ArrayList<Phong> timKiemPhongDaThue(int sp){
		ArrayList<Phong> result = new ArrayList<>();
		String sql = "SELECT * FROM tblphong WHERE soPhong LIKE ? and trangThai = 1";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			if(sp == -1) {
				ps.setString(1, "%%");
			}
			else {
				ps.setString(1, "%" + sp + "%");
			}			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Phong phong = new Phong();
				phong.setId(rs.getInt("id"));
				phong.setSoPhong(rs.getInt("soPhong"));
				phong.setDienTich(rs.getFloat("dienTich"));
				phong.setGiaPhong(rs.getInt("giaPhong"));
				phong.setTrangThai(rs.getInt("trangThai"));
				if(rs.getString("moTa") == null) {
					phong.setMoTa("");
				}
				else phong.setMoTa(rs.getString("moTa"));
				phong.setTienCoc(rs.getInt("tienCoc"));
				phong.setDuNo(rs.getInt("duNo"));
				result.add(phong);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public boolean luuPhong(Phong p) {
		int result;
		String sql = "UPDATE tblphong SET soPhong = ?, dienTich = ?, giaPhong = ?, trangThai = ?, moTa = ?, tienCoc = ?, duNo = ? WHERE id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, p.getSoPhong());
			ps.setFloat(2, p.getDienTich());
			ps.setInt(3, p.getGiaPhong());
			ps.setInt(4, p.getTrangThai());
			if(p.getMoTa() != null) ps.setString(5, p.getMoTa());
			else ps.setString(5, "");
			ps.setInt(6, p.getTienCoc());
			ps.setInt(7, p.getDuNo());
			ps.setInt(8, p.getId());
			result = ps.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return (result == 0) ? false : true;
	}
	public boolean xoaPhong(int id) {		
		int result;
		String sql = "DELETE FROM tblphong WHERE id = ?;";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			result = ps.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return (result == 0) ? false : true;
	}
	public boolean themPhong(Phong p) {		
		String sql = "INSERT INTO tblphong (soPhong, dienTich, giaPhong, trangThai, moTa, tienCoc, duNo) VALUES (?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
//			ps.setInt(1, p.getId());
			ps.setInt(1, p.getSoPhong());
			ps.setFloat(2, p.getDienTich());
			ps.setInt(3, p.getGiaPhong());
			ps.setInt(4, p.getTrangThai());
			if(p.getMoTa() != null) ps.setString(5, p.getMoTa());
			else ps.setString(5, "");
			ps.setInt(6, p.getTienCoc());
			ps.setInt(7, p.getDuNo());			
			ps.execute();
		}
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
