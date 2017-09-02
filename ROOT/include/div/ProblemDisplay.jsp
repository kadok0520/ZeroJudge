<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false"%>

<c:if test="${problem.display != problem.DISPLAY_OPEN}">
	<span class="glyphicon glyphicon-eye-close"></span>
	<%-- 	<img src="images/problem_${problem.display}.svg"
		title="${problem.display}" style="height: 1.2em;" />
 --%>
</c:if>
