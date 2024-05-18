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
	if(tv == null){
		response.sendRedirect("../GDDangNhap.jsp?err=timeout");
	}
	else{
		if(request.getParameter("index") == null){
			String soPhong = (String) request.getParameter("txtSoPhong");
			String giaPhong = (String) request.getParameter("txtGiaPhong");
			int sp, gp;
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
			if(giaPhong == null || giaPhong.trim().equals("")){
				giaPhong = "";
				gp = 0;
			}
			else {
				try{
					gp = Integer.parseInt(giaPhong);
				}
				catch(Exception e){
					gp = 0;
				}		
			}
			ArrayList<Phong> listPhong = new PhongDAO().timKiemPhong(sp, gp);
			session.setAttribute("listPhong", listPhong);
%>	
<body>
<header><h1>Quản lý phòng</h1></header>
<form method="post" action="GDQuanLyPhong.jsp">
<table>
	<tr>
	<td>Số phòng: </td>
	<td><input type="text" name="txtSoPhong" value="<%=soPhong%>"></td>
	</tr>
	<tr>
	<td>Giá phòng: </td>
	<td><input type="text" name="txtGiaPhong" value="<%=giaPhong%>"></td>
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
	<th>Trạng thái</th>
</tr>
<%
	for(int i = 0; i < listPhong.size(); i++){	
		String trangThai = (listPhong.get(i).getTrangThai() == 1) ? "Đã thuê" : "Trống";
%>
<tr onclick="openPage('GDQuanLyPhong.jsp?index=<%=i%>')" style="cursor: pointer;">
	<td><%=i+1%></td>
	<td><%=listPhong.get(i).getSoPhong()%></td>
	<td><%=listPhong.get(i).getDienTich()%> m<sup>2</sup></td>
	<td><%=listPhong.get(i).getGiaPhong()%> vnđ</td>
	<td><%=trangThai%></td>
</tr>
<%
		}	
	}
	else{
		try{
			int index = Integer.parseInt(request.getParameter("index"));
			ArrayList<Phong> listPhong = (ArrayList<Phong>) session.getAttribute("listPhong");
			Phong phong = listPhong.get(index);
			session.setAttribute("phong", phong);
			response.sendRedirect("GDThongTinPhong.jsp");
		}
		catch(Exception e){
			response.sendRedirect("../GDDangNhap.jsp?err=timeout");
		}
	}
}
%>
</table>
<button onclick="openPage('GDThemPhong.jsp')">Thêm phòng</button>
<button onclick="openPage('../GDChinhQL.jsp')" class="back-button">Quay lại</button>
</body>
</html>