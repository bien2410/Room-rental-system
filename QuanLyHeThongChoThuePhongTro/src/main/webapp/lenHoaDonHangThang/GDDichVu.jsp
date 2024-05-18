<%@page import="dao.DichVuDAO"%>
<%@page import="model.DichVu"%>
<%@page import="model.DichVuHoaDon"%>
<%@page import="java.util.ArrayList"%>
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
	Phong phong = (Phong) session.getAttribute("phong");
	ArrayList<DichVuHoaDon> listDichVuHoaDon = (ArrayList<DichVuHoaDon>) session.getAttribute("listDichVuHoaDon");
	if(tv == null || phong == null || listDichVuHoaDon == null){
		response.sendRedirect("../GDDangNhap.jsp?err=timeout");
	}
	else{
		if(request.getParameter("action") == null){
			String ten;
			if(request.getParameter("txtTen") == null) ten = "";
			else ten = request.getParameter("txtTen");
			ArrayList<DichVuHoaDon> listDichVuHoaDonHienThi = new ArrayList<>();
			for(DichVuHoaDon dvhd : listDichVuHoaDon){
				if(dvhd.getDichVu().getTen().toLowerCase().contains(ten.toLowerCase())){
					listDichVuHoaDonHienThi.add(dvhd);
				}
			}		
%>
<body>
<header><h1>Dịch vụ</h1></header>
<h5>Số phòng: <%=phong.getSoPhong()%></h5>
<form method="post" action="GDDichVu.jsp">
	<input type="text" name="txtTen" value="<%=ten%>">	
	<input type="submit" value="Tìm">
</form>
<form>
<table>
<tr>
<th>TT</th>
<th>Tên</th>
<th>Mô tả</th>
<th>Giá</th>
<th>Số lượng</th>
</tr>
<%
	for(int i = 0; i < listDichVuHoaDonHienThi.size(); i++){
%>
<tr>
<td><%=i + 1%></td>
<td><%=listDichVuHoaDonHienThi.get(i).getDichVu().getTen()%></td>
<td><%=listDichVuHoaDonHienThi.get(i).getDichVu().getMoTa()%></td>
<td><%=listDichVuHoaDonHienThi.get(i).getDichVu().getGia()%></td>
<td><input type="text" name="<%=listDichVuHoaDonHienThi.get(i).getDichVu().getId()%>" value="<%=listDichVuHoaDonHienThi.get(i).getSoLuong()%>">
<td></td>
</tr>
<%}
%>
<tr>
<td><button type="submit" name="action" value="save">Lưu</td>
</tr>
</table>
</form>
<button onclick="openPage('GDNhapThongTinHoaDon.jsp?index=<%=1%>')">Quay lại</button>
</body>
</html>
<%			
		}
		else if(request.getParameter("action").equals("save")){
			for(DichVuHoaDon dvhd : listDichVuHoaDon){
				String id = dvhd.getDichVu().getId() + "";
				if(request.getParameter(id) == null) continue;
				try{
					dvhd.setSoLuong(Integer.parseInt(request.getParameter(id)));
				}
				catch(Exception e){
					e.printStackTrace();
				}
			}
			session.setAttribute("listDichVuHoaDon", listDichVuHoaDon);
			response.sendRedirect("GDDichVu.jsp");
		}
	}
%>