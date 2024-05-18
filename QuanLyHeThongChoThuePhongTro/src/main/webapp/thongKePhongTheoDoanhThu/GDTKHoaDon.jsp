<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.HoaDon"%>
<%@page import="model.PhongTK"%>
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
	PhongTK phongTK = (PhongTK) session.getAttribute("phongTK");
	if(tv == null || phongTK == null){
		response.sendRedirect("../GDDangNhap.jsp?err=timeout");
	}
	else{
		if(request.getParameter("index") == null){
			ArrayList<HoaDon> listHoaDon = phongTK.getDsHoaDon();
			int tongDoanhThu = 0;
%>

<body>
<header><h1>Thống kê hóa đơn</h1></header>
<h5>Số phòng: <%=phongTK.getSoPhong()%></h5>
<table>
<tr>
<th>TT</th>
<th>Ngày</th>
<th>Doanh thu</th>
</tr>
<% 
	for(int i = 0; i < listHoaDon.size(); i++){
		tongDoanhThu += listHoaDon.get(i).getTongTienHoaDon();
%>
<tr onclick="openPage('GDTKHoaDon.jsp?index=<%=i%>')" style="cursor: pointer;">
<td><%=i+1%></td>
<td><%=new SimpleDateFormat("dd/MM/yyyy").format(listHoaDon.get(i).getNgay())%>
<td><%=listHoaDon.get(i).getTongTienHoaDon()%> vnđ</td>
</tr>
<%}
%>
</table>
<h5>Tổng doanh thu: <%=tongDoanhThu%> vnđ</h5>
<button onclick=history.back() class="back-button">Quay lại</button>
</body>
</html>
<%
		}
		else{
			try{
				int index = Integer.parseInt(request.getParameter("index"));
				HoaDon hoaDon = phongTK.getDsHoaDon().get(index);
				session.setAttribute("hoaDon", hoaDon);
				response.sendRedirect("GDXemHoaDon.jsp");
			}
			catch(Exception e){
				e.printStackTrace();
				response.sendRedirect("../GDDangNhap.jsp?err=timeout");
			}
		}
	}
%>