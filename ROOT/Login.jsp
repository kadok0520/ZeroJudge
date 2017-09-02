<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:setLocale value="${sessionScope.session_locale}" />
<fmt:setBundle basename="resource" />
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="include/CommonHead_BootstrapFlat.jsp" />
<script type="text/javascript">
	jQuery(document).ready(function() {
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
					console.log("returnPage=" + result);
					returnPage = jQuery.parseJSON(result);
					//window.location.href = document.referrer;
					window.location.href = returnPage.currentPage;
					// 跳轉到前一頁，並 reload

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

<body>
	<jsp:include page="include/Header_Fixed_Top.jsp" />

	<div class="container">
		<div class="row"></div>
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4 text-center">
				<form class="form-horizontal" method="post" action="Login">
					<div class="form-group">
						<label class="sr-only" for="account">account</label>
						<div class="input-group">
							<div class="input-group-addon">帳號：</div>
							<input type="text" class="form-control" id="account"
								placeholder="請輸入帳號" name="account">
						</div>
					</div>
					<div class="form-group">
						<label class="sr-only" for="password">password</label>
						<div class="input-group">
							<div class="input-group-addon">密碼：</div>
							<input type="password" class="form-control" id="passwd"
								placeholder="請輸入密碼" name="passwd">
						</div>
					</div>
					<button type="submit" class="btn btn-primary">登入</button>
					<!-- <a href="./ForgetPassword">忘記密碼？</a> --> <input type="hidden"
						name="returnPage" value="${sessionScope.returnPages[0]}" /><input
						type="hidden" name="token" value="${token}" />
				</form>
				<c:if test="${applicationScope.appConfig.isGoogleLoginSetup}">
					<hr>
					<a href="./GoogleLogin" class="btn btn-primary btn-lg btn-block">用
						Google 登入</a>
					<hr>
					<a href="./InsertGoogleUser" class="btn btn-primary btn-lg btn-block">
						用 Google 帳號註冊新帳號</a>
				</c:if>
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>
	<jsp:include page="include/Footer.jsp" />
</body>
</html>
