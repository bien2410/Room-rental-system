package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.CongTo;

public class CongToDAO extends DAO{
	public ArrayList<CongTo> layCongToPhong(int id){
		ArrayList<CongTo> listCongTo = new ArrayList<>();
		String sql = "SELECT * FROM tblcongto WHERE tblPhongid = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				CongTo congTo = new CongTo(rs.getInt("id"), rs.getString("ten"), rs.getString("loai"));
				listCongTo.add(congTo);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return listCongTo;
	}
	public CongTo layCongToTheoId(int id) throws Exception {
		CongTo congTo = new CongTo();
		String sql = "SELECT * FROM tblcongto WHERE id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			congTo.setId(id);
			congTo.setTen(rs.getString("ten"));
			congTo.setLoai(rs.getString("loai"));
		}
		return congTo;
	}
}
