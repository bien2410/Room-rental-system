package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.ChiSoCongTo;

public class ChiSoCongToDAO extends DAO{
	public ChiSoCongTo layChiSoTheoCongTo(int id) {
		ChiSoCongTo chiSoCongTo = new ChiSoCongTo();
		String sql = "SELECT * FROM tblchisocongto WHERE tblCongToid = ? ORDER BY ngay DESC LIMIT 1";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				chiSoCongTo.setId(rs.getInt("id"));
				chiSoCongTo.setChiSo(rs.getInt("chiSo"));
				chiSoCongTo.setNgay(rs.getDate("ngay"));
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return chiSoCongTo;
	}
}
