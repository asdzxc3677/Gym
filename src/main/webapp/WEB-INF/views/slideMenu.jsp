<%@ page language="java" contentType="text/html; charset=utf-8"    pageEncoding="utf-8"%>
<div id="tent" class="tent"></div>
<div class="sideMenu_lyr">
	<div class="aside_menu">
		<!--사용자 정보-->
		<div class="account_info">
			<div class="user">
				<span class="photo">
					<c:choose>
						<c:when test="${not empty loginUserInfo.profileThumbnailImg}"><img src="${pageContext.request.contextPath}/service/file/fileView?fileUrl=${loginUserInfo.profileThumbnailImg}" alt=""></c:when>
						<c:otherwise><img src="<spring:message code="imageServer"/>/resources/common/img/no_photo.gif" alt=""></c:otherwise>
					</c:choose>
				</span>
				<span class="name"><strong>${loginUserInfo.userName}</strong> ${loginUserInfo.posName}</span>
				<span class="dept">${loginUserInfo.deptName}</span>
			</div>
			<div class="optn">
				<button type="button" class="logout" onclick="MoblCommonUtil.fn.logout();"><span><spring:message code="common.button.logout" text="로그아웃" /></span></button>
			</div>
		</div>
		<!-- //사용자 정보-->
		<!-- SNB 영역 -->
		<div id="snb_area"></div>
		<!-- //SNB 영역 -->		
	</div>
	<!-- <button type="button" class="aside_lyr_close"><span>닫기</span></button> -->
	<a href="javascript:void(0);" class="aside_lyr_close">닫기</a>	
</div>
<script type="text/javascript">
	// 사이드 메뉴 오픈시 활성화 (모바일에서 전체 스크롤을 Disable시켜 스크롤시 사이드 메뉴가 깨지는 현상을 방지 #50134)
	jQuery('#blind').bind("touchmove",function(event){
		if(jQuery('.aside_lyr').css('display') == 'block'){
			event.preventDefault();
		}
	});
</script>