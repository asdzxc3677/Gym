<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-13
  Time: 오전 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%-- 날짜서식 지정 --%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <style>
        #comment-write {
            max-width: 600px;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <h2>상세조회 detail.jsp</h2>
    <table class="table">
        <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>비밀번호</th>
            <th>내용</th>
            <th>작성일자</th>
            <th>조회수</th>
        </tr>
        <tr>
            <td>${board.id}</td>
            <td>${board.boardTitle}</td>
            <td>${board.boardWriter}</td>
            <td>${board.boardPassword}</td>
            <td>${board.boardContents}</td>
            <td>${board.boardCreatedDate}</td>
            <td>${board.boardHits}</td>
            <img src="${pageContext.request.contextPath}/upload/${board.boardFileName}"
                 alt="" height="100" width="100">
            <c:if test="${sessionScope.loginId == 'admin'}"> <%-- 관라자만 수정 삭제 할수 있게 처리 --%>
                <td><button onclick="boardUpdate()">수정</button> </td>
                <td><button onclick="boardDelete()">삭제</button> </td>
            </c:if>
            <c:if test="${board.boardWriter == sessionScope.loginId}"> <%-- 개인이 로그인 했을때에만 수정,삭제처리 --%>
                <td><button onclick="boardUpdate()">수정</button> </td>
                <td><button onclick="boardDelete()">삭제</button> </td>
            </c:if>
            <td><button onclick="paging()">페이지목록</button> </td>
        </tr>
    </table>
</div>
<div class="container mt-5"> <%-- 댓글작성 기능 --%>
    <div id="comment-write" class="input-group mb-3">
        <div class="form-floating">
            <input type="text" id="commentWrite" class="form-control"
                   value="${sessionScope.loginId}" readonly> <%-- 로그인한 값을 작성자에게 자동입력!  --%>
            <label for="commentWrite">작성자</label>
        </div>
        <div class="form-floating">
            <input type="text" id="commentContents" class="form-control" placeholder="내용">
            <label for="commentContents">내용</label>
        </div>
        <button id="comment-write-btn" class="btn btn-primary">댓글작성</button>
    </div>

    <div id="comment-list">  <%-- 댓글목록및 개인댓글삭제 및 관리자용삭제 기능 --%>
        <table class="table">
            <tr>
                <th>댓글번호</th>
                <th>작성자</th>
                <th>내용</th>
                <th>작성시간</th>
                <th>댓글삭제</th>
            </tr>
            <c:forEach items="${commentList}" var="comment">
                <tr>
                    <td>${comment.id}</td>
                    <td>${comment.commentWriter}</td>
                    <td>${comment.commentContents}</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${comment.commentCreatedDate}"></fmt:formatDate></td>
                    <c:if test="${sessionScope.loginId == 'admin'}"> <%-- 관리자만 삭제할수 있게 처리 --%>
                        <td><button onclick="commentDelete('${comment.id}')">삭제</button></td>
                    </c:if>

                    <c:if test="${comment.comment.commentWriter == sessionScope.loginId}"> <%-- 본인이 쓴 댓글만 삭제할수 있게 처리 --%>
                        <td><button onclick="commentDelete('${comment.id}')">삭제</button></td>
                    </c:if>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

</body>
<script>
    $("#comment-write-btn").click(function (){
        //댓글 작성자, 내용 가져오기
        //ajax 문법을 활용 /comment/save 주소로 post 방식으로 작성자,내용,글번호 이렇게 활용
        //alert 사용
        const cWriter = document.getElementById("commentWrite").value;
        const cContents = $("#commentContents").val();
        const boardId = '${board.id}';
        $.ajax({
            type: "post", <%-- Mapping 타입 get 이냐 post 인가  --%>
            url:"/comment/save", <%-- url 의미 주소값 --%>
            data:{ <%-- 서버로 넘겨줄 파라미터 --%>
              "commentWriter":cWriter,
              "commentContents":cContents,
              "boardId":boardId
            },
            dataType:"json",  <%-- 데이터 타입 : json  --%>
            success:function (result){
                console.log(result);
                let output ="<table class='table'>";
                output += "<tr><th>댓글번호</th>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th>";
                output += "<th>댓글삭제</th></tr>";
                for (let i in result){
                    output += "<tr>";
                    output += "<td>"+result[i].id+"</td>";
                    output += "<td>"+result[i].commentWriter+"</td>";
                    output += "<td>"+result[i].commentContents+"</td>";
                    output += "<td>"+moment(result[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss")+"</td>";
                    output += "<td><button onclick='commentDelete()'>삭제</button></td>";
                    output += "</tr>";
                }
                output += "</table>";
                document.getElementById('comment-list').innerHTML = output;
                document.getElementById('commentContents').value='';
            },
            error: function (){
                alert("어디가 틀렷노");
            }
        });
    });
    const paging = () =>{
        location.href = "/board/paging?page=${page}"; // 직전에 있었던 페이지 값을 컨트룰러로 요청
    }
    const boardUpdate = () => {
        // 수정을 위한 화면(update.jsp)을 출력하고, 비밀번호를 입력받아서
        // 비밀번호 일치하면 수정처리, 일치하지 않으면 alert(회원 수정이랑 프로세스 같음)
        location.href = "/board/update?id=${board.id}";
    }
    const boardDelete = () =>{
        // 비밀번호 체크를 위한 화면(passwordCheck.jsp)을 출력하고 비밀번호 입력받아서
        // 비밀번호 일치하면 삭제처리 후 목록 출력, 일치하지 않으면 alert 띄우고 상세화면으로
        location.href = "/board/passwordCheck?id=${board.id}";
    }
    const findAll = () => {
        location.href = "/board/findAll";
    }
    const commentDelete = (id) => {
        const boardId = '${board.id}';
        $.ajax({
            type: "get", <%-- Mapping 타입 get 이냐 post 인가  --%>
            url: "/comment/delete", <%-- url 의미 주소값 --%>
            data: {"id":id,"boardId":boardId}, <%-- 서버로 넘겨줄 파라미터 --%>
            dataType: "json", <%-- 데이터 타입 : json  --%>
            success:function (result){
                console.log(result);
                let output = "<table class='table'>";
                output += "<tr><th>댓글번호</th>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th>";
                output += "<th>댓글삭제</th></tr>";
                for (let i in result){
                    output += "<tr>";
                    output += "<td>"+result[i].id+"</td>";
                    output += "<td>"+result[i].commentWriter+"</td>";
                    output += "<td>"+result[i].commentContents+"</td>";
                    output += "<td>"+moment(result[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss")+"</td>";
                    output += "<td><button onclick='commentDelete(" + result[i].id + "})'>삭제</button></td>";
                    output += "</tr>";
                }
                output += "</table>";
                document.getElementById('comment-list').innerHTML = output;
                document.getElementById('commentContents').value='';
            },
            error:function (){
                alert("어디가 틀렷노");
            }
        });
    }
</script>
</html>
