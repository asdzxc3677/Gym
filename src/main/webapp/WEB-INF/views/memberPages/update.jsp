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
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<h2>개인정보수정 update.jsp</h2>
<form action="/member/update" method="post" name="updateForm">
    번호:<input type="text" name="id" value="${updateMember.id}" readonly><br>
    계정:<input type="text" name="memberId" value="${updateMember.memberId}" readonly><br>
    비번:<input type="text" name="memberPassword" id="pwConfirm" placeholder="비밀번호입력"><br>
    이름:<input type="text" name="memberName" value="${updateMember.memberName}"><br>
    나이:<input type="text" name="memberAge" value="${updateMember.memberAge}"><br>
    전화번호:<input type="text" name="memberPhone" value="${updateMember.memberPhone}">
    <input type="button" class="btn btn-primary" onclick="memberUpdate()" value="정보수정">
</form>
</body>
<script>
    const memberUpdate = () =>{
        console.log("update 함수호출");
        const pwConfirm = document.getElementById("pwConfirm").value;
        const pwDB = '${updateMember.memberPassword}';
        console.log("pwConfirm" + pwConfirm + ",pwDB" + pwDB);
        if (pwConfirm == pwDB){
            updateForm.submit();
        }else {
            alert("비밀번호가 안맞습니다.")
        }
    }
</script>
</html>
