<%@page import="sun.font.Script"%>
<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@page import="javax.swing.text.Document"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	System.out.println("ID : "+id);

	
	ProductDAO dao = new ProductDAO();
	ProductDTO dto = new ProductDTO();

	dao.delete(id);

	
%>