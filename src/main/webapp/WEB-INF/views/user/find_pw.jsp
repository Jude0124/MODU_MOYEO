<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>비밀번호 찾기 - 모두모여</title>
    <link rel="shorcut icon" type="image/x-icon" href="/img/main/favicon.ico">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/user/find.css" type="text/css"/>
</head>

<script>
    function emailAuth() {
        if (confirm("입력하신 이메일로 인증 번호가 전송되었습니다.")) {
            $(".find-clean>form>input[id='emailCode']").show();
        } else {
            return false;
        }
    }


</script>

<body>
<%@ include file="../main/main_header.jsp" %>

<div id="find">
    <div id="find_box">
        <div class="title">
            <img src="/img/main/logo.png">
        </div>

        <div class="find_menu">
            <div>
                <a href="/findId">아이디 찾기</a>
            </div>
            <div style="background:#00C471;">
                <a href="/findPw" style="color:#fff; font-weight:bold;">비밀번호 찾기 </a>
            </div>
        </div>

        <div class="find-clean">
            <h1>비밀번호 찾기</h1>
            <h5>비밀번호는 가입시 입력하신 이메일을 통해 찾을 수 있습니다.</h5>
            <form method="get" action="/findPw/byEmail">
                <div class="email_box">
                    <input type="text" id="form_email2" name="email"
                           required="/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)?$/i"
                           placeholder="이메일"/>
                    <input type="submit" id="emailAuthReqBtn" value="인증번호 받기" onclick="emailAuth()"/>
                </div>
            </form>
            <form class="code-sent">
                <input style="display: none;" type="text" name="code" id="emailCode" placeholder="인증번호"/>
                <button class="find_btn" type="submit">찾기</button>
            </form>
            <script>
                $(".find_btn").click(function submitCheck() {
                    if (${num} ===
                    document.getElementById("emailCode").value
                )
                    {
                        alert("메일 인증이 완료되지 않았습니다.");
                        return false;
                    }
                })
            </script>
        </div>
    </div>
</div>

<%@ include file="../main/main_footer.jsp" %>
</body>

</html>
