<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
<%@page import="dao.*"%>
<%@page import="dto.*"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    request.setCharacterEncoding("UTF-8");
        
        
        	String id = request.getParameter("id");
        	String password = request.getParameter("password");
        	String name = request.getParameter("name");
        	String gender = request.getParameter("gender");
        		
        		String birthyy = request.getParameter("birthyy");
        		String birthmm = request.getParameter("birthmm");
        		String birthdd = request.getParameter("birthdd");
        	String birth = birthyy + "/" + birthmm + "/" +birthdd; 
        		
        		String mail1 = request.getParameter("mail1");
        		String mail2 = request.getParameter("mail2");
        	String mail = mail1 + "@" + mail2;
        		
        		String phone1 = request.getParameter("phone1");
        		String phone2 = request.getParameter("phone2");
        		String phone3 = request.getParameter("phone3");
        	String phone = phone1 + "-" + phone2 + "-" + phone3 + "-";
        		
        		String address1 = request.getParameter("address1");
        		String address2 = request.getParameter("address2");
        		String address3 = request.getParameter("address3");
        		String address4 = request.getParameter("address4");
        		String address5 = request.getParameter("address5");
        	String address = address1 + "," + address2 + "," + address3 + "," + address4 + "," + address5 + ",";
        	
        	// 가입 날짜 = SQL 시간
        	Date date = new Date(System.currentTimeMillis());
        	Date sqldate = new Date(date.getTime());
        	Timestamp timestamp = new Timestamp(date.getTime());
        	
      
        	MemberDao dao = MemberDao.getinstance();
        	Member member = new Member();
        	    
        	member.setId(id);
        	member.setPassword(password);
        	member.setName(name);
        	member.setGender(gender);
        	member.setBirth(birth);
        	member.setMail(mail);
        	member.setPhone(phone);
        	member.setAddress(address);
        	member.setRegist_day(String.valueOf(timestamp));
        	
        	dao.updateMember(member);
        	
        	response.sendRedirect("editmember.jsp");
    %>
    