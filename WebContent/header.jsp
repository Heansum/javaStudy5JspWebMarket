<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String active = request.getParameter("active");

	String welcomeClass = "";
	String productsClass = "";
	String addProductClass = "";
	
	if(active == null || active.equals("welcome")){
		welcomeClass = "class = \"active\"";
	} else if(active.equals("products")){
		productsClass = "class=\"active\"";
	} else if(active.equals("addProduct")){
		addProductClass = "class=\"active\"";
	}
%>
	<nav class="navbar navbar-fixed-top navbar-inverse">
		<div class="container">
			<div class="collapse navbar-collapse" id="navbar">
				<ul class = "nav navbar-nav">
					<li <%= welcomeClass %>><a class="navbar-brand" href="./welcome.jsp?active=welcome">Home</a></li>
					<li <%= productsClass %>><a class="navbar-brand" href="./products.jsp?active=products">Products list</a></li>
					<li <%= addProductClass%>><a class="navbar-brand" href="./addProduct.jsp?active=addProduct">Register Product</a></li>
					<li><a class="navbar-brand" href="#">Menu3</a></li>
				</ul>
			</div>
		</div>
	</nav>

