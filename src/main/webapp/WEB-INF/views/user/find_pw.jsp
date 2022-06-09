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
    var answer = ""
    function emailAuth() {
        if($("#form_email2").val() == '') {
            alert('이메일을 입력해주세요.');
            return false;
        }else if($("#form_email2").val() != ''){
            // 이메일 중복검사
            $.ajax({
                async : true,
                type : 'POST',
                data: $("#form_email2").val(),
                url: "/register/emailDuplicateCheck",
                dataType: "json",
                contentType: "application/json; charset=UTF-8",
                success: function(result) {
                    if(result.toString()==="false") {
                        alert('등록된 이메일이 아닙니다.');
                        return false;
                    }else if (confirm("입력하신 이메일로 인증 번호가 전송되었습니다.")) {
                        $(".find-clean>form>input[id='emailCode']").show();
                        // 이메일 인증번호 전송
                        $.ajax({
                            async: true,
                            type: 'GET',
                            data: {'email': $("#form_email2").val()},
                            url: "/findPw/byEmail",
                            dataType: "json",
                            contentType: "application/json; charset=UTF-8",
                            success: function (result) {
                                answer = result;
                                alert('해당 이메일 주소로 인증번호가 발송되었습니다.');

                            },
                            error: function (request, status, error) {
                                alert('code:' + request.status + '\n' + 'message:' + request.responseText + '\n' + 'error:' + error);
                            }
                        });

                    }
                },
                error: function (request, status, error) {
                    alert('code:' + request.status + '\n' + 'message:' + request.responseText + '\n' + 'error:' + error);
                }
            });
        }
    }

    function checkNum(){
        var input = $("#emailCode").val();
        if (input == answer) {
            alert('인증번호가 일치합니다.');
            $('#form_email_check').submit();
        }else {
            alert('인증번호가 일치하지 않습니다. 올바른 번호를 입력해주세요.');
        }
    }



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
            <div>
                <a href="/findId">아이디 찾기</a>
            </div>
            <div style="background:#00C471;">
                <a href="/findPw" style="color:#fff; font-weight:bold;">비밀번호 찾기 </a>
            </div>
        </div>

        <div class="find-clean">
            <h1>비밀번호 찾기</h1>
            <h5>비밀번호는 가입시 입력하신 이메일을 통해 찾을 수 있습니다.</h5>
            <form method="post" action="/findPw/reset" id="form_email_check" >
                <div class="email_box">
                    <input type="text" id="form_email2" name="email"
                           required="/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)?$/i"
                           placeholder="이메일"/>
                    <input type="button" id="emailAuthReqBtn" value="인증번호 받기" onclick="emailAuth()"/>
                </div>
                <input style="display: none;" type="text" name="code" id="emailCode" placeholder="인증번호"/>
                <button class="find_btn" type="button" onclick="checkNum()">찾기</button>
            </form>
        </div>
    </div>
</div>

<%@ include file="../main/main_footer.jsp" %>
</body>

</html>
