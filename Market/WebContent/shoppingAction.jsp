<%@page import="java.net.URLEncoder"%>
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
        	// 세션 : 서버 데이터 저장
	        	//session.setAttribute("세션이름", 데이터);
 			   	//session.getAttribute("세션이름");    
  		      	//session.invalidate(); session.setAttribute("세션이름", null);
  		      	//  모든 세션 삭제				해당 세션을 null변환 (일부 세션 삭제 효과)
        		//session.setMaxInactiveInterval("밀리초");
  		      	// 세션 유지 시간
  		      	
  		      // 쿠키 : 클라이언트 저장 
        		//Cookie 쿠키이름 = new Cookie("쿠키이름" , 데이터);
				// 	쿠키 객체 선언
			
        	
        	Cookie password = new Cookie("password" , request.getParameter("password")); 
        	Cookie name = new Cookie("name" , request.getParameter("name"));
        		
        		String phone1 = request.getParameter("phone1");
        		String phone2 = request.getParameter("phone2");
        		String phone3 = request.getParameter("phone3");
        	Cookie phone = new Cookie("phone", URLEncoder.encode(phone1 + "-" + phone2 + "-" + phone3));
        		
        		String address1 = request.getParameter("address1");
        		String address2 = request.getParameter("address2");
        		String address3 = request.getParameter("address3");
        		String address4 = request.getParameter("address4");
        		String address5 = request.getParameter("address5");
        		Cookie address = new Cookie("address" , URLEncoder.encode(address1 + "," + address2 + "," + address3 + "," + address4 + "," + address5 + ","));
        	
        		Cookie requests = new Cookie( "requests" , request.getParameter("requests"));
        	
        	// 결제 날짜 = SQL 시간
        	Date date = new Date(System.currentTimeMillis());
        	Date sqldate = new Date(date.getTime());
        Timestamp timestamp = new Timestamp(date.getTime());
        
        Cookie timestamps = new Cookie("tiemstamps" , URLEncoder.encode(String.valueOf(timestamp)));
       
        // 쿠키 시간
        password.setMaxAge(60*60*24*365);  // 쿠키 유지 시간		유효시간 365일
        name.setMaxAge(60*60*24*365);
        phone.setMaxAge(60*60*24*365);
        address.setMaxAge(60*60*24*365);
        requests.setMaxAge(60*60*24*365);
        timestamps.setMaxAge(60*60*24*365);
        
        
        // 쿠키 클라이언트[브라우저 ]저장
      	response.addCookie(password);
      	response.addCookie(name);
      	response.addCookie(phone);
      	response.addCookie(address);
      	response.addCookie(requests);
      	response.addCookie(timestamps);
      
      	/////////////////////////////////////////
       
       // 결제api로 부터 승인 코드가 들어왔을때
        response.sendRedirect("shopingInfo.jsp");
    	//////////////////////////////////////////
   	
    	// 결제api 로부터 실패 코드가 들어왔을때
    %>
    