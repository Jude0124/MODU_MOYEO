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
                    <input type="text" id="code" name="code" placeholder="인증번호"/>
                </div>
                <button class="find_btn" type="submit">비밀번호 변경하기</button>
            </form>
        </div>
    </div>
</div>

<%@ include file="../main/main_footer.jsp" %>
</body>

</html>