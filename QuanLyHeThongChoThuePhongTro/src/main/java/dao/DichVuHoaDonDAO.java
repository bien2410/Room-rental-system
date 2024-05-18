package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.DichVu;
import model.DichVuHoaDon;

public class DichVuHoaDonDAO extends DAO{
	public ArrayList<DichVuHoaDon> layDichVuThangTruoc(int id){
		ArrayList<DichVuHoaDon> result = new ArrayList<>();
		String sql = "SELECT tbldichvu.*, COALESCE(tbldichvuhoadon.soLuong, 0) FROM tbldichvu LEFT JOIN (SELECT tbldichvuhoadon.tblDichVuid, tbldichvuhoadon.soLuong FROM tbldichvuhoadon WHERE tbldichvuhoadon.tblHoaDonid = (SELECT id FROM tblhoadon WHERE tblPhongid = ? ORDER BY ngay DESC LIMIT 1)) tbldichvuhoadon ON tbldichvuhoadon.tblDichVuid = tbldichvu.id ";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				DichVuHoaDon dichVuHoaDon = new DichVuHoaDon(new DichVu(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4)), rs.getInt(5));
				result.add(dichVuHoaDon);
			}
			
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
