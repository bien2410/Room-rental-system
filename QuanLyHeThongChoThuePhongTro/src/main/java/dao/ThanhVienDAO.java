package dao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.ThanhVien;
public class ThanhVienDAO extends DAO{
	public boolean kiemTraDangNhap(ThanhVien tv) {
		boolean result = false;
		String sql = "SELECT * FROM tblthanhvien WHERE taiKhoan = ? and matKhau = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, tv.getTaiKhoan());
			ps.setString(2, tv.getMatKhau());
			ResultSet rs = ps.executeQuery();			
			if(rs.next()) {
				String vaiTro = rs.getString("vaiTro");
				if(vaiTro == null || !vaiTro.equals("quan ly")) return false;
				tv.setId(rs.getInt("id"));
				tv.setHoTen(rs.getString("hoTen"));
				tv.setNgaySinh(rs.getDate("ngaySinh"));
				tv.setEmail(rs.getString("email"));
				tv.setSdt(rs.getString("sdt"));
				tv.setVaiTro(vaiTro);
				result = true;				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
