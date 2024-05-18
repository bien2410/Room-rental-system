<%@page import="dao.PhongDAO"%>
<%@page import="model.Phong"%>
<%@page import="model.ThanhVien"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../openPage.jsp"%>
<title>Insert title here</title>
<link rel="stylesheet" href="../styles.css">
</head>
<%
	ThanhVien tv = (ThanhVien) session.getAttribute("thanhVien");
	if(tv == null){
		response.sendRedirect("../GDDangNhap.jsp?err=timeout");
	}
	else{
		if(request.getParameter("action") == null){
%>
<body>
<header><h1>Thêm phòng</h1></header>
<form>
<table>
<tr>
	<th>Số phòng</th>
	<td><input type="text" name="txtSoPhong" required></td>
</tr>
<tr>
	<th>Diện tích</th>
	<td><input type="text" name="txtDienTich" required> m<sup>2</sup></td>
</tr>
<tr>
	<th>Giá phòng</th>
	<td><input type="text" name="txtGiaPhong" required> vnđ</td>
</tr>
<tr>
	<th>Trạng thái</th>
	<td><select name="txtTrangThai">
		<option value="1">Đã thuê</option>
		<option value="0" selected>Trống</option>
	</select></td>
</tr>
<tr>
	<th>Mô tả</th>
	<td><input type="text" name="txtMoTa"></td>
</tr>
<tr>
	<th>Tiền cọc</th>
	<td><input type="text" name="txtTienCoc" required> vnđ</td>
</tr>
<tr>
	<th>Dư nợ</th>
	<td><input type="text" name="txtDuNo" required> vnđ</td>
</tr>
<tr>
	<td><button type="submit" name="action" value="add">Thêm</td>
</tr>
</table>
</form>
<button onclick="openPage('GDQuanLyPhong.jsp')" class="back-button">Quay lại</button>
</body>
</html>
<%
	}
	else if(request.getParameter("action").equals("add")){
		Phong p = new Phong();
		boolean result = false;
		try{			
			p.setSoPhong(Integer.parseInt(request.getParameter("txtSoPhong")));
			p.setDienTich(Float.parseFloat(request.getParameter("txtDienTich")));
			p.setGiaPhong(Integer.parseInt(request.getParameter("txtGiaPhong")));
			p.setTrangThai(Integer.parseInt(request.getParameter("txtTrangThai")));
			p.setMoTa(request.getParameter("txtMoTa"));
			p.setTienCoc(Integer.parseInt(request.getParameter("txtTienCoc")));
			p.setDuNo(Integer.parseInt(request.getParameter("txtDuNo")));
			result = new PhongDAO().themPhong(p);
		}
		catch(Exception e){
			e.printStackTrace();
			result = false;
		}		
		if(result){
			%>
			<script type="text/javascript">
		        alert("Thêm phòng thành công");	
		        openPage('GDQuanLyPhong.jsp');
		    </script> 
			<%			
		}
		else{
			%>
			<script type="text/javascript">
		        alert("Thêm phòng thất bại");
		        history.back();		
		    </script> 
			<%
		}
	}
}%>