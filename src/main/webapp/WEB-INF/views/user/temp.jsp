<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko" >
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>회원가입 - 모두모여</title>
    <link rel="shorcut icon" type="image/x-icon" href="/img/main/favicon.ico">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" />
    <script src="/js/user/register.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/user/register.css"/>
</head>


<body>
<%@ include file="../main/main_header.jsp" %>

<div id="register">
    <div id="register_box">
        <div class="title">
            <img src="/img/main/logo.png">
            <img src="/img/user/register.png">
        </div>

        <div class="register-clean">
            <form id="signUp-form" method="post" action="/register/processRegister">

                <label for="userId">아이디</label>
                <span class="msgError"></span><br/>
                <div class="id_box">
                    <input class="inputStyle" type="text" id="userId" name="id" placeholder="아이디"/>
                    <input type="button" class="checkBtn" value="중복확인" onclick="idCheck()"/>
                </div>
                <input type="hidden" name="checked_id" value="0" />

                <label for="password" >비밀번호</label>
                <span class="msgError"></span><br/>
                <input class="inputStyle" type="password" id="password" name="password" placeholder="비밀번호"/>

                <label for="pwCheck" >비밀번호 확인</label>
                <span class="msgError"></span><br/>
                <input class="inputStyle" type="password" id="pwCheck" placeholder="비밀번호 확인"/>


                <label for="nickname">닉네임</label>
                <span class="msgError"></span><br/>
                <div class="nick_box">
                    <input class="inputStyle" type="text" id="nickname" name="nickname" placeholder="닉네임"/>
                    <button type="button" class="checkBtn" style="background-color: #00C471; color: white"><i class="bi bi-arrow-clockwise"></i></button>
                </div>


                <label for="email">이메일</label>
                <span class="msgError"></span><br/>
                <input class="inputStyle" type="email" id="email" name="email" placeholder="이메일"/>


                <label for="region" class="form-label">내 지역</label>
                <span class="msgError"></span><br/>
                <select class="inputStyle" id="region" name="region">
                    <option value="" selected>-- 내 지역 선택 --</option>
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

                <input type="submit" class="btn_register" value="회원가입" id="submit"/>
            </form>
        </div>
    </div>
</div>

<%@ include file="../main/main_footer.jsp" %>
</body>
</html>
