<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page isELIgnored="false"%>

<fmt:setLocale value="${sessionScope.session_locale}" />
<fmt:setBundle basename="resource" />

<c:choose>
	<c:when test="${applicationScope.appConfig.serverConfig.isNull }">
		<div class="alert alert-danger" role="alert">
			<h3>裁判機無法正確讀取！</h3>
			無法取得裁判機資訊！請與管理員聯繫設定正確裁判機資訊或檢查裁判機是否正常運作。<br /> 請檢查：
			<ul>
				<li>裁判機是否正確開啓：請測試裁判機網路連線是否正常。</li>
				<li>裁判機是否允許本機連線： 請進入裁判機系統參數->允許進入IP
					查看是否列入本機IP。設定位址：http://[裁判機IP]/EditServerConfig</li>
				<li>裁判機與本機之間的加密鎖是否設定一致。</li>
				<li>測試免密碼登入裁判機是否成功：請進入本機終端機輸入 sudo -u zero ssh -p 22
					zero@[裁判機IP] 進行測試。</li>
			</ul>
			<!-- 			 *
			裁判機是否正確開啓：請測試裁判機網路連線是否正常。<br /> * 測試免密碼登入裁判機是否成功：請進入本機終端機輸入 sudo -u
			zero ssh -p 22 zero@[裁判機IP] 進行測試。<br /> * 測試裁判機是否允許本機進入：
			請進入裁判機系統參數->允許進入IP 查看是否列入本機IP。設定位址：http://[裁判機IP]/EditServerConfig<br />
 -->
		</div>
		<!-- 		<div style="font-size: larger; color: red;">
			<ul>
				<li>裁判機是否正確開啓：請測試裁判機網路連線是否正常。</li>
			</ul>
			無法取得裁判機資訊！請與管理員聯繫設定正確裁判機資訊或檢查裁判機是否正常運作。<br /> 請檢查：<br /> *
			裁判機是否正確開啓：請測試裁判機網路連線是否正常。<br /> * 測試免密碼登入裁判機是否成功：請進入本機終端機輸入 sudo -u
			zero ssh -p 22 zero@[裁判機IP] 進行測試。<br /> * 測試裁判機是否允許本機進入：
			請進入裁判機系統參數->允許進入IP 查看是否列入本機IP。設定位址：http://[裁判機IP]/EditServerConfig<br />
		</div>
 -->
	</c:when>
	<c:otherwise>
		<%-- 		<c:if test="${!applicationScope.appConfig.checkNopassRsync}">
			<div style="font-size: larger; color: red;">
				與裁判機的免密碼同步失敗，請管理員處理！</div>
		</c:if>
 --%>
	</c:otherwise>
</c:choose>
