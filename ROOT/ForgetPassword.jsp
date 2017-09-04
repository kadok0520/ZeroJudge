<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="include/CommonHead.jsp" />
</head>
<fmt:setLocale value="${sessionScope.session_locale}" />
<fmt:setBundle basename="resource" />
<body>
	<jsp:include page="include/Header.jsp" />
	<br />
	<div class="content_individual">
		<div class="contestbox">
			<form id="form1" name="form1" method="post" action="">
				<div align="center">
					<br />
					<fmt:message key="ForgetPassword.Account" />
					： <input name="account" type="text" id="account" /> <br />
					<fmt:message key="ForgetPassword.Email" />
					： <input name="email" type="text" id="email" size="30" /> <br />
					<br />
					<fmt:message key="ForgetPassword.MailtoYourMailbox" />
					<br /> <br /> <input type="submit" class="button" name="Submit"
						value="<fmt:message key="ForgetPassword.Submit" />" />
				</div>
			</form>
			<br />
		</div>
		<br /> <br />
	</div>
	<jsp:include page="include/Footer.jsp" />
</body>
</html>
