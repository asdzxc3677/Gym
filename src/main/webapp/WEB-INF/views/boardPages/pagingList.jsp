<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-13
  Time: 오전 10:43
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
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<%-- 검색창 띄우는 작업 --%>
<div class="container mt-3">
    <form action="/board/search" method="get">
        <select name="searchType">
            <option value="boardTitle">제목</option>
            <option value="boardWriter">작성자</option>
        </select>
        <input type="text" name="q" placeholder="검색어입력">
        <input type="submit" value="검색">
    </form>
</div>

<div class="container"> <%-- 글목록 띄어주는? 아리까리함 --%>
    <%-- 글번호,글제목,작성자,작성날짜,조회수 등등 DTO필드 하나씩 띄우는 출력해주는 작업  --%>
    <table class="table">
        <tr>
            <th>글번호</th>
            <th>작성자</th>
            <th>제목</th>
            <th>작성시간</th>
            <th>조회수</th>
        </tr>
        <c:forEach items="${boardList}" var="board">
            <%-- forEach를 써서 글번호,글제목,작성자,작성날짜,조회수 등등 DTO필드 하나씩 띄우는 출력해주는 작업  --%>
        <tr>
            <td>${board.id}</td>
            <td>${board.boardWriter}</td>
            <td><a href="/board/detail?page=${paging.page}&id=${board.id}">${board.boardTitle}</a></td>
            <td><fmt:formatDate pattern="yyy-MM-dd hh:mm:ss"
                                value="${board.boardCreatedDate}"></fmt:formatDate></td>
            <td>${board.boardHits}</td>
        </tr>
        </c:forEach>
    </table>
</div>

<div class="container"> <%-- 페지징 처리하는 작업 ul,li 는 리스트를 띄어주기 위한 테그--%>
    <ul class="pagination justify-content-center">
        <c:choose>
            <%-- 현재페이지가 1페이지면 이전 글자만 보여줌 --%>
            <c:when test="${paging.page<=1}"> <%-- if와 동일 <c:choose> <c:when> 한셋트 --%>
                <li class="page-item disabled">
                    <a class="page-link">[이전]</a>
                </li>
            </c:when>
            <%-- 1페이지가 아닌 경우에는 [이전]을 클릭하면 현재 페이지보다 1 작은 페이지 요청 --%>
            <c:otherwise> <%-- else와 동일 --%>
                <li class="page-item">
                    <a class="page-link" href="/board/paging?page=${paging.page-1}">[이전]</a>
                </li>
            </c:otherwise>
        </c:choose>

        <%-- for(int i=startPage; i<=endPage; i++) --%>
        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
            <c:choose>
                <%-- 요청한 페이지에 있는 경우 현재 페이지 번호는 텍스트만 보이게 --%>
                <c:when test="${i eq paging.page}">
                    <li class="page-item active">
                        <a class="page-link">${i}</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/board/paging?page=${i}">${i}</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:choose> <%-- 다음페이지 요청하는 조건식 --%>
            <c:when test="${paging.page>=paging.maxPage}">
                <li class="page-item disabled">
                    <a class="page-link">다음</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/board/paging?page=${paging.page+1}">[다음]</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>

</body>
</html>
