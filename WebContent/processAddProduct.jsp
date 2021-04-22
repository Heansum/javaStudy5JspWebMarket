<%@page import="DAO.ProductRepository"%>
<%@page import="DTO.Product"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String productId = request.getParameter("productId");
	String name = request.getParameter("name");
	String unitPrice = request.getParameter("unitPrice");
	int unitPrice_i = Integer.parseInt(unitPrice);
	
	String description = request.getParameter("description");
	String manufacturer = request.getParameter("manufacturer");
	String category = request.getParameter("category");
	
	String unitsInStock = request.getParameter("unitsInStock");
	int unitsInStock_i = Integer.parseInt(unitsInStock);
	String condition = request.getParameter("condition");
	
	Product product = new Product(
						productId, name, unitPrice, description, manufacturer,
						category, unitsInStock, condition
					);
	
	// 상품 정보 저장
	// ProductRepository 객체의 생성을 제한 (싱글턴 패턴)
	ProductRepository pr = ProductRepository.getInstance();
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<!-- 부트스트랩을 위한 jQuery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<%
		try{
			if(productId.length() == 0)			throw new IllegalArgumentException("상품 코드 공란");
			else if(productId.length() != 5)	throw new IllegalArgumentException("상품 코드는 5자여야합니다.");
			
			else if(name.length() == 0)			throw new IllegalArgumentException("상품명 공란");
			else if(name.length() > 255)		throw new IllegalArgumentException("상품명은 255자 이하여야합니다.");
			
			else if(unitPrice.length() == 0)	throw new IllegalArgumentException("가격 공란");
			else if(unitPrice_i > 1000 || unitPrice_i <0)	throw new IllegalArgumentException("가격은 0원 이상 1천만원 이하여야합니다.");
			
			else if(unitsInStock.length() == 0)	throw new IllegalArgumentException("재고 수 공란");
			else if(unitsInStock_i < 0)			throw new IllegalArgumentException("재고 수 부적절");
			
			else if(description.length() == 0)	throw new IllegalArgumentException("상품의 정보를 입력하지 않았다");
			
			
			else{
%>	
				<p>productId : <%= productId %></p>
				<p>name : <%= name %></p>
				<p>unitPrice : <%= unitPrice %></p>
				<p>unitInStock : <%= unitsInStock %></p>
<% 	
				}
		} catch(IllegalArgumentException e){
			// 상품의 정보를 올바르게 입력하지 않았을 경우
			// 1. 상품의 정보를 입력하지 않았다
			// 2. 상품 코드는 5자여야합니다.
			// 3. 상품명은 255자 이하여야합니다.
			// 4. 가격은 0원 이상 1천만원 이하여야합니다.
			// 5. 재고 수는 0개 이상이어야합니다.
			
			
			
			out.println("<p>상품 정보가 올바르지 않습니다.<a href=\"./addProduct.jsp\">되돌아가기</a></p>");
		}
%>

	<jsp:include page = "header.jsp"/>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"></h1>
		</div>
	</div>
	
	
	
	
</body>
</html>