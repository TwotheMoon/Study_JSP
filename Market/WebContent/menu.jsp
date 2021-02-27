<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <nav class="navbar-default">
    	<div class="container">
    		<div class="navbar-header">
    			<a class="navbar-brand" href="main.jsp"> <img alt="" src="image/alogo.jpg"> </a>
    		</div>
    		<div class="collapse navbar-collapse">
    			<ul class="nav navbar-nav">
    				
    				
    				<li class="dropdown">
    					<a href="#" class="dropdown-toggle" 
    						data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" >
    						컴퓨터제품 <span class="caret"></span>
    					</a>
    					<ul class="dropdown-menu">
    						<li><a href="products.jsp">모든제품</a>
    						<li><a href="products.jsp?category=notebook">노트북</a>
    						<li><a href="products.jsp?category=desktop">데스크탑</a>
    					</ul>
    				</li>
    				<li class="dropdown">
    					<a href="#" class="dropdown-toggle" 
    						data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" >
    						관리자메뉴 <span class="caret"></span>
    					</a>
    					<ul class="dropdown-menu">
    						<li><a href="editproduct.jsp">제품관리[등록 , 수정 , 삭제]</a>
    					</ul>
    				</li>
    			</ul>
    			<ul class="nav navbar-nav navbar-right">
    				<li class="dropdown">
    					<a href="#" class="dropdown-toggle" 
    						data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" >
    						<img src="image/회원아이콘.png" > <span class="caret"></span>
    					</a>
    					<ul class="dropdown-menu">
    						<li><a href="loginmember.jsp">로그인</a>
    						<li><a href="addmember.jsp">회원가입</a>
    					</ul>
    				</li>
   				</ul>
    		</div>
    	</div>
    </nav>