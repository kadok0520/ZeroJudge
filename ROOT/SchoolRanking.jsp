<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false"%>
<fmt:setLocale value="${sessionScope.session_locale}" />
<fmt:setBundle basename="resource" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><jsp:include
	page="include/CommonHead_BootstrapFlat.jsp" />
<script type="text/javascript">
	jQuery(document).ready(function() {
		var url = document.location.toString();
		console.log("url=" + url);
		if (url.match('#')) {
			console.log("url.split('#')[1]=" + url.split('#')[1]);
			console.log('.nav-tabs a[aria-controls="' + url.split('#')[1] + '"]');
			//$('.nav-tabs').find('[aria-controls="' + url.split('#')[1] + '"]').tab('show');
			$('.nav-tabs a[aria-controls="' + url.split('#')[1] + '"]').tab('show');
		}

	});
</script>
</head>

<body>
	<jsp:include page="include/Header_Fixed_Top.jsp" />
	<div class="container">
		<div class="row">
			<div id="monthly" class="hint">近一個月內曾經登入者的排名</div>
			<fmt:message key="Ranking.Descript" />
			<ul class="nav nav-tabs" role="tablist">
				<li class="active"><a href="./Ranking?tab=tab02#tab02"
					aria-controls="tab02" role="presentation"><fmt:message
							key="Ranking.AllUsers" /></a></li>
				<c:if
					test="${ sessionScope.onlineUser!=null || applicationScope.CacheUsers[sessionScope.onlineUser.account]!=null}">
					<li><a href="./Ranking?tab=tab03#tab03" aria-controls="tab03"
						role="presentation">校內排名</a></li>
				</c:if>
				<li><a href="./SchoolRanking?tab=tab04#tab04"
					aria-controls="tab04" role="presentation">校際排名</a></li>
			</ul>
			<br />
			<table class="table table-hover">
				<tr>
					<td width="40"><fmt:message key="Ranking.Rank" /></td>
					<td>學校</td>
					<td colspan="6"><div align="center">統計</div></td>
				</tr>
				<c:choose>
					<c:when test="${fn:length(SchoolRanking)!=0}">
						<c:forEach var="list" items="${SchoolRanking}" varStatus="status">
							<tr id="${list.schoolid}">
								<td width="7%">${status.count+((pagenum-1)*fn:length(SchoolRanking))}</td>
								<td><span style="float: left;">${fn:escapeXml(list.schoolname)}
										<span style="font-size: smaller">(AVG: <fmt:formatNumber
												value="${list.schoolavg}" pattern="#.#" />)
									</span>
								</span> <c:if test="${sessionScope.onlineUser.isDEBUGGER}">
										<span style="display: inline; float: right;"
											class="DEBUGGEROnly"><a
											href="./Ranking?tab=tab03&schoolid=${list.schoolid}">校內排名</a>
											<c:if test="${fn:startsWith(list.url,'http://')}"> | <a
													href="${list.url}" target="_blank"><span
													class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
											</c:if> </span>
									</c:if></td>
								<td width="25%"><div align="right"
										style="font-size: smaller">${list.schoolac}AC/
										${list.count}人</div></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="10" style="text-align: center;"><fmt:message
									key="NO_DATA" /></td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
			<jsp:include page="include/Pagging.jsp">
				<jsp:param name="querystring" value="${querystring}" />
			</jsp:include>
			<ul id="tabmenu">
			</ul>
		</div>
	</div>
	<jsp:include page="include/Footer.jsp" />
</body>
</html>
