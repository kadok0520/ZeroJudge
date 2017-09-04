<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false"%>
<fmt:setLocale value="${sessionScope.session_locale}" />
<fmt:setBundle basename="resource" />

<style type="text/css">
.navbar-center {
	display: inline-block;
	float: none;
	vertical-align: top;
}

.navbar-collapse-center {
	text-align: center;
}

.dropdown-submenu {
	position: relative;
}

.dropdown-submenu>.dropdown-menu {
	top: 0;
	left: 100%;
	margin-top: -6px;
	margin-left: -1px;
	-webkit-border-radius: 0 6px 6px 6px;
	-moz-border-radius: 0 6px 6px;
	border-radius: 0 6px 6px 6px;
}

.dropdown-submenu:hover>.dropdown-menu {
	display: block;
}

.dropdown-submenu>a:after {
	display: block;
	content: " ";
	float: right;
	width: 0;
	height: 0;
	border-color: transparent;
	border-style: solid;
	border-width: 5px 0 5px 5px;
	border-left-color: #ccc;
	margin-top: 5px;
	margin-right: -10px;
}

.dropdown-submenu:hover>a:after {
	border-left-color: #fff;
}

.dropdown-submenu.pull-left {
	float: none;
}

.dropdown-submenu.pull-left>.dropdown-menu {
	left: -100%;
	margin-left: 10px;
	-webkit-border-radius: 6px 0 6px 6px;
	-moz-border-radius: 6px 0 6px 6px;
	border-radius: 6px 0 6px 6px;
}

.bs-docs-header, .bs-docs-masthead {
	color: rgba(148, 189, 225, 1);
	/*background-color: rgb(63, 88, 111); */ /*自訂 大標底色*/
	/*background-color: #8ca3c3;*/ /* zerojudge 原色加深 */
	background-color: #5d6c82; /* zerojudge 原色加深加深 */
	background-image: none;
}
</style>

<div class="bs-docs-header" id="content" tabindex="-1">
	<div class="container">
		<img src="${applicationScope.appConfig.titleImageBase64}"
			title="${applicationScope.appConfig.title}"
			alt="${applicationScope.appConfig.title}"><br />
		${applicationScope.appConfig.header}<br />
	</div>
</div>
<script type="text/javascript" src="include/div/ZeroJudge_Navbar.js"></script>
<jsp:include page="/include/Modals/Modal_SetUserPassword.jsp" />
<nav class="navbar navbar-default navbar-static-top" role="navigation">
	<jsp:include page="div/ZeroJudge_Navbar.jsp" />
</nav>
