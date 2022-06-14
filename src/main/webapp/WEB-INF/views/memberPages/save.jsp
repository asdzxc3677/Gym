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
    <script src="/resources/js/jquery.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        .container{
            max-width: 500px;
        }

    </style>
</head>
<body>

<div class="container">
    <h2 class="display-4 fw-normal">헬창들 회원가입 페이지 save.jsp</h2>
    <div class="py-5 text-center">
        <form action="/member/save" method="post">
            <input type="text" class="form-control mb-2" onblur="duplicateCheck()" id="memberId" name="memberId" placeholder="아이디"><br>
            <p id="dup-check-result"></p>
            <input type="password" class="form-control mb-2" onblur="passCheck()" id="Password" name="memberPassword" placeholder="비밀번호"><br>
            <p id="pw-check-result"></p>
            <input type="password" class="form-control mb-2" onblur="passCheck()" id="passwordCheck" placeholder="비밀번호 확인"><br>
            <input type="text" class="form-control mb-2" id="memberName" name="memberName" placeholder="이름"><br>

            <div class="input-group">
            <input type="text" class="form-control mb-2" id="memberBirth" name="memberBirth" placeholder="생년"> &nbsp;
            <input type="text" class="form-control mb-2" id="BirthDay" name="memberBirth" placeholder="월일">
            </div><br> <%-- 생년월일 처럼 input 막대기가 2개로 이쁘게 되려면  <div class="input-group"> 적어야된다. --%>

            <input type="text" class="form-control mb-2" id="memberGender" name="memberGender" placeholder="성별"><br>
            <input type="text" class="form-control mb-2" id="memberEmail" name="memberEmail" placeholder="이메일"><br>
            <input type="text" class="form-control mb-2" id="memberPhone" name="memberPhone" placeholder="핸폰번호"><br>
            <input type="submit" value="Welcome to Hellchang">
        </form>
    </div>
</div>
</body>
<script> <%-- 아이디중복체크 --%>
    const duplicateCheck = () =>{
        const memberId = document.getElementById("memberId").value;
        const checkResult = document.getElementById("dup-check-result");
        $.ajax({
            type:"post", <%-- get,post중에 선택 --%>
            url:"/member/duplicate-check", <%-- 리턴값을 받을 Mapping이름 --%>
            data:{"memberId":memberId},
            dataType:"text",<%-- 데이타타입 : text --%>
            success:function (result){
                if (result == "ok"){
                    checkResult.innerHTML = "멋진 아이디 입니다."
                    checkResult.style.color = "green";
                }else {
                    checkResult.innerHTML = "아이디가 중복됬잖어!! 뇌가 근육으로 가득찼습니까"
                    checkResult.style.color = "red";
                }
            },
            error: function (){
                alert("오타체크");
            }
        });
    }
    const passCheck = () =>{ <%-- 비밀번호 alert 형태로 확인 문법 추가함  --%>
        const memberPassword = document.getElementById("Password").value;
        const passCheck = document.getElementById("passwordCheck").value;
        const checkResult = document.getElementById("pw-check-result");
        if(memberPassword.length < 3) {
            alert('입력한 글자가 3글자 이상이어야 합니다 알겟습니까');
        }
        if( memberPassword != passCheck ) {
            checkResult.innerHTML = "일치하지않습니다. 뇌에 근육만 가득찼습니까"
            checkResult.style.color = "red";
        } else{
            checkResult.innerHTML = "일치합니다 잘했습니다."
            checkResult.style.color = "blue";
        }
    }
</script>
</html>
