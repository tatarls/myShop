<%@page import="sun.font.Script"%>
<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@page import="javax.swing.text.Document"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>

<%
	String name = request.getParameter("name");
	String contents = request.getParameter("contents");
	String sale = request.getParameter("sale");

	ProductDAO dao = new ProductDAO();
	ProductDTO dto = new ProductDTO();
	if(name.length() <=1){
		out.println("<script>alert('상품 이름을 입력해주셔야 합니다.');</script>");
		%><meta http-equiv='refresh' content='0;url=updateSelect.html'><%
	}
	else if(contents.length() <=1){
		out.println("<script>alert('상품 설명을 입력해주셔야 합니다.');</script>");
		%><meta http-equiv='refresh' content='0;url=updateSelect.html'><%		
	}
	else if(sale.length() <=1){
		out.println("<script>alert('상품 가격을 입력해주셔야 합니다.');</script>");
		%><meta http-equiv='refresh' content='0;url=updateSelect.html'><%
	}

	dto.setName(name);
	dto.setContents(contents);
	dto.setSale(sale);
	System.out.println(name+contents);
	dao.insert(dto);

	
%>