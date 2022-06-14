<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-13
  Time: 오전 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<h2>개인회원정보 detail.jsp</h2>
<div class="container">
    <table class="table">
        <tr>
            <th>회원정보</th>
            <th>아이디</th>
            <th>비번</th>
            <th>이름</th>
            <th>생년월일</th>
            <th>성별</th>
            <th>이메일</th>
            <th>핸드폰번호</th>
            <th>정보수정</th>
            <th>삭제</th>
        </tr>
            <tr>
               <td>${member.id}</td>
               <td>${member.memberId}</td>
               <td>${member.memberPassword}</td>
               <td>${member.memberName}</td>
               <td>${member.memberBirth}</td>
               <td>${member.memberGender}</td>
               <td>${member.memberEmail}</td>
               <td>${member.memberPhone}</td>
                <td><button class="btn btn-outline-info" onclick="update()">정보수정</button> </td>
                <td><button class="btn btn-primary" id="delete" onclick="deleteMember()">도망</button> </td>
            </tr>
    </table>
    <div id="detail"></div>
</div>
</body>
<script>
    function update(){ <%-- 개인 회원수정 처리--%>
        location.href="/member/update-form"
    }
    function deleteMember(){ <%-- 개인 회원탈퇴 할때 확인용도 처리 --%>
        let result = confirm("도망치시겟습니까") <%--confirm 확인창 띄어주는 메서드 --%>
        const memberId = "${member.id}";
        if (result){
            location.href="/member/delete?id=" + memberId;
            alert("중도포기하다니 어리석군요. ")
        }else {
            alert("현명한 선택이오")
        }
    }
</script>
</html>
