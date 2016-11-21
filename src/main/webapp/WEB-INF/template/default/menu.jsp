<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<nav class="navbar navbar-inverse">
	<div class="container">
		<div class="navbar-collapse collapse">
		<spring:url value="/" var="homeUrl" htmlEscape="true"/>
		<spring:url value="/edition" var="edition" htmlEscape="true"/>
		<spring:url value="/function" var="function" htmlEscape="true"/>
			<ul class="nav navbar-nav">
				<li><a href="${homeUrl}">Home</a></li>
				<li><a href="${edition}">에디션 관리</a></li>
				<li><a href="${function}">기능 관리</a></li>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
</nav>