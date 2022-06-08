<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>비밀번호 찾기 - 모두모여</title>
    <link rel="shorcut icon" type="image/x-icon" href="/img/main/favicon.ico">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/user/find.css" type="text/css"/>
</head>

<script>
    $(()=>{
        $("#form_change_pw").submit(function(){
            // 비밀번호 유효성검사
            var reg = /^[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{5,15}$/;
            if($("#form_pw").val()==''){
                alert("비밀번호를 입력하세요.");
                $("#form_pw").focus();
                return false;
            }else if(!reg.test($("#form_pw").val())){
                alert("5~15자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
                $("#form_pw").focus();
                return false;
            }

            // 비밀번호 확인 유효성검사
            if($("#form_pw2").val() != $("#form_pw").val()){
                alert("비밀번호가 일치하지 않습니다.");
                $("#form_pw2").focus();
                return false;
            }
        });
    });



</script>
<body>
<%@ include file="../main/main_header.jsp" %>

<div id="find">
    <div id="find_box">
        <div class="title">
            <img src="/img/main/logo.png">
            <img src="/img/user/find.png">
        </div>

        <div class="find_menu">
            <div >
                <a href="/findId" >아이디 찾기</a>
            </div>
            <div style="background:#00C471;">
                <a href="/findPw" style="color:#fff; font-weight:bold;">비밀번호 찾기 </a>
            </div>
        </div>

        <div class="find-clean">
            <h1>비밀번호 재설정</h1>
            <h5>새로운 비밀번호를 입력해주세요.</h5>

            <form method="post" action="/changePw" id="form_change_pw">
                <input type = "hidden" name = "email" value = ${email}>
                <input type="password" class="find-input" name="password" id="form_pw"
                       placeholder="새 비밀번호">

                <input type="password" class="find-input" id="form_pw2"
                       placeholder="비밀번호 확인">

                <button class="find_btn" id="pwSubmit" type="submit"><b>확인</b></button>
            </form>

        </div>

    </div>
</div>

<%@ include file="../main/main_footer.jsp" %>
</body>
</html>
