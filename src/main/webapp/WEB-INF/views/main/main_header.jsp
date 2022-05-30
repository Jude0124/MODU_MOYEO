<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>모두모여</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/main/main_header.css" type="text/css"/>
</head>

<body>
    <div id="header">
        <div id="header_logo"> <!--  로고 -->
            <a href="/"><img src="/img/main/logo.png"/></a>
        </div>

        <div id="header_menu">
            <div id="login_box"><a href="#">로그인</a></div>
            <div id="signup_box"><a href="#">회원가입</a></div>
            <div id="logout_box"><a href="#">로그아웃</a></div>
            <div id="mypage_box"><a href="#">마이페이지</a></div>
            <div id="adminpage_box"><a href="#">관리자페이지</a></div>
        </div>
    </div>

</body>
</html>