<%@page import="model.Phong"%>
<%@page import="dao.PhongDAO"%>
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
	if(tv == null){
		response.sendRedirect("../GDDangNhap.jsp?err=timeout");
	}
	else{
		if(session.getAttribute("listDichVuHoaDon") != null) session.removeAttribute("listDichVuHoaDon");
		if(request.getParameter("index") == null){
			String soPhong = (String) request.getParameter("txtSoPhong");	
			int sp;
			if(soPhong == null || soPhong.trim().equals("")) {
				soPhong = "";
				sp = -1;
			}
			else {
				try{
					sp = Integer.parseInt(soPhong);
				}
				catch(Exception e){
					sp = -1;
				}
			}
			ArrayList<Phong> listPhong = new PhongDAO().timKiemPhongDaThue(sp);
			session.setAttribute("listPhong", listPhong);
%>
<body>
<header><h1>Lên hóa đơn hàng tháng</h1></header>
<form method="post" action="GDLenHoaDonHangThang.jsp">
<table>
	<tr>
	<td>Số phòng: </td>
	<td><input type="text" name="txtSoPhong" value="<%=soPhong%>"></td>
	</tr>
	<tr>
	<td><button type="submit">Tìm</td>
	</tr>
</table>
</form>
<table>
<tr>
	<th>TT</th>
	<th>Số phòng</th>
	<th>Diện tích</th>
	<th>Giá phòng</th>
</tr>
<%
	for(int i = 0; i < listPhong.size(); i++){	
%>
<tr onclick="openPage('GDLenHoaDonHangThang.jsp?index=<%=i%>')" style="cursor: pointer;">
	<td><%=i+1%></td>
	<td><%=listPhong.get(i).getSoPhong()%></td>
	<td><%=listPhong.get(i).getDienTich()%> m<sup>2</sup></td>
	<td><%=listPhong.get(i).getGiaPhong()%> vnđ</td>
</tr>
<%} %>
<button onclick="openPage('../GDChinhQL.jsp')" class="back-button">Quay lại</button>
</body>
</html>
<%
}
	else{
		try{
			int index = Integer.parseInt(request.getParameter("index"));
			ArrayList<Phong> listPhong = (ArrayList<Phong>) session.getAttribute("listPhong");
			Phong phong = listPhong.get(index);
			session.setAttribute("phong", phong);
			response.sendRedirect("GDNhapThongTinHoaDon.jsp");
		}
		catch(Exception e){
			response.sendRedirect("../GDDangNhap.jsp?err=timeout");
		}		
	}
}%>