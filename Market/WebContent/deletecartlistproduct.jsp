<%@page import="java.util.ArrayList"%>
<%@page import="dao.*"%>
<%@page import="dto.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
       	String ProductID = request.getParameter("ProductID");
    	
    ArrayList<Product> listProducts = (ArrayList<Product>)session.getAttribute("cartlist");
    
    for(int i = 0; i< listProducts.size(); i++){
    	if(listProducts.get(i).getProductID().equals(ProductID)){
    		listProducts.remove(i);
    		break;
    	}
    }
    session.setAttribute("cartlist", listProducts);
    	response.sendRedirect("cartlist.jsp");
    
    
    %>