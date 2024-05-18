<%@page import="model.HoaDon"%>
<%@page import="model.ChiSoCongTo"%>
<%@page import="model.CongTo"%>
<%@page import="dao.CongToDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Phong"%>
<%@page import="dao.DichVuHoaDonDAO"%>
<%@page import="model.DichVuHoaDon"%>
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
	Phong phong = (Phong) session.getAttribute("phong");
	if(tv == null || phong == null){
		response.sendRedirect("../GDDangNhap.jsp?err=timeout");
	}
	else{
		if(request.getParameter("action") == null){
			ArrayList<DichVuHoaDon> listDichVuHoaDon;
			if(session.getAttribute("listDichVuHoaDon") == null){
				listDichVuHoaDon = new DichVuHoaDonDAO().layDichVuThangTruoc(phong.getId());
			}
			else{
				listDichVuHoaDon = (ArrayList<DichVuHoaDon>) session.getAttribute("listDichVuHoaDon");
			}
			session.setAttribute("listDichVuHoaDon", listDichVuHoaDon);
			
			ArrayList<CongTo> listCongTo = new CongToDAO().layCongToPhong(phong.getId());
			
%>
<body>
<header><h1>Nhập thông tin hóa đơn</h1></header>
<h5>Phòng: <%=phong.getSoPhong()%></h5>
<h5>Ngày: <%=new SimpleDateFormat("dd/MM/yyyy").format(new Date()) %></h5>
<h5>Dịch vụ</h5>
<table>
<tr>
<th>TT</th>
<th>Tên</th>
<th>Mô tả</th>
<th>Giá</th>
<th>Số lượng</th>
<tr>
<%
	for(int i = 0; i < listDichVuHoaDon.size(); i++){
		if(listDichVuHoaDon.get(i).getSoLuong() == 0) continue;
%>
<tr>
<td><%=i+1%></td>
<td><%=listDichVuHoaDon.get(i).getDichVu().getTen()%></td>
<td><%=listDichVuHoaDon.get(i).getDichVu().getMoTa()%></td>
<td><%=listDichVuHoaDon.get(i).getDichVu().getGia()%></td>
<td><%=listDichVuHoaDon.get(i).getSoLuong()%></td>
</tr>
<%
}
%>
</table>
<button onclick="openPage('GDDichVu.jsp')">Dịch vụ</button>
<form method="post" action="GDNhapThongTinHoaDon.jsp">
<table>
<%
	for(CongTo ct : listCongTo){
		if(ct.getLoai().equals("dien")){
%>
<tr>
<td>Công tơ điện <%=ct.getTen()%></td>
<td><input type="text" name="<%=ct.getId()%>" required></td>
</tr>
<%
		}
	}
%>
<%
	for(CongTo ct : listCongTo){
		if(ct.getLoai().equals("nuoc")){
%>
<tr>
<td>Công tơ nước <%=ct.getTen()%></td>
<td><input type="text" name="<%=ct.getId()%>" required></td>
</tr>
<%
		}
	}
%>
<tr>
<td>Ghi chú </td>
<td><input type="text" name="txtGhiChu"></td>
</tr>
<tr>
<td><button type="submit" name="action" value="continue">Tiếp tục</td>
</tr>
</table>
</form>
<button onclick="openPage('GDLenHoaDonHangThang.jsp')" class="back-button">Quay lại</button>
</body>
</html>
<% 
	}
	else if(request.getParameter("action").equals("continue")){
		if(session.getAttribute("listDichVuHoaDon") == null){
			response.sendRedirect("../GDDangNhap.jsp?err=timeout");
		}
		ArrayList<DichVuHoaDon> listDichVuHoaDon = (ArrayList<DichVuHoaDon>) session.getAttribute("listDichVuHoaDon");
		ArrayList<CongTo> listCongTo = new CongToDAO().layCongToPhong(phong.getId());
		boolean result = true;
		try{
			for(CongTo congTo : listCongTo){
				int chiSoMoi = Integer.parseInt(request.getParameter(congTo.getId() + ""));
				if(congTo.getChiSoCongToCu().getChiSo() > chiSoMoi){
					result = false;
					break;
				}
				congTo.setChiSoCongToMoi(new ChiSoCongTo(chiSoMoi, congTo));
			}
			phong.setDsCongTo(listCongTo);
			String ghiChu = (request.getParameter("txtGhiChu") == null) ? "" : request.getParameter("txtGhiChu");
			HoaDon hoaDon = new HoaDon(phong, listDichVuHoaDon, ghiChu); 
			session.setAttribute("hoaDon", hoaDon);
		}
		catch(Exception e){
			e.printStackTrace();
			result = false;
		}
		if(!result){
			%>
			<script type="text/javascript">
		        alert("Tạo hóa đơn thất bại");	
		        history.back();
		    </script> 
			<%			
		}
		else{
			response.sendRedirect("GDHoaDon.jsp");
		}
	}
}
%>