﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false"%>

<c:if test="${user.isEnabled==true}">
	<span><c:if test="${user.isAuthhost_Google && fn:length(user.pictureblob)>0 }">
			<img src="${user.pictureBase64 }" class="img-rounded"
				style="width: 1.4em;" title="${user.email }">
		</c:if> <a href="./UserStatistic?id=${user.id}">${user.account}</a> (${fn:escapeXml(user.username)})
		<%-- (${fn:substring(fn:escapeXml(user.username),0,15)}) --%>
	</span>
	<%-- <a href="./UserStatistic?id=${user.id}">${fn:escapeXml(user.account)}</a> --%>
</c:if>
<c:if test="${user.isEnabled==false}">
	<span style="text-decoration: line-through;"> <a
		href="./UserStatistic?id=${user.id}"> ${fn:escapeXml(user.account)}</a>
	</span>
</c:if>
