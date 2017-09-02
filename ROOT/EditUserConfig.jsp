<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><jsp:include
	page="include/CommonHead_BootstrapFlat.jsp" />

<script type="text/javascript">
	jQuery(document).ready(function() {

		var config = $("#userconfig").attr("userconfig");
		jQuery("input[name='config']").each(function() {
			var index = parseInt($(this).val());
			if (config & (1 << index)) {
				$(this).attr("checked", true);
				config = config - (1 << index);
			}
		});

		jQuery("input[name='role']").each(function() {
			if ($(this).attr("role") == $(this).val()) {
				$(this).attr("checked", true);
			}
		});

		var privileges = jQuery("input[type=text][name=extraprivilege]").val();
		//	alert(privileges);
		var privilegearray = privileges.split(",");
		jQuery("input[name=extraprivilege]").each(function() {
			for (var i = 0; i < privilegearray.length; i++) {
				if (privilegearray[i] == $(this).val()) {
					$(this).attr("checked", true);
				}
			}
		});

		jQuery("input[name=extraprivilege]").click(function() {
			var newtext = "";
			jQuery("input[name=extraprivilege]:checked").each(function() {
				if (newtext == "") {
					newtext += jQuery(this).val();
				} else {
					newtext += "," + jQuery(this).val();
				}
			});
			jQuery("input[type=text][name=extraprivilege]").val(newtext);
		});

		$("button[type='submit']").bind("click", function(e) {
			e.preventDefault();

			var form = $(this).closest("form");
			// var action = form.attr("action");
			var action = window.location.pathname.split('/').pop();
			console.log("action=" + action);
			console.log("form=" + form.serialize());
			// 有其他 formdata 無 <form> 寫法。
			// http://www.jianshu.com/p/46e6e03a0d53
			jQuery.ajax({
				type : "POST",
				url : action,
				// data:
				// $('#form').serialize()+"&picture="+$('input[type="file"]').val(),
				cache : false,
				// data : new FormData(form[0]),
				data : form.serialize(),
				// processData : false,
				// contentType : false,
				async : true,
				timeout : 5000,
				success : function(result) {
					console.log("result=" + result);
					// window.location.href = document.referrer; // 跳轉到前一頁，並
					// reload
					BootstrapDialog.alert("使用者參數設定完成！");
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log("jqXHR.responseText=" + jqXHR.responseText);
					console.log("errorThrown=" + errorThrown);
					console.log("textStatus=" + textStatus);
					try {
						alert = jQuery.parseJSON(jqXHR.responseText);
						// BootstrapDialog.alert(alert.title);
						BootstrapDialog.show({
							title : alert.type,
							message : alert.title,
							buttons : [ {
								id : 'btn-ok',
								icon : 'glyphicon glyphicon-check',
								label : 'OK',
								cssClass : 'btn-primary',
								autospin : false,
								action : function(dialogRef) {
									dialogRef.close();
								}
							} ]
						});
					} catch (err) {
						BootstrapDialog.alert(errorThrown);
					}
				}
			});

		});

	});
</script>

</head>
<fmt:setLocale value="${sessionScope.session_locale}" />
<fmt:setBundle basename="resource" />
<body>
	<jsp:include page="include/Header_Fixed_Top.jsp" />
	<div class="container">
		<div class="row">

			<form name="form1" method="post" action="">
				<table class="table table-hover">
					<tr>
						<td width="112">帳號：</td>
						<td width="351">${user.account}</td>
					</tr>
					<tr>
						<td>公開暱稱：</td>
						<td><input name="username" type="text" id="username"
							value="${fn:escapeXml(user.username)}" size="30" maxlength="100" /></td>
					</tr>
					<tr>
						<td>真實姓名：</td>
						<td><input name="truename" type="text" id="truename"
							value="${fn:escapeXml(user.truename)}" size="20" maxlength="20" /></td>
					</tr>
					<tr>
						<td>出生年次:</td>
						<td><input name="birthyear" type="text" id="birthyear"
							value="${user.birthyear}" size="5" maxlength="5" /></td>
					</tr>
					<tr>
						<td>學校:</td>
						<td><select name="schoolid">
								<option value="0">選擇...</option>
								<c:forEach var="school" items="${schools}">
									<option value="${school.id}"
										<c:if test="${user.schoolid==school.id}">selected="selected"</c:if>>${school.id}.
										${fn:escapeXml(school.schoolname)}</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td>常用電子郵件：</td>
						<td><input name="email" type="text" id="email"
							value="${user.email}" size="50" maxlength="50" /></td>
					</tr>
					<tr>
						<td>備註：</td>
						<td><textarea name="comment" cols="50" rows="10" id="comment">${fn:escapeXml(user.comment)}</textarea></td>
					</tr>
					<tr>
						<td><div id="userconfig" userconfig="${user.config }">使用者參數：</div></td>
						<td><input type="checkbox" name="config" value="0" />該帳號是否有效？<br />
							若設定為失效，則該帳號無法登入系統，也看不到這個帳號。<br /> <input type="checkbox"
							name="config" value="1" />是否將該使用者指定為"優質"題目管理員？<br />
							(優質題目管理員可以直接將題目公開)<br /> <input name="config" type="checkbox"
							id="$ContestManager" value="2" /> 管理競賽的權限<br /> <input
							name="config" type="checkbox" id="InsertProblem" value="3" />
							新增題目的權限 (InsertProblem) <br /> <input name="config"
							type="checkbox" id="$ProblemManager" value="4" /> 修改題目的權限<br />
							<input name="config" type="checkbox" id="$VClassManager"
							value="5" /> 課程管理權限(可開設課程，進行“隨堂測驗”)<br /> <br /></td>
					</tr>
					<tr>
						<td>使用者角色</td>
						<td><c:forEach var="role"
								items="${sessionScope.onlineUser.editableROLEs}">
								<input name="role" type="radio" role="${user.role}"
									value="${role}" /> ${role}<br />
							</c:forEach></td>
					</tr>
				</table>

				<p>
					<input name="userid" type="hidden" value="${user.id}" /> <input
						name="account" type="hidden" value="${user.account}" />
					<button type="submit" class="btn btn-success">儲存</button>
				</p>
			</form>
		</div>
	</div>
	<jsp:include page="include/Footer.jsp" />
</body>
</html>
