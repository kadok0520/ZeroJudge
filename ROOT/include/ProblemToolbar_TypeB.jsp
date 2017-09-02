<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="problem" uri="http://jiangsir.tw/jstl/problem"%>

<%@ page isELIgnored="false"%>

<fmt:setLocale value="${sessionScope.session_locale}" />
<fmt:setBundle basename="resource" />

<c:if
	test="${sessionScope.onlineUser.isDEBUGGER || sessionScope.onlineUser.isCanUpdateProblem(problem)}">
	<%-- 	<span style="text-align: left;" id="problemToolbar"
		problemid="${problem.problemid}"> <jsp:include
			page="dialog/ProblemSetting.jsp" /><img src="images/svg/Setting.svg"
		style="height: 1.2em;" title="快速設定" id="ProblemSettings"
		class="FakeLink" problemid="${problem.problemid }" />
	</span>
 --%>
	<div class="btn-group btn-group-sm" role="group" aria-label="...">
		<button type="button" class="btn btn-default" data-toggle="modal"
			data-target="#Modal_ProblemSetting_${problem.problemid }"
			title="ProblemSetting">
			<span class="glyphicon glyphicon-cog"></span>
		</button>
	</div>
</c:if>
