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
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<h2>헬창들 수정처리 update.jsp</h2>
<form action="/board/update" method="post" name="updateForm">
    <input type="text" name="id" value="${boardUpdate.id}" class="" readonly><br>
    <input type="text" name="boardTitle" value="${boardUpdate.boardTitle}" class=""><br>
    <input type="text" name="boardPassword" id="passwordConfirm" class="" placeholder="비번"><br>
    <input type="text" name="boardWriter" value="${boardUpdate.boardWriter}" class="" readonly><br>
    <textarea name="boardContents" id="" cols="30" rows="10">${boardUpdate.boardContents}</textarea><br>
    <input type="button" class="" value="수정" onclick="boardUpdate()"><br>
</form>
</body>
<script>
    const boardUpdate = () =>{
        const passwordConfirm = document.getElementById("passwordConfirm").value;
        const passwordDB = '${boardUpdate.boardPassword}';
        if (passwordConfirm == passwordDB){
            updateForm.submit();
        }else {
            alert("비번 안맞습니다. 뇌에 근육만 꽉차신거 같습니다. ")
        }
    }
</script>
</html>
