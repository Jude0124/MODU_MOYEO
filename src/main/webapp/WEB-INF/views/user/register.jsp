<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../main/main_header.jsp" %>
<%@ include file="../user/common.jsp" %>
<%@ include file="../user/common_header.jsp" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>회원정보 수정 - 모두모여</title>
    <link rel="stylesheet" href="/css/user/mypage.css" type="text/css"/>
    <script src="/js/main/header.js"></script>
    <script src="/js/user/mypage-validation.js"></script>
    <style>
        .field-error {
            border-color: #dc3545 !important;
            color: #dc3545 !important;
        }
    </style>
</head>
<body>
<div class="container form-wrap" style="max-width: 540px">
    <form
            id="signUp-form"
            class="needs-validation"
            method="post"
            action="/register/processRegister"
    >
        <div class="id-form">
            <label for="userId" class="form-label">아이디</label>
            <div class="d-flex">
                <input
                        type="text"
                        class="form-control"
                        id="userId"
                        name="userId"
                />
                <input
                        type="button"
                        class="btn w-25"
                        style="background-color: #00C471; color: white"
                        value="중복확인"
                        onclick="idCheck()"
                />
                <input type="hidden" name="checked_id" value="" />
            </div>
        </div>
        <div class="pw-form mt-2">
            <label for="password" class="form-label">비밀번호</label>
            <input
                    type="password"
                    class="form-control"
                    id="password"
                    name="password"
                    minlength="6"
                    maxlength="12"
                    placeholder="비밀번호는 최소 6자 최대 12자까지 입력해주세요."
            />
            <div id="passwordError" class="error"></div>
            <div class="feedback-pw"></div>
        </div>
        <div class="pw-check-form mt-2">
            <label for="pwCheck" class="form-label">비밀번호 확인</label>
            <input
                    type="password"
                    class="form-control"
                    id="pwCheck"
                    minlength="6"
                    maxlength="12"
                    placeholder="동일한 비밀번호를 입력해주세요."
            />
            <div id="passwordCheckError" class="error"></div>
            <div class="feedback-pwcheck"></div>
        </div>
        <div class="nick-name-form mt-2">
            <label for="nick-name" class="form-label">닉네임</label>
            <div class="d-flex">

                <input
                        type="text"
                        class="form-control input-border"
                        id="nick-name"
                        name="nick-name"
                />
                <button
                        type="button"
                        class="btn w-25"
                        style="background-color: #00C471; color: white"
                        disabled
                ><i class="bi bi-arrow-clockwise"></i></button>
            </div>

        </div>
        <div class="email-form mt-2">
            <label for="email" class="form-label">E-mail</label>
            <input
                    type="email"
                    class="form-control"
                    id="email"
                    name="email"
                    placeholder="xxxx@xxxx.xxx 형식으로 입력해주세요"
                    required
            />
            <div id="emailError" class="error"></div>
            <div class="feedback-email"></div>
        </div>
        <div class="region-form mt-2">
            <label for="region" class="form-label">내 지역</label>
            <div>
                <select class="form-select" id="region">
                    <option disabled selected>-- 내 지역 선택 --</option>
                    <option value="1">강남구</option>
                    <option value="2">강동구</option>
                    <option value="3">강북구</option>
                    <option value="4">강서구</option>
                    <option value="5">관악구</option>
                    <option value="6">광진구</option>
                    <option value="7">구로구</option>
                    <option value="8">금천구</option>
                    <option value="9">노원구</option>
                    <option value="10">도봉구</option>
                    <option value="11">동대문구</option>
                    <option value="12">동작구</option>
                    <option value="13">마포구</option>
                    <option value="14">서대문구</option>
                    <option value="15">서초구</option>
                    <option value="16">성동구</option>
                    <option value="17">성북구</option>
                    <option value="18">송파구</option>
                    <option value="19">양천구</option>
                    <option value="20">영등포구</option>
                    <option value="21">용산구</option>
                    <option value="22">은평구</option>
                    <option value="23">종로구</option>
                    <option value="24">중구</option>
                    <option value="25">중랑구</option>
                </select>
            </div>
        </div>
        <input
                type="submit"
                class="btn w-100 mt-3"
                style="background-color: #00C471; color: white"
                value="가입하기"
                id="submit"
        />
    </form>
</div>
<%@ include file="../main/main_footer.jsp" %>
</body>
</html>
