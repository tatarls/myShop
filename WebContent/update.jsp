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
<body>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String contents = request.getParameter("contents");
	String sale = request.getParameter("sale");

	
	ProductDAO dao = new ProductDAO();
	ProductDTO dto = new ProductDTO();
	System.out.println("id 값은 : "+id);
	System.out.println("name 값은 : "+name);
	System.out.println("contents 값은 : "+contents);
	System.out.println("sale 값은 : "+sale);
	dto.setId(Integer.valueOf(id));
	dto.setName(name);
	dto.setContents(contents);
	dto.setSale(sale);
	dao.update(dto);

	ProductDTO dto2 = dao.select(id);
%>

	<h1>상품의 업데이트가 완료되었습니다.</h1>
		상품 아이디 : <input type = "text"disabled="disabled" name ="name" value=<%=dto.getId() %>><br>
		상품 제목 : <input type = "text"disabled="disabled"name ="name" value=<%=dto.getName() %>><br>
		상품 설명 : <input type = "text"disabled="disabled" name ="contents" value=<%=dto.getContents() %>><br>
		상품 가격 : <input type = "text"disabled="disabled" name ="sale" value=<%=dto.getSale() %>><br>
</body>
</html>
