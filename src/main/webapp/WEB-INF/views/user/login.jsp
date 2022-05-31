<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" >
<head>
    <meta charset="UTF-8"/>
    <title>로그인 - 모두모여</title>
    <link rel="shorcut icon" type="image/x-icon" href="/img/main/favicon.ico">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/main/login.css"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>


<body>
<%@ include file="../main/main_header.jsp" %>

<div id="login">
    <div id="login_box2">
        <div class="title">
            <img src="/img/main/logo.png">
            <img src="/img/login/login.png">
        </div>

        <div class="login-clean">
            <form method="post" action="/login" id="logFrm">
                <div class="form_box">
                    <input class="form_id" type="text" placeholder="아이디" name="id" maxlength="20"/>
                    <input class="form_pwd" type="password" placeholder="비밀번호" name="password" maxlength="20"/>
                    <input type="submit" class="btn_login" value="로그인"></input>
                <div class="loginUtil">
                    <a href="/find/findId">아이디 찾기</a>
                    |
                    <a href="/find/findPw">비밀번호 찾기 </a>
                    |
                    <a href="#">회원가입</a>
                </div>
                </div>

            </form>
        </div>
    </div>

</div>


<%@ include file="../main/main_footer.jsp" %>
</body>

</html>
