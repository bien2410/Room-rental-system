<%@page import="dao.PhongDAO"%>
<%@page import="model.Phong"%>
<%@page import="java.util.ArrayList"%>
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
	Phong phong = (Phong)session.getAttribute("phong");
	if(tv == null || phong == null){
		response.sendRedirect("../GDDangNhap.jsp?err=timeout");
	}
	else{
		String action = request.getParameter("action");	
		if(action == null){
%>
<body>
<header><h1>Thông tin phòng</h1></header>
<form>
<table>
<tr style="display: none;">
<td><input type="text" name="txtId" value="<%=phong.getId()%>" required></td>
</tr>
<tr>
	<th>Số phòng</th>
	<td><input type="text" name="txtSoPhong" value="<%=phong.getSoPhong()%>" required></td>
</tr>
<tr>
	<th>Diện tích</th>
	<td><input type="text" name="txtDienTich" value="<%=phong.getDienTich()%>" required> m<sup>2</sup></td>
</tr>
<tr>
	<th>Giá phòng</th>
	<td><input type="text" name="txtGiaPhong" value="<%=phong.getGiaPhong()%>" required> vnđ</td>
</tr>
<tr>
	<th>Trạng thái</th>
	<td><select name="txtTrangThai">
		<option value="1" <%=(phong.getTrangThai() == 1) ? "selected" : ""%>>Đã thuê</option>
		<option value="0" <%=(phong.getTrangThai() != 1) ? "selected" : ""%>>Trống</option>
	</select></td>
</tr>
<tr>
	<th>Mô tả</th>
	<td><input type="text" name="txtMoTa" value="<%=(phong.getMoTa() == null) ? "" : phong.getMoTa()%>"></td>
</tr>
<tr>
	<th>Tiền cọc</th>
	<td><input type="text" name="txtTienCoc" value="<%=phong.getTienCoc()%>" required> vnđ</td>
</tr>
<tr>
	<th>Dư nợ</th>
	<td><input type="text" name="txtDuNo" value="<%=phong.getDuNo()%>" required> vnđ</td>
</tr>
<tr>
	<td><button type="submit" name="action" value="update">Lưu thông tin</td>
	<td><button type="submit" name="action" value="delete">Xóa phòng</td>
</tr>
</table>
</form>
<button onclick="openPage('GDQuanLyPhong.jsp')" class="back-button">Quay lại</button>
</body>
</html>
<%}
		else if(action.equals("delete")){
		boolean result = new PhongDAO().xoaPhong(Integer.parseInt(request.getParameter("txtId")));
		if(result){
			%>
			<script type="text/javascript">
		        alert("Xóa phòng thành công");			       			      
		        openPage('GDQuanLyPhong.jsp');
		    </script> 
			<%
		}
		else{
			%>
			<script type="text/javascript">
		        alert("Xóa phòng thất bại");
		        history.back();		
		    </script> 
			<%
		}
	}
	else if(action.equals("update")){
		boolean result = false;
		try{
			phong.setSoPhong(Integer.parseInt(request.getParameter("txtSoPhong")));
			phong.setDienTich(Float.parseFloat(request.getParameter("txtDienTich")));
			phong.setGiaPhong(Integer.parseInt(request.getParameter("txtGiaPhong")));
			phong.setTrangThai(Integer.parseInt(request.getParameter("txtTrangThai")));
			phong.setMoTa(request.getParameter("txtMoTa"));
			phong.setTienCoc(Integer.parseInt(request.getParameter("txtTienCoc")));
			phong.setDuNo(Integer.parseInt(request.getParameter("txtDuNo")));
			result = new PhongDAO().luuPhong(phong);
		}
		catch(Exception e){
			e.printStackTrace();
			result = false;
		}		
		if(result){
			%>
			<script type="text/javascript">
		        alert("Lưu phòng thành công");	
		        openPage('GDQuanLyPhong.jsp');
		    </script> 
			<%			
		}
		else{
			%>
			<script type="text/javascript">
		        alert("Lưu phòng thất bại");
		        history.back();		
		    </script> 
			<%
		}
	}
}
%>