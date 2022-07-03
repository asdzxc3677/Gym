<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>Title</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/mobile.css">

<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui-1.11.0.js"></script>
<script type="text/javascript" src="/resources/js/common/commonUtil.js"></script>
<script type="text/javascript" src="/resources/js/main/index.js"></script>
<script type="text/javascript">
	$(function(){
		Index.init();
	});
</script>
</head>
<body class="ex_topMenu">
	<div id="wrapper">
		<div class="topMenu">
			<div class="navi">
				<div id="title" class="title">
					<h1>
						<a href="/"><img src="/resources/img/fgym_logo.jpg"></a>
					</h1>
				</div>
				<div class="sideMenu">
					<ul>
						<li id="sideMenu_btn"><span class="sideMenu_ico"><a href="#" class="emico_menu" onclick="javascript:return false;"><span></span></a></span></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
<%-- 	<jsp:include page="./layout/header.jsp" flush="false"></jsp:include> --%>
	<jsp:include page="./layout/header.jsp" flush="false"></jsp:include>
	<h1>지옥같은 헬스장에 오신걸 환영합니다.</h1>
	<c:if test="${sessionScope.loginId == null}">
		<a href="/member/save-form">헬창들아 여기서 회원가입 하세요 </a>
	</c:if>
</body>
</html>
