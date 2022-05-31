<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../user/common.jsp" %>
<%@ include file="../main/main_header.jsp" %>
<%@ include file="../user/common_header.jsp" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>아이디 찾기 - 모두모여</title>
</head>
<body>
<div class="container common-aligns-center">
    <div class="d-flex align-items-end justify-content-start" id="nav-find">
        <h1>아이디 찾기</h1>
    </div>
    <div class="wrapped-findform">
        <div>
            <h5 class="find-title">등록된 휴대전화 번호로 찾기</h5>
            <form class="d-flex common-aligns-center wrapped-find-input"
                  method="post" action="/findId/byTel" >
                <i class="bi bi-phone"></i>
                <h1 class="d-flex common-aligns-center find-param">전화번호</h1>
                <input type="text" class="find-input" placeholder="ex) 010-1234-5678" name="tel">
                <button class="btn find-button" type="submit">찾기</button>
            </form>
        </div>
        <div style="margin-top: 40px;">
            <h5 class="find-title">등록된 이메일 계정으로 찾기</h5>
            <form class="d-flex common-aligns-center wrapped-find-input"
                  method="post" action="/findId/byEmail">
                <i class="bi bi-envelope"></i>
                <h1 class="d-flex common-aligns-center find-param">이메일 계정</h1>
                <input type="text" class="find-input" placeholder="ex) momo@gmail.com" name="email">
                <button class="btn find-button" type="submit">찾기</button>
            </form>
        </div>
        <div class="d-flex justify-content-center">
            <a class="btn" id="cancel" href="/login" type="button"><b>취소</b></a>
        </div>
    </div>
</div>
<%@ include file="../main/main_footer.jsp" %>
</body>
</html>
