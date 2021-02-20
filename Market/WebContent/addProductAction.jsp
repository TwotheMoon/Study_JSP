<%@page import="dao.ProductDao"%>
<%@page import="dto.Product"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	request.setCharacterEncoding("UTF-8");

	String realFolder="C:/Users/2theMoon/eclipse-jsp/Market/WebContent/image";
	
	MultipartRequest multi = new MultipartRequest(
			request , realFolder , 1024*1024*10 , "UTF-8" , new DefaultFileRenamePolicy());
	
	String ProductID = multi.getParameter("ProductID");
	String pname = multi.getParameter("pname");
	String pprice = multi.getParameter("pprice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String pinstock = multi.getParameter("pinstock");
	String conditions = multi.getParameter("conditions");
	String filename = multi.getFilesystemName("filename");

	Integer price;
	
	if(pprice.isEmpty()){
		price = 0;
	}
	else{
		price = Integer.valueOf(pprice);
	}
	
	Integer stock;
	
	if(pinstock.isEmpty()){
		stock = 0;
	}
	else{
		stock = Integer.valueOf(pinstock);
	}
	
	ProductDao dao = ProductDao.getinstance();
	Product product = new Product();
	
	Product produck = new Product();
	
	produck.setProductID(ProductID);
	produck.setPname(pname);
	produck.setPprice(price);
	produck.setDescription(description);
	produck.setManufacturer(manufacturer);
	produck.setCategory(category);
	produck.setconditions(conditions);
	produck.setPinstock(stock);
	produck.setFilename(filename);
	produck.setActivation(1);
	
	dao.setProduct(product);
	
	response.sendRedirect("product.jsp");
%>