<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-13
  Time: 오전 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="./layout/header.jsp" flush="false"></jsp:include>
<h1>지옥같은 헬스장에 오신걸 환영합니다.</h1>
<c:if test="${sessionScope.loginId == null}">
    <style>
        body{
            text-align: center;
        }
 h1{color: #bb2d3b;}
    </style>
<a href="/member/save-form">헬린이 들아 여기서 회원가입 하세요 </a>
</c:if>
<style>
    body{
        background-image: url("/resources/img/KakaoTalk_20220617_161827373.jpg");
        background-size: 100% 100%;
        background-repeat: no-repeat;
    }
</style>
</body>
</html>
