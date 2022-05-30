<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" >
<head>
    <meta charset="UTF-8"/>
    <title>MOMO-LOGIN</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"/>
    <link rel="stylesheet" type="text/css" href="/css/main/login.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dis/css/bootstrap.min.css" rel="stylesheet"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>

<body>
<header class="text-center" style="margin-bottom: 50px">
    <div class="title"><a href="/">
        <img src="/img/main/logo.png" height="150px"></a>
    </div>
</header>
<section class="login-clean">
    <form
            method="post"
            action="/login"
            style="border: 1px solid lightgray; border-radius: 5px"
            id="logFrm">
<%--        <div th:if="${param.error}" class="form-group d-flex justify-content-center">--%>
<%--            <span th:text="${exception}" class="alert alert-danger"></span>--%>
<%--        </div>--%>
        <div class="mb-1" style="position: relative">
            <input class="form-control" type="text" placeholder="아이디" name="username"/>
<%--            <div class="icon">--%>
<%--                <span class="material-icons">person_outline</span>--%>
<%--            </div>--%>
        </div>
        <div class="mb-2" style="position: relative">
            <input class="form-control" type="password" placeholder="비밀번호" name="password"/>
<%--            <div class="icon">--%>
<%--                <span class="material-icons">lock</span>--%>
<%--            </div>--%>
        </div>
        <div style="float: left">
            <input type="submit" class="btn btn-primary" value="로그인"></button>
        </div>
        <div style="float: right">
            <input type="submit" style="background-color: white; width: 345px;margin-top:10px;height:35pt; border:1px solid #dfdfdf" class="btn btn-second" value="회원가입"></button>
<%--            <a href="/oauth2/authorization/google" class="btn d-flex justify-content-center"--%>
<%--               style="background-color: white; width: 345px;margin-top:10px;height:35pt; border:1px solid #dfdfdf">--%>
<%--                <div class="d-flex flex-column justify-content-center me-2">--%>
<%--                    <img src="/images/loginbtn/google-logo.png" width="20px">--%>
<%--                </div>--%>
<%--                <div class="d-flex flex-column justify-content-center">--%>
<%--                    Login with Google--%>
<%--                </div>--%>
<%--            </a>--%>
        </div>
        <div style="clear-after: both"></div>
        <div style="text-align: center; margin-top: 85px" class="findMe">
            <a href="/find/findId" style="text-decoration-line:none; color: gray; font-size: 12pt;">아이디 찾기 | </a>
            <a href="/find/findPw" style="text-decoration-line:none;color: gray; font-size: 12pt;">비밀번호 찾기 </a>
        </div>
        </div>
    </form>
</section>

<div class="container">
    <div th:replace="fragments/footer.html :: fragment-footer"></div>
</div>
</body>
</html>
