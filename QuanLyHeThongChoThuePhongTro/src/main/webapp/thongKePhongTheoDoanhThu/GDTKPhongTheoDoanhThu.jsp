<%@page import="dao.PhongTKDAO"%>
<%@page import="model.PhongTK"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
		if(request.getParameter("index") == null){
			try{
				String bd = (request.getParameter("txtBD") == null) ? "" : request.getParameter("txtBD");
				String kt = (request.getParameter("txtKT") == null) ? "" : request.getParameter("txtKT");
				String tt = (request.getParameter("txtTT") == null) ? "" : request.getParameter("txtTT");
				String td = (request.getParameter("txtTD") == null) ? "" : request.getParameter("txtTD");
				ArrayList<PhongTK> listPhongTK = new PhongTKDAO().thongKePhong(bd, kt, tt, td);
				session.setAttribute("listPhongTK", listPhongTK);
%>
<body>
<header><h1>Thống kê phòng theo doanh thu</h1></header>
<form method="post" action="GDTKPhongTheoDoanhThu.jsp">
<table>
	<tr>
	<td>Ngày bắt đầu: </td>
	<td><input type="text" name="txtBD" value="<%=bd%>"></td>
	</tr>
	<tr>
	<td>Ngày kết thúc: </td>
	<td><input type="text" name="txtKT" value="<%=kt%>"></td>
	</tr>
	<tr>
	<td>Doanh thu tối thiểu: </td>
	<td><input type="text" name="txtTT" value="<%=tt%>"></td>
	</tr>
	<tr>
	<td>Doanh thu tối đa: </td>
	<td><input type="text" name="txtTD" value="<%=td%>"></td>
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
	<th>Số tháng lấp đầy</th>
	<th>Doanh thu</th>
</tr>
<%
	for(int i = 0; i < listPhongTK.size(); i++){
%>
<tr onclick="openPage('GDTKPhongTheoDoanhThu.jsp?index=<%=i%>')" style="cursor: pointer;">
	<td><%=i+1%></td>
	<td><%=listPhongTK.get(i).getSoPhong()%></td>
	<td><%=listPhongTK.get(i).getSoThangLapDay()%></td>
	<td><%=listPhongTK.get(i).getDoanhThu()%> vnđ</td>
</tr>
<%}
%>
</table>
<button onclick="openPage('GDChonTK.jsp')" class="back-button">Quay lại</button>
</body>
</html>
<%
			}
			catch(Exception e){
				e.printStackTrace();
				%>
				<script type="text/javascript">
			        alert("Vui lòng nhập đúng thông tin thống kê");	
			        history.back();
			    </script> 
				<%		
			}
		}
		else{
			try{
				int index = Integer.parseInt(request.getParameter("index"));
				ArrayList<PhongTK> listPhongTK = (ArrayList<PhongTK>) session.getAttribute("listPhongTK");
				PhongTK phongTK = listPhongTK.get(index);
				session.setAttribute("phongTK", phongTK);
				response.sendRedirect("GDTKHoaDon.jsp");
			}
			catch(Exception e){
				e.printStackTrace();
				response.sendRedirect("../GDDangNhap.jsp?err=timeout");
			}
		}
	}
%>