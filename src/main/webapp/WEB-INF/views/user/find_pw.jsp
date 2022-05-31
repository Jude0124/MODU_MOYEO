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
<div class="container justify-content-center align-items-center" id="wrapped-all">
    <div class="d-flex align-items-end justify-content-start" id="nav-find">
        <h1>비밀번호 찾기</h1>
    </div>
    <div class="wrapped-findform" style="height: 200px;">
        <h5>아이디를 입력해주세요</h5>
        <form method="get" action="/findPw/byEmail"
              class="d-flex justify-content-center align-items-center justify-content-start wrapped-find-input">
            <i class="bi bi-person"></i>
            <h1 class="d-flex justify-content-center align-items-center find-param">ID</h1>
            <input type="text" class="find-input" name="id">
            <button class="btn btn-primary find-button" type="submit">전송</button>
        </form>
        <div class="d-flex justify-content-center">
            <a class="btn" id="cancel" href="/" type="button"><b>취소</b></a>
        </div>

    </div>
</div>
<%@ include file="../main/main_footer.jsp" %>
</body>

</html>
