<%@page import="product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<%
	ProductDAO dao = new ProductDAO();
	ArrayList<ProductDTO> list = dao.selectAll();

%>

 <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

	<h2>상품 전체 검색</h2>

	<table>
		<tr>
			<th>상품 아이디</th>
			<th>상품 이름</th>
			<th>상품 설명</th>
			<th>상품 가격</th>
		</tr>
		<%for(int i=0;i<list.size();i++){

			ProductDTO dto = list.get(i);
			%>
		<tr>
			<td><%= dto.getId()%></td>
			<td><%= dto.getName()%></td>
			<td><%= dto.getContents()%></td>
			<td><%= dto.getSale()%></td>
		</tr>
		
		<%} %>
	</table>

</body>
</html>
