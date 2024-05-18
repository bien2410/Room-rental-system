<%@page import="dao.HoaDonDAO"%>
<%@page import="model.DichVuHoaDon"%>
<%@page import="model.LuyTienChiTiet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.TieuThu"%>
<%@page import="model.CongTo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="model.HoaDon"%>
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
	HoaDon hoaDon = (HoaDon)session.getAttribute("hoaDon");
	if(tv == null || hoaDon == null){
		response.sendRedirect("../GDDangNhap.jsp?err=timeout");
	}
	else{
		if(request.getParameter("action") == null){
%>
<body>
<header><h1>Hóa đơn</h1></header>
<h5>Số phòng: <%=hoaDon.getPhong().getSoPhong()%></h5>
<h5>Ngày: <%=new SimpleDateFormat("dd/MM/yyyy").format(new Date()) %></h5>
<h5>Tiền phòng: <%=hoaDon.getTienPhong()%> vnđ</h5>
<h5>Tiền điện:</h5>
<% 
	int tongTienTieuThu = 0;
	ArrayList<TieuThu> listTieuThu = hoaDon.getDsTieuThu();
	for(TieuThu tieuThu : listTieuThu){
		CongTo congTo = tieuThu.getDsChiSoTieuThu().get(0).getChiSoCongTo().getCongTo();
		if(congTo.getLoai().equals("dien")){
%>
<tr>
<td>Công tơ điện: <%=congTo.getTen()%></td>
<td>Chỉ số cũ: <%=congTo.getChiSoCongToCu().getChiSo()%>
<td>Chỉ số mới: <%=congTo.getChiSoCongToMoi().getChiSo()%>
<td>Số điện tiêu thụ: <%=congTo.getChiSoCongToMoi().getChiSo() - congTo.getChiSoCongToCu().getChiSo()%></td>
</tr>
<table>
<tr>
<th>TT</th>
<th>Bậc số điện</th>
<th>Giá</th>
<th>Số điện trong bậc</th>
<th>Thành tiền</th>
</tr>
<%
		}
		else{
%>
</table>
<h5>Tổng tiền điện: <%=tongTienTieuThu%> vnđ</h5>
<h5>Tiền nước:</h5>
<tr>
<td>Công tơ nước: <%=congTo.getTen()%></td>
<td>Chỉ số cũ: <%=congTo.getChiSoCongToCu().getChiSo()%>
<td>Chỉ số mới: <%=congTo.getChiSoCongToMoi().getChiSo()%>
<td>Số nước tiêu thụ: <%=congTo.getChiSoCongToMoi().getChiSo() - congTo.getChiSoCongToCu().getChiSo()%></td>
</tr>
<table>
<tr>
<th>TT</th>
<th>Bậc số nước</th>
<th>Giá</th>
<th>Số nước trong bậc</th>
<th>Thành tiền</th>
</tr>
<%
			tongTienTieuThu = 0;
		}
	int tongTienCongTo = 0;
	ArrayList<LuyTienChiTiet> listLuyTienChiTiet = tieuThu.getDsLuyTienChiTiet();
	for(int i = 0; i < listLuyTienChiTiet.size(); i++){
		if(listLuyTienChiTiet.get(i).getSoLuong() <= 0) continue;
		int mucTren = listLuyTienChiTiet.get(i).getGiaLuyTien().getMucTren();
		tongTienCongTo += listLuyTienChiTiet.get(i).getThanhTien();
		String bac;
		if(mucTren == 0) bac = "> " + mucTren;
		else bac = "<= " + mucTren;
%>
<tr>
<td><%=i+1%></td>
<td><%=bac %></td>
<td><%=listLuyTienChiTiet.get(i).getGia()%> vnđ</td>
<td><%=listLuyTienChiTiet.get(i).getSoLuong()%></td>
<td><%=listLuyTienChiTiet.get(i).getThanhTien()%> vnđ</td>
</tr>
<%} %>
<tr>
<td>Thành tiền: </td>
<td><%=tongTienCongTo%> vnđ</td>
</tr>
<% 
	tongTienTieuThu += tongTienCongTo;
%>
<%}
%>
</table>
<h5>Tổng tiền nước: <%=tongTienTieuThu%> vnđ</h5>
<h5>Dịch vụ:</h5>
<table>
<tr>
<th>TT</th>
<th>Tên dịch vụ</th>
<th>Giá</th>
<th>Số lượng</th>
<th>Thành tiền</th>
</tr>
<%
	int tongTienDichVu = 0;
	ArrayList<DichVuHoaDon> listDichVuHoaDon = hoaDon.getDsDichVuHoaDon();
	for(int i = 0; i < listDichVuHoaDon.size(); i++){
		if(listDichVuHoaDon.get(i).getSoLuong() == 0) continue;
		tongTienDichVu += listDichVuHoaDon.get(i).getThanhTien();
%>
<tr>
<td><%=i + 1%></td>
<td><%=listDichVuHoaDon.get(i).getDichVu().getTen()%></td>
<td><%=listDichVuHoaDon.get(i).getDichVu().getGia()%> vnđ</td>
<td><%=listDichVuHoaDon.get(i).getSoLuong()%></td>
<td><%=listDichVuHoaDon.get(i).getThanhTien()%> vnđ</td>
</tr>
<%}
%>
</table>
<h5>Tổng tiền dịch vụ: <%=tongTienDichVu%> vnđ</h5>
<h5>Tiền dư nợ: <%=hoaDon.getTienDuNo()%> vnđ</h5>
<h5>Tổng tiền hóa đơn: <%=hoaDon.getTongTienHoaDon()%> vnđ</h5>
<h5>Số tiền cần thanh toán: <%=hoaDon.getTongTienHoaDon() + hoaDon.getTienDuNo()%> vnđ</h5>
<p>Ghi chú: <%=hoaDon.getGhiChu()%></p>
<form method="post" action="GDHoaDon.jsp">
    <button type="submit" name="action" value="confirm">Xác nhận</button> 
</form>
<button onclick=history.back() class="back-button">Quay lại</button>
</body>
</html>
<%
		}
		else if(request.getParameter("action").equals("confirm")){
			boolean result = new HoaDonDAO().themHoaDon(hoaDon);
			if(result){
				%>
				<script type="text/javascript">
			        alert("Thêm hóa đơn thành công");	
			        openPage('GDLenHoaDonHangThang.jsp');
			    </script> 
				<%			
			}
			else{
				%>
				<script type="text/javascript">
			        alert("Thêm hóa đơn thất bại");
			        history.back();		
			    </script> 
				<%
			}
		}
	}
	
%>