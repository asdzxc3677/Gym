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
    <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css">
</head>
<body>
<jsp.include page="../layot/header.jsp" flush=""false></jsp.include>
<div class="container">
    <h2 class="display-4 fw-normal">헬창회원들 글쓰는곳 saveFile.jsp</h2>
    <div class="py-5 text-center">
        <form action="/board/saveFile" method="post" enctype="multipart/form-data">
            <%--enctype="multipart/form-data" 은 파일첨부를 만들수 있게 해준다. --%>
                <input type="text" class="form-control mb-2" name="boardTitle" placeholder="제목"><br>
                <input type="text" class="form-control mb-2" name="boardWriter" value="${sessionScope.loginId}" readonly>
                <%-- value="${sessionScope.loginId} 세션에 저장된 로그인 아이디값을 가지고 왔다. --%>
                <input type="text" class="form-control mb-2" name="boardPassword" placeholder="비번"><br>
                <textarea class="form-control mb-2" name="boardContents" cols="10" rows="5" placeholder="내용"></textarea>
                <%-- cols:세로(행)  rows:가로(열) --%>
                첨부파일:<input type="file" name="boardFile">
                <input type="submit" class="btn btn-primary" value="글작성"><br>
        </form>
    </div>
</div>
</body>
</html>
