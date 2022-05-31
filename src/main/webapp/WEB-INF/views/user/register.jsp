<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" >
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="/css/user/register.css" />
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
<div class="container form-wrap">
    <form
            id="signUp-form"
            class="needs-validation"
            method="post"
<%--            th:action="@{/register/processRegister}"--%>
<%--            th:object="${user}"--%>
    >
        <div class="id-form">
            <label for="userId" class="form-label pretendard label-font-weight">아이디</label>
            <div class="d-flex">
                <input
                        type="text"
                        class="form-control input-border"
                        id="userId"
                        name="userId"
                        minlength="6"
                        maxlength="12"
                        placeholder="아이디는 최소 6자 최대 12자까지 입력해주세요."
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
            <div id="idError" class="error"></div>
            <div class="feedback-id"></div>
        </div>
        <div class="pw-form mt-2">
            <label for="password" class="form-label pretendard label-font-weight">비밀번호</label>
            <input
                    type="password"
                    class="form-control input-border"
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
            <label for="pwCheck" class="form-label pretendard label-font-weight">비밀번호 확인</label>
            <input
                    type="password"
                    class="form-control input-border"
                    id="pwCheck"
                    minlength="6"
                    maxlength="12"
                    placeholder="동일한 비밀번호를 입력해주세요."
            />
            <div id="passwordCheckError" class="error"></div>
            <div class="feedback-pwcheck"></div>
        </div>
        <div class="email-form mt-2">
            <label for="email" class="form-label pretendard label-font-weight">E-mail</label>
            <input
                    type="email"
                    class="form-control input-border"
                    id="email"
                    name="emial"
                    placeholder="xxxx@xxxx.xxx 형식으로 입력해주세요"
                    required
            />
            <div id="emailError" class="error"></div>
            <div class="feedback-email"></div>
        </div>
        <div class="tel-form mt-2">
            <label for="tel" class="form-label pretendard label-font-weight">휴대전화</label>
            <input
                    type="tel"
                    class="form-control input-border"
                    id="tel"
                    name="tel"
                    placeholder="01x-xxxx-xxxx 식으로 입력해주세요."
                    required
            />
            <div id="telError" class="error"></div>
            <div class="feedback-tel"></div>
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
<%--<div th:replace="fragments/footer.html :: fragment-footer"></div>--%>
<%--<script th:src="@{/js/main/navigo.js}"></script>--%>
</body>
</html>
