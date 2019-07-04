<%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%>
<%@page import="sun.font.Script"%>
<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@page import="javax.swing.text.Document"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
%>
<body>
	<%
		System.out.println("작동");
		try {
			String id = request.getParameter("id");

			ProductDAO dao = new ProductDAO();
			ProductDTO dto = dao.select(id);
	%>

	<h1>업데이트 할 정보를 입력해주십시오</h1>
	<form action="update.jsp">
		상품 아이디 : <input type="text" name="id" value=<%=dto.getId()%>><br>
		상품 제목 : <input type="text" name="name" value=<%=dto.getName()%>><br>
		상품 설명 : <input type="text" name="contents"
			value=<%=dto.getContents()%>><br> 상품 가격 : <input
			type="text" name="sale" value=<%=dto.getSale()%>><br>
		<button type="submit">상품 업데이트</button>
	</form>
	<%
		} catch (Exception e) {
			out.println("<script>alert('존재하지 않는 ID 값 입니다.');</script>");
	%>
	
	<meta http-equiv='refresh' content='0;url=updateSelect.html'>
	<%
		}
	%>
</body>
</html>
