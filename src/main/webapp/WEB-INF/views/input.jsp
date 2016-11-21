<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>


<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">


		<script type="text/javascript">
			$(document).ready(function() {
				console.log("ready!");
				

				$('.datetimepicker').datetimepicker({
					format:'Y-m-d h:m:s',
					dayOfWeekStart : 0,
					lang : 'kr',
					disabledDates : [ '1986/01/08', '1986/01/09', '1986/01/10' ]
				});
			});
			
			function insertAct() {
				var f = document.form;
				console.log(f.idOut.value);
				if (!!f.idOut.value && !!f.usedName.value && !!f.usedDt.value) {
					f.action = "/input";
					f.submit();
				} else {
					alert("input value");
				}
			}

			function listAct() {
				location.href = "/money";
			}
		</script>
		<div class="well">
			<form:form commandName="moneyVo" name="form" method="post" action="">
				<table style="width: 40%">
					<tr>
						<td align="left">ID :</td>
						<td><input class="form-control" type="text" id="usedName" name="usedName" value="" maxlength="20" size="20" /></td>
					</tr>
					<tr>
						<td align="left">NAME :</td>
						<td><input class="form-control" type="text" id="usedDt" name="usedDt" value="" maxlength="20" size="20" class="datetimepicker" /></td>
					</tr>
					<tr>
						<td align="left">DEPTH :</td>
						<td><input class="form-control" type="text" id="totUsedMoney" name="totUsedMoney" value="" maxlength="20" size="20" /></td>
					</tr>
					<tr>
						<td align="left">LEVEL :</td>
						<td><input class="form-control" type="text" id="cardGgang" name="cardGgang" value="" maxlength="20" size="20" /></td>
					</tr>
					<tr>
						<td align="right"><input type="button" value="저장" onclick="insertAct()" /> <input type="button" value="취소" onclick="listAct()" /></td>
					</tr>
				</table>
			</form:form>
		</div>

	</tiles:putAttribute>
</tiles:insertDefinition>