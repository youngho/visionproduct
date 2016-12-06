<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=utf-8"%>

<%@page session="true" import="java.util.*"%>

<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<script type="text/javascript">
			function insertAct() {
				var seq=$('input:text[name=seq]').val();
				var name=$('input:text[name=name]').val();
				var svr_id=$('input:text[name=svr_id]').val();
				if ( seq && name && svr_id) {
					var dataSet = {};
					dataSet.seq = seq;
					dataSet.name=name;
					dataSet.svr_id=svr_id;
					$.ajax({
						url:"/insertUpdateEdition",
						type:"POST",
						data:dataSet,
						success:function(data){
							location.href = "/edition";
						},
						error:function(err){
							console.log(err);
						}
					});
				} else {
					alert("데이터를 입력하십시오.");
				}
			}
			
			function updateForm(seq) {
				$("span."+seq+"_text").hide(); // span 텍스트 값 숨기기
				$("input[name="+seq+"_seq]").attr("type", "text"); 	// input 값 보여주기
				$("input[name="+seq+"_name]").attr("type", "text"); 	// input 값 보여주기
				$("input[name="+seq+"_svr_id]").attr("type", "text"); 	// input 값 보여주기

				$("[name="+seq+"_updateBtn]").hide(); 		// 수정 버튼 숨기기
				$("[name="+seq+"_deleteBtn]").hide(); 		// 삭제 버튼 숨기기
				$("[name="+seq+"_saveBtn]").show(); 			// 저장 버튼 보이기
				$("[name="+seq+"_cancelBtn]").show(); 		// 취소 버튼 보이기
			}

			function cancelEdition(seq) {
				$("span."+seq+"_text").show(); // span 텍스트 값 보이기
				$("input[name="+seq+"_seq]").attr("type", "hidden"); 	// input 값 숨기기
				$("input[name="+seq+"_name]").attr("type", "hidden"); 	// input 값 숨기기
				$("input[name="+seq+"_svr_id]").attr("type", "hidden"); 	// input 값 숨기기

				$("[name="+seq+"_updateBtn]").show(); 		// 수정 버튼 보이기
				$("[name="+seq+"_deleteBtn]").show(); 		// 삭제 버튼 보이기
				$("[name="+seq+"_saveBtn]").hide(); 		// 저장 버튼 숨기기
				$("[name="+seq+"_cancelBtn]").hide(); 		// 취소 버튼 숨기기
			}

			function saveEdition(seq) {
				var seq=$('input:text[name='+seq+'_seq]').val();
				var name=$('input:text[name='+seq+'_name]').val();
				var svr_id=$('input:text[name='+seq+'_svr_id]').val();
				if ( seq && name && svr_id) {
					var dataSet = {};
					dataSet.seq = seq;
					dataSet.name=name;
					dataSet.svr_id=svr_id;
					$.ajax({
						url:"/insertUpdateEdition",
						type:"POST",
						data:dataSet,
						success:function(data){
							location.href = "/edition";
						},
						error:function(err){
							console.log(err);
						}
					});
				} else {
					alert("데이터를 입력하십시오.");
				}
			}

			function deleteEdition(seq) {
				$.ajax({
					url:"/deleteEdition",
					type:"GET",
					data:"seq="+seq,
					success:function(data){
						location.href = "/edition";
					},
					error:function(err){
						console.log(err);
					}

				});
			}
		</script>
		<div class="body">
			<form:form commandName="editionVo" name="editionForm" method="post" action="">
				<table>
					<tr>
						<td>ID</td>
						<td>Name</td>
						<td>SVC ID</td>
						<td></td>
					</tr>
					<tr>
						<td><input class="form-control" type="text" id="seq" name="seq"></td>
						<td><input class="form-control" type="text" id="name" name="name"></td>
						<td><input class="form-control" type="text" id="svr_id" name="svr_id"></td>
						<td><button type="button" onclick="insertAct()">추가</button></td>
					</tr>
				</table>
			</form:form>
			<table  class="lavalamp">
				<thead>
					<tr>
						<td>ID</td>
						<td>Name</td>
						<td>SVC ID</td>
						<td></td>
						<td></td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="edition" items="${editionList}">
						<tr>
							<td><span class="${edition.seq}_text"><c:out value="${edition.seq}" /></span>
								<input type="hidden" class="form-control" name="${edition.seq }_seq" value="${edition.seq}">
							</td>
							<td><span class="${edition.seq}_text"><c:out value="${edition.name}" /></span>
								<input type="hidden" class="form-control" name="${edition.seq }_name" value="${edition.name}">
							</td>
							<td><span class="${edition.seq}_text"><c:out value="${edition.svr_id}" /></span>
								<input type="hidden" class="form-control" name="${edition.seq }_svr_id" value="${edition.svr_id}">
							</td>
							<td><button type="button" name="${edition.seq }_updateBtn" onclick="updateForm('${edition.seq}')">수정</button>
								<button name="${edition.seq }_saveBtn" onclick="saveEdition('${edition.seq}')" style="display: none;">저장</button>
							</td>
							<td><button type="button" name="${edition.seq }_deleteBtn" onclick="deleteEdition('${edition.seq}')">삭제</button>
								<button name="${edition.seq }_cancelBtn" onclick="cancelEdition('${edition.seq}')" style="display: none;">취소</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</tiles:putAttribute>
</tiles:insertDefinition>
