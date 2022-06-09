<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>모두모여</title>
    <link rel="shorcut icon" type="image/x-icon" href="/img/main/favicon.ico">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/main/main_header.css" type="text/css"/>
</head>

<body>
    <div id="header">
        <div id="header_logo"> <!--  로고 -->
            <a href="/"><img src="/img/main/logo.png"/></a>
        </div>

        <div id="header_menu">
            <c:if test="${sessionScope.loginUser==null}">
                <div id="login_box"><a href="/login">로그인</a></div>
                <div id="signup_box"><a href="/register">회원가입</a></div>
            </c:if>
            <c:if test="${sessionScope.loginUser!=null}">
                <div id="logout_box"><a href="/logout">로그아웃</a></div>
                <div id="mypage_box"><a href="/personalInfo">내 정보</a></div>
            </c:if>
            <c:set var = "id" value="${sessionScope.loginUser.getId()}"/>
            <c:if test="${fn:contains(id, 'admin')}">
                <div id="adminpage_box"><a href="/admin">관리자페이지</a></div>
            </c:if>
        </div>
    </div>

</body>
</html>