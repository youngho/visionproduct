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
			function insertFunction() {
				var id=$('input:text[name=id]').val();
				var name=$('input:text[name=name]').val();
				var depth=$('input:text[name=depth]').val();
				var level=$('input:text[name=level]').val();
				var mnu_pos=$('input:text[name=mnu_pos]').val();
				var func_desc=$('input:text[name=func_desc]').val();
				if ( id && name) {
					var dataSet = {};
					dataSet.id = id;
					dataSet.name=name;
					dataSet.depth=depth;
					dataSet.level=level;
					dataSet.mnu_pos=mnu_pos;
					dataSet.func_desc=func_desc;
					$.ajax({
						url:"/insertUpdateFunction",
						type:"POST",
						data:dataSet,
						success:function(data){
							location.href = "/function";
						},
						error:function(err){
							console.log(err);
						}
					});
				} else {
					alert("데이터를 입력하십시오.");
				}
			}

			function updateForm(id) {
				$("span."+id+"_text").hide(); // span 텍스트 값 숨기기
				$("input[name="+id+"_id]").attr("type", "text"); 	// input 값 보이기
				$("input[name="+id+"_name]").attr("type", "text"); 	// input 값 보이기
				$("input[name="+id+"_depth]").attr("type", "text"); 	// input 값 보이기
				$("input[name="+id+"_level]").attr("type", "text"); 	// input 값 보이기
				$("input[name="+id+"_mnu_pos]").attr("type", "text"); 	// input 값 보이기
				$("input[name="+id+"_func_desc]").attr("type", "text"); 	// input 값 보이기

				$("[name="+id+"_updateBtn]").hide(); 		// 수정 버튼 숨기기
				$("[name="+id+"_deleteBtn]").hide(); 		// 삭제 버튼 숨기기
				$("[name="+id+"_saveBtn]").show(); 			// 저장 버튼 보이기
				$("[name="+id+"_cancelBtn]").show(); 		// 취소 버튼 보이기
			}

			function cancelFunction(id) {
				$("span."+id+"_text").show(); // span 텍스트 값 보이기
				$("input[name="+id+"_id]").attr("type", "hidden"); 	// input 값 숨기기
				$("input[name="+id+"_name]").attr("type", "hidden"); 	// input 값 숨기기
				$("input[name="+id+"_depth]").attr("type", "hidden"); 	// input 값 숨기기
				$("input[name="+id+"_level]").attr("type", "hidden"); 	// input 값 숨기기
				$("input[name="+id+"_mnu_pos]").attr("type", "hidden"); 	// input 값 숨기기
				$("input[name="+id+"_func_desc]").attr("type", "hidden"); 	// input 값 숨기기

				$("[name="+id+"_updateBtn]").show(); 		// 수정 버튼 보이기
				$("[name="+id+"_deleteBtn]").show(); 		// 삭제 버튼 보이기
				$("[name="+id+"_saveBtn]").hide(); 		// 저장 버튼 숨기기
				$("[name="+id+"_cancelBtn]").hide(); 		// 취소 버튼 숨기기
			}

			function saveFunction(id) {
				var id=$('input:text[name='+id+'_id]').val();
				var name=$('input:text[name='+id+'_name]').val();
				var depth=$('input:text[name='+id+'_depth]').val();
				var level=$('input:text[name='+id+'_level]').val();
				var mnu_pos=$('input:text[name='+id+'_mnu_pos]').val();
				var func_desc=$('input:text[name='+id+'_func_desc]').val();
				if ( id && name) {
					var dataSet = {};
					dataSet.id = id;
					dataSet.name=name;
					dataSet.depth=depth;
					dataSet.level=level;
					dataSet.mnu_pos=mnu_pos;
					dataSet.func_desc=func_desc;
					$.ajax({
						url:"/insertUpdateFunction",
						type:"POST",
						data:dataSet,
						success:function(data){
							location.href = "/function";
						},
						error:function(err){
							console.log(err);
						}
					});
				} else {
					alert("데이터를 입력하십시오.");
				}
			}

			function deleteFunction(id) {
				$.ajax({
					url:"/deleteFunction",
					type:"GET",
					data:"id="+id,
					success:function(data){
						location.href = "/function";
					},
					error:function(err){
						console.log(err);
					}

				});
			}
		</script>
		<div class="body">
			<form:form commandName="functionVo" name="functionForm" method="post" action="">
				<table>
					<tr>
						<td>ID</td>
						<td>Name</td>
						<td>DEPTH</td>
						<td>LEVEL</td>
						<td>MNU_POS</td>
						<td>FUNC_DESC</td>
						<td></td>
					</tr>
					<tr>
						<td><input class="form-control" type="text" id="id" name="id"></td>
						<td><input class="form-control" type="text" id="name" name="name"></td>
						<td><input class="form-control" type="text" id="depth" name="depth"></td>
						<td><input class="form-control" type="text" id="level" name="level"></td>
						<td><input class="form-control" type="text" id="mnu_pos" name="mnu_pos"></td>
						<td><input class="form-control" type="text" id="func_desc" name="func_desc"></td>
						<td><button type="button" onclick="insertFunction()">추가</button></td>
					</tr>
				</table>
			</form:form>
			<table  class="lavalamp">
				<thead>
					<tr>
						<td>ID</td>
						<td>Name</td>
						<td>DEPTH</td>
						<td>LEVEL</td>
						<td>MNU_POS</td>
						<td>FUNC_DESC</td>
						<td></td>
						<td></td>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="func" items="${functionList}">
					<tr>
						<td><span class="${func.id}_text"><c:out value="${func.id}" /></span>
							<input type="hidden" class="form-control" name="${func.id }_id" value="${func.id}">
						</td>
						<td><span class="${func.id}_text"><c:out value="${func.name}" /></span>
							<input type="hidden" class="form-control" name="${func.id }_name" value="${func.name}">
						</td>
						<td><span class="${func.id}_text"><c:out value="${func.depth}" /></span>
							<input type="hidden" class="form-control" name="${func.id }_depth" value="${func.depth}">
						</td>
						<td><span class="${func.id}_text"><c:out value="${func.level}" /></span>
							<input type="hidden" class="form-control" name="${func.id }_level" value="${func.level}">
						</td>
						<td><span class="${func.id}_text"><c:out value="${func.mnu_pos}" /></span>
							<input type="hidden" class="form-control" name="${func.id }_mnu_pos" value="${func.mnu_pos}">
						</td>
						<td><span class="${func.id}_text"><c:out value="${func.func_desc}" /></span>
							<input type="hidden" class="form-control" name="${func.id }_func_desc" value="${func.func_desc}">
						</td>
						<td><button type="button" name="${func.id }_updateBtn" onclick="updateForm('${func.id}')">수정</button>
							<button name="${func.id }_saveBtn" onclick="saveFunction('${func.id}')" style="display: none;">저장</button>
						</td>
						<td><button type="button" name="${func.id }_deleteBtn" onclick="deleteFunction('${func.id}')">삭제</button>
							<button name="${func.id }_cancelBtn" onclick="cancelFunction('${func.id}')" style="display: none;">취소</button>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</tiles:putAttribute>
</tiles:insertDefinition>
