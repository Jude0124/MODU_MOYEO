<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <title>비밀번호 찾기 - 모두모여</title>
</head>
<body>
<div class="container common-aligns-center">
    <div class="d-flex align-items-end justify-content-start" id="nav-find">
        <h1>비밀번호 재설정</h1>
    </div>
    <div class="justify-content-start wrapped-findform">
        <h5 class="find-title">비밀번호를 다시 설정해주세요</h5>
        <form class="wrapped-find-input" method="post" action="/changePw">
            <div class="d-flex common-aligns-center">
                <i class="bi bi-lock"></i>
                <h1 class="d-flex common-aligns-center find-param">비밀번호</h1>
                <input type="hidden" value="${userId}" name="id" id="id">
                <input type="password" class="find-input" name="password" id="password"
                       placeholder="6자 이상 12자 이하의 영문+숫자">
            </div>
            <div class="d-flex common-aligns-center" style="margin-top: 7px; padding-bottom: 30px">
                <i class="bi bi-lock"></i>
                <h1 class="d-flex common-aligns-center find-param">비밀번호 확인</h1>
                <input type="password" class="find-input" id="passwordVal"
                       placeholder="비밀번호를 다시 한 번 입력해주세요.">
            </div>
            <div class="d-flex justify-content-center">
                <button class="btn" id="pwSubmit" type="submit"><b>확인</b></button>
            </div>
        </form>
    </div>
</div>
<%@ include file="../main/main_footer.jsp" %>
<script src="@{/js/user/find-pw-success.js}"></script>
</body>
</html>
