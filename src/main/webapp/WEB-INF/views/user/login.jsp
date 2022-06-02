<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" >
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>로그인 - 모두모여</title>
    <link rel="shorcut icon" type="image/x-icon" href="/img/main/favicon.ico">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/user/login.css"/>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
</head>


<body>
<%@ include file="../main/main_header.jsp" %>

<div id="login">
    <div id="login_box2">
        <div class="title">
            <img src="/img/main/logo.png">
            <img src="/img/user/login.png">
        </div>
        <spring:hasBindErrors name="loginDTO">
            <c:if test = "${errors.hasGlobalErrors()}">
                <strong>${errors.globalError()}</strong>
            </c:if>
        </spring:hasBindErrors>
        <div class="login-clean">
            <form method="post" action="/login" id="logFrm">
                <div class="form_box">
                    <input class="form_id" type="text" placeholder="아이디" name="id" maxlength="20"/>
                    <input class="form_pwd" type="password" placeholder="비밀번호" name="password" maxlength="20"/>
                    <input type="submit" class="btn_login" value="로그인"></input>
                <div class="loginUtil">
                    <a href="/findId">아이디 찾기</a>
                    |
                    <a href="/findPw">비밀번호 찾기 </a>
                    |
                    <a href="/register">회원가입</a>
                </div>
                </div>

            </form>
        </div>
    </div>

</div>


<%@ include file="../main/main_footer.jsp" %>
</body>

</html>
