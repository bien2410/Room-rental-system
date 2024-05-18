e<%@page import="dao.ThanhVienDAO"%>
<%@page import="model.ThanhVien"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="styles.css">
</head>
<%
	if(request.getParameter("err") != null && request.getParameter("err").equalsIgnoreCase("timeout")){
		%>
		<script type="text/javascript">
	        alert("Hết phiên làm việc. Làm ơn đăng nhập lại");
	        window.location.href = "GDDangNhap.jsp";
	    </script> 
		<%
	}
	else{
		String taiKhoan = (String) request.getParameter("txtTaiKhoan");
		String matKhau = (String) request.getParameter("txtMatKhau");	
		if(taiKhoan != null && matKhau != null) {
			ThanhVien tv = new ThanhVien(taiKhoan, matKhau);
			ThanhVienDAO tvDAO = new ThanhVienDAO();		
			if(tvDAO.kiemTraDangNhap(tv)){
				session.setAttribute("thanhVien", tv);
				response.sendRedirect("GDChinhQL.jsp");
			}
			else{
				%>
				<script type="text/javascript">
			        alert("Đăng nhập thất bại");			       	
			        history.back();
			    </script> 
				<%
			}
		}
	}
%>

<body>
	<header><h1>Đăng nhập</h1></header>
	<form method="post" action="GDDangNhap.jsp">
	<table>
	<tr><td>Tài khoản</td>
		<td><input type="text" name="txtTaiKhoan" required></td></tr>
	<tr><td>Mật khẩu</td>
		<td><input type="password" name="txtMatKhau" required></td></tr>	
	<tr><td></td>
		<td><button type="submit">Đăng nhập</td></tr>
	</table>
	</form>
</body>
</html>