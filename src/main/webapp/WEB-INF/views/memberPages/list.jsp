<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-13
  Time: 오전 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="/resources/js/jquery.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <h2>헬창회원들 정보 list.jsp</h2>
    <a href="/">시작페이지로 이동</a><br>
    <div class="container">
        <table class="table">
            <tr>
                <th>Number</th>
                <th>Id</th>
                <th>pw</th>
                <th>Name</th>
                <th>Birth</th>
                <th>Gender</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Datail(ajax)</th>
                <th>Delete</th>
            </tr>
            <c:forEach items="${memberList}" var="member">
                <tr>
                    <td>${member.id}</td>
                    <td>${member.memberId}</td>
                    <td>${member.memberPassword}</td>
                    <td>${member.memberName}</td>
                    <td>${member.memberBirth}</td>
                    <td>${member.memberGender}</td>
                    <td>${member.memberEmail}</td>
                    <td>${member.memberPhone}</td>
                    <td><button class="btn btn-outline-info" onclick="detailByAjax('${member.id}')">조회</button></td>
                    <td><a href="/member/delete?id=${member.id}">비매너 회원 강퇴</a></td>
                </tr>
            </c:forEach>
        </table>
        <div id="detail">

        </div>
    </div>
</body>
<script>
    const detailByAjax = (id) => { <%-- ajax 상세조회 부분 --%>
        console.log(id);
        const detail = document.getElementById("detail");
        $.ajax({
            type:"get", <%-- Mapping 타입 get 이냐 post 이느냐  --%>
            url:"detail-ajax", <%-- url 의미 주소값 --%>
            data:{"id":id},  <%-- ajax의 데이터를 담는 과정?  --%>
            dataType:"json",  <%-- 데이터 타입 : json  --%>
            success:function (result){
                let output = "<table class='table'>";
                output += "<tr>" +
                    "<th>회원번호</th> <th>아이디</th> <th>비번</th> <th>이름</th>" +
                    "<th>생년월일</th> <th>성별</th> <th>이메일</th> <th>폰번호</th>" +
                    "</tr>";
                output += "<tr>";
                output += "<tr>";
                output += "<td>" + result.id                  + "</td>";
                output += "<td>" + result.memberId            + "</td>";
                output += "<td>" + result.memberPassword      + "</td>";
                output += "<td>" + result.memberName          + "</td>";
                output += "<td>" + result.memberBirth         + "</td>";
                output += "<td>" + result.memberGender        + "</td>";
                output += "<td>" + result.memberEmail         + "</td>";
                output += "<td>" + result.memberPhone         + "</td>";
                output += "</tr>";
                output += "</table>";

                detail.innerHTML = output;
            },
            error: function () {
                alert("오타체크");
            }
        });
    }
</script>
</html>
