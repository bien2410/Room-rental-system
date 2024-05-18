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
%>
<body>
<header><h1>Chọn thống kê</h1></header>
<button onclick="openPage('GDTKPhongTheoDoanhThu.jsp')">Thống kê phòng theo doanh thu</button>
<button onclick="openPage('../GDChinhQL.jsp')" class="back-button">Quay lại</button>
</body>
</html>