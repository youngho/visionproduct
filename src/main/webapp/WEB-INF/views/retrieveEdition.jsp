<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=utf-8"%>


<%@page session="true" import="java.util.*"%>
<%@page import="java.util.Calendar"%>


<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<div class="body">
			<c:forEach var="rs" items="${rs}">
				<table class="lavalamp">
					<tr>
						<td><c:out value="${rs.ID}" /></td>
						<td><c:out value="${rs.NAME}" /></td>
						<td><c:out value="${rs.DEPTH}" /></td>
						<td><c:out value="${rs.LEVEL}" /></td>
					</tr>
				</table>
			</c:forEach>
		</div>
	</tiles:putAttribute>
</tiles:insertDefinition>
