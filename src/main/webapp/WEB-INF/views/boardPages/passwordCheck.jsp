<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-13
  Time: 오전 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <h2>PasswordCheck.jsp</h2>
<form action="/board/detail" method="post">
    <lable for="passwordConfirm">비밀번호 입력하세요</lable>
    <input type="text" id="passwordConfirm"><br>
    <input type="button" onclick="passwordCheck()">
</form>
</body>
<script>
    const passwordCheck = () =>{
        const passwordConfirm = document.getElementById("passwordConfirm").value;
        const passwordDB = '${board.boardPassword}';
        if (passwordConfirm == passwordDB){
            location.href = "/board/delete?id=${board.id}";
        }else {
            alert("비번이 안맞습니다. 머리까지 근육으로 가득찼습니까 ")
            location.href = "/board/detail?id=${board.id}";
        }
    }
</script>
</html>
