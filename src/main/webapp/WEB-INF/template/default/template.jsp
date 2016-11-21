<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>비즈머스 제품 관리</title>
	<link type="text/css" rel="stylesheet" media="all"	href="resources/styles/styles.css" />
	<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="resources/js/jquery.datetimepicker.css" />
	<script src="resources/js/jquery.datetimepicker.js"></script>
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
</head>

<body>
	<div class="page">
		<tiles:insertAttribute name="menu" />

		<tiles:insertAttribute name="body" />

		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>