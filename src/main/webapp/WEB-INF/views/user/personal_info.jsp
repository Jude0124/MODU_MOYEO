<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>회원정보 수정 - 모두모여</title>
    <link rel="shorcut icon" type="image/x-icon" href="/img/main/favicon.ico">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" />
    <script src="/js/user/personal_info.js"></script>
    <link rel="stylesheet" href="/css/user/personal_info.css" type="text/css"/>
    <style>
    </style>
</head>
<body>
<%@ include file="../main/main_header.jsp" %>

<div id="personal_info">
    <div id="personal_info_box">
        <div class="title">
            <img src="/img/main/logo.png">
            <img src="/img/user/personal_info.png">
        </div>

        <div class="personal_info-clean">
            <form id="personal_info-form" method="post" action="/personalInfo">
                <label for="userId">아이디</label>
                <span class="msgError"></span><br/>
                <input class="inputStyle" type="text" id="userId" name="id"
                       placeholder="아이디" value="${userInfo.id}" readonly/>

                <label for="password" class="form-label">비밀번호 변경</label>
                <span class="msgError"></span><br/>
                <input class="inputStyle" type="password" id="password"
                       name="password" placeholder="비밀번호" value="${userInfo.password}"/>

                <label for="pwCheck" >비밀번호 확인</label>
                <span class="msgError"></span><br/>
                <input class="inputStyle" type="password" id="pwCheck"
                       placeholder="비밀번호 확인" value=""/>

                <label for="nickname">닉네임</label>
                <span class="msgError"></span><br/>
                <input class="inputStyle" type="text" id="nickname" name="nickname"
                       placeholder="닉네임" value="${userInfo.nickname}" readonly/>

                <label for="email">이메일</label>
                <span class="msgError"></span><br/>
                <div class="email_box">
                <input class="inputStyle" type="email" id="email" name="email"
                       placeholder="이메일" value="${userInfo.email}"/>
                    <input type="button" class="checkBtn" value="중복확인" onclick="emailCheck()"/>
                    <input type="hidden" id="emailCheckResult" value=""/>
                </div>

                <label for="region" class="form-label">내 지역</label>
                <span class="msgError"></span><br/>
                <input type="hidden" id="userRegion" value="${userInfo.region}">
                <select class="inputStyle" id="region" name="region">
                    <option value="" selected>-- 내 지역 선택 --</option>
                    <option value="강남구">강남구</option>
                    <option value="강동구">강동구</option>
                    <option value="강북구">강북구</option>
                    <option value="강서구">강서구</option>
                    <option value="관악구">관악구</option>
                    <option value="광진구">광진구</option>
                    <option value="구로구">구로구</option>
                    <option value="금천구">금천구</option>
                    <option value="노원구">노원구</option>
                    <option value="도봉구">도봉구</option>
                    <option value="동대문구">동대문구</option>
                    <option value="동작구">동작구</option>
                    <option value="마포구">마포구</option>
                    <option value="서대문구">서대문구</option>
                    <option value="서초구">서초구</option>
                    <option value="성동구">성동구</option>
                    <option value="성북구">성북구</option>
                    <option value="송파구">송파구</option>
                    <option value="양천구">양천구</option>
                    <option value="영등포구">영등포구</option>
                    <option value="용산구">용산구</option>
                    <option value="은평구">은평구</option>
                    <option value="종로구">종로구</option>
                    <option value="중구">중구</option>
                    <option value="중랑구">중랑구</option>
                </select>
                <input type="hidden" id="checkPwChange" value="">
                <input type="hidden" id="checkEmailChange" value="">
                <input type="hidden" id="checkRegionChange" value="">
                <input type="submit" class="btn_edit" value="정보수정" id="submit"/>
            </form>
        </div>
    </div>
</div>
<script>
    $(()=>{
        /* 유저 지역정보 확인하여 selected */
        $('#region').val($('#userRegion').val()).prop("selected",true);

        if ($('#email').val() === "${userInfo.email}"){
            $('#emailCheckResult').val('success');
        }

        /* 페이지 클릭 시 마다 유저 정보와 수정된 정보 확인 */
        $(document).click(function(e){
            if ($('#password').val() !== "${userInfo.password}"){
                $('#checkPwChange').val('false');
            } else $('#checkPwChange').val('');

            if ($('#email').val() !== "${userInfo.email}"){
                $('#checkEmailChange').val('false');
            }else $('#checkEmailChange').val('');

            if ($('#region').val() !== "${userInfo.region}"){
                console.log($('#region').val() )
                $('#checkRegionChange').val('false');
            }else $('#checkRegionChange').val('');
        } );
    });

    /* email 중복체크 버튼 */
    function emailCheck() {
        var error = document.querySelectorAll('.msgError');
        const email = $('#email').val();
        reg = /^\w{5,20}[@]{1}[a-zA-Z]{2,8}[.]{1}[a-zA-Z]{2,4}([.][a-zA-Z]{2,4})?$/;
        if (email === "${userInfo.email}"){
            alert('변경 내용이 없습니다.')
            return ;
        }
        if(email===''){
            error[4].innerHTML = "이메일을 입력하세요.";
            error[4].style.display = "inline-block";
            error[4].style.color = "red";
            $("#email").focus();
        }else if(!reg.test($("#email").val())){
            error[4].innerHTML = "이메일을 확인해주세요.";
            error[4].style.display = "inline-block";
            error[4].style.color = "red";
            $("#email").focus();
        }else {
            $.ajax({
                async : true,
                type : 'POST',
                data: email,
                url: "/register/emailDuplicateCheck",
                dataType: "json",
                contentType: "application/json; charset=UTF-8",
                success: function(result) {
                    if(result.toString()==="false") {
                        error[4].style.display = "none";
                        alert('사용 가능한 이메일입니다.')
                        $('#emailCheckResult').val('success')
                    } else{
                        alert('이미 사용중인 이메일입니다. 다른 이메일을 입력해주세요.')
                    }
                },
                error: function (request, status, error) {
                    alert('code:' + request.status + '\n' + 'message:' + request.responseText + '\n' + 'error:' + error);
                }
            });
        }
    }
</script>
<%@ include file="../main/main_footer.jsp" %>
</body>
</html>
