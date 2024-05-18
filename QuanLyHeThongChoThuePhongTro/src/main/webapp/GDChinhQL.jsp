<%@page import="model.ThanhVien"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../openPage.jsp"%>
<title>Insert title here</title>
<link rel="stylesheet" href="styles.css">
</head>
<%
	ThanhVien tv = (ThanhVien) session.getAttribute("thanhVien");
	if(tv == null){
		response.sendRedirect("GDDangNhap.jsp?err=timeout");
	}
%>
<body>
<header><h1>Trang chủ quản lý</h1></header>
<h5><%=tv.getHoTen()%></h5>
<h5><%=tv.getVaiTro()%></h5>
<button onclick="openPage('quanLyPhong/GDQuanLyPhong.jsp')">Quản lý phòng</button>
<button onclick="openPage('lenHoaDonHangThang/GDLenHoaDonHangThang.jsp')">Lên hóa đơn hàng tháng</button>
<button onclick="openPage('thongKePhongTheoDoanhThu/GDChonTK.jsp')">Xem thống kê</button>	
</body>
</html>