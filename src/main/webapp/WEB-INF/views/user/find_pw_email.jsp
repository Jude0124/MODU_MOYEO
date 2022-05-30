<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../user/common.jsp" %>
<%@ include file="../user/common_header.jsp" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>모두모여</title>
</head>
<body>
<div class="container justify-content-center align-items-center" id="wrapped-all">
    <div class="d-flex align-items-end justify-content-start" id="nav-find">
        <h1>비밀번호 찾기</h1>
    </div>
    <div class="wrapped-findform" style="height: 220px;">
        <h5>회원정보에 등록한 이메일로 인증</h5>
        <div class="justify-content-start wrapped-find-input">
            <div class="d-flex common-aligns-center">
                <i class="bi bi-envelope"></i>
                <h1 class="d-flex common-aligns-center find-param">이메일 주소</h1>
                <input type="hidden" value="${userId}" name="id" id="id">
                <input type="text" class="find-input" name="email" id="email" placeholder="ex) momo@gmail.com">
                <button class="btn find-button" id="emailAuthReqBtn" type="button">인증번호 받기</button>
            </div>
            <form class="d-flex auth-form" style="padding-left: 21px;align-items: center" id="emailAuthForm" method="post"
                  action="/findPw/reset">
                <i class="bi bi-arrow-right-circle"></i>
                <h1 class="d-flex find-param">인증번호</h1>
                <input type="hidden" value="${userId}" name="id">
                <input type="text" class="auth-input" name="code" id="emailCode" placeholder="인증번호 6자리 숫자 입력">
                <div id="emailTimer"></div>
            </form>
            <div class="d-flex common-aligns-center">
                <button class="btn" id="emailAuth" type="submit" form="emailAuthForm"><b>확인</b></button>
                <a class="btn" href="/login" type="button"><b>취소</b></a>
            </div>
        </div>
    </div>
    <div replace="fragments/footer.html :: fragment-footer"></div>
</div>
<script src="@{/js/user/find-pw-auth.js}"></script>
</body>
</html>
