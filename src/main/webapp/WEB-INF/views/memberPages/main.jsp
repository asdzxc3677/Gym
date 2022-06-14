<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-13
  Time: 오전 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%-- <c:if>를 쓰기위한 용도 --%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>헬창회원 임시 페이지 main.jsp</h2>
    로그인 회원 정보:${loginMember}<br>
    세션에 담은 회원아이디:${sessionScope.loginId}<br>
    세션에 담은 id:${sessionScope.loginId}<br>
    <button class="btn btn-primary" onclick="updateForm()">수정</button>
    <button class="btn bth-outline-success" onclick="saveFileForm()">글작성(file)</button>
    <button class="btn btn-outline-success" onclick="paging()">페이지목록</button>
    <c:if test="${sessionScope.loginMemberId eq 'admin'}">
    <a href="/findAll">관리자용 회원목록</a>
    </c:if>  <%-- admin이라는 관리자 아이디를 썻을때만 '관리자용 회원목록'이 보이게만 처리
     sessionScope 는 세션에 저장되어있을때 불러오는 명령어 eq: 는 == 와 같은 문법--%>
    <c:if test="${sessionScope.loginId eq 'admin'}">
    <button type="button" class="" onclick="memberList()">회원정보</button>
    </c:if> <%-- 이것도 관리자만 보일수 있게 처리 --%>
    <button type="button" class="" onclick="logout()">로그아웃</button>

    <button type="button" class="" onclick="detail()">내정보</button>
</body>
<script>
    const updateForm = () => {
        location.href = "/member/update-form";
    }
    const saveFileForm = () =>{
        location.href = "/board/saveFile";
    }
    const paging = () =>{
        location.href = "/board/paging";
    }
    const memberList = () =>{
        location.href = "/member/findAll";
    }
    const logout = () =>{
        location.href = "/member/logout";
    }
    const detail = () =>{
        location.href = "/member/detail";
    }

</script>
</html>
