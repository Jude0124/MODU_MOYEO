<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" >
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <%--<link rel="stylesheet" type="text/css" href="/css/user/register.css" />--%>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
    />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" />
   <script src="@{/js/user/register.js}"></script>
    <title>회원가입 - 모두모여</title>
</head>
<body>
<header class="text-center" style="margin-bottom: 50px">
    <div class="title"><a href="/">
        <img src="/img/main/logo.png" height="150px"></a>
    </div>
</header>
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
                        required
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
            <label for="password" class="form-label">비밀번호 변경</label>
            <input
                    type="password"
                    class="form-control"
                    id="password"
                    name="password"
                    minlength="6"
                    maxlength="12"
                    placeholder="비밀번호는 최소 6자 최대 12자까지 입력해주세요."
                    required
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
                    required
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
                        required
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
                <select class="form-select" id="region" required>
                    <option value="" disabled selected >-- 내 지역 선택 --</option>
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
                value="회원가입"
                id="submit"
        />
    </form>
</div>
<%@ include file="../main/main_footer.jsp" %>
</body>
</html>
