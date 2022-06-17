<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-13
  Time: 오전 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        .container{
            max-width: 500px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>헬린이 회원들 로그인창 login.jsp</h2>
    <div class="py-5 text-center">
        <form action="/member/login" method="post">
            <input class="form-control mb-2" type="text" name="memberId" placeholder="아이디">
            <input class="form-control mb-2" type="text" name="memberPassword" placeholder="비밀번호">
            <input class="btn btn-primary" type="submit" value="로그인">
        </form>
    </div>
</div>
<style>
    body{
        background-image: url("/resources/img/KakaoTalk_20220617_162459560.jpg");
        background-size: 40% 100%;
        background-position: center;
        background-repeat: no-repeat;
    }
</style>
</body>
</html>
