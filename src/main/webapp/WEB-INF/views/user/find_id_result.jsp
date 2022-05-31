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
<div class="container justify-content-center align-items-center" id="wrapped-all">
    <div class="d-flex align-items-end justify-content-start" id="nav-find">
        <h1>아이디 찾기</h1>
    </div>
    <div class="wrapped-findform">
        <h3 class="d-flex justify-content-center align-items-center justify-content-start" text="${message}"></h3>
    </div>
    <div class="d-flex justify-content-center">
        <a class="btn" id="cancel" href="/loginForm" type="button"><b>확인</b></a>
    </div>

    <div replace="fragments/footer.html :: fragment-footer"></div>
</div>
<%@ include file="../main/main_footer.jsp" %>
</body>
</html>
