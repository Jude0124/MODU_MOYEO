<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>모두모여</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/main/main_footer.css" type="text/css"/>
    <script src="/js/main/main_footer.js"></script>
</head>

<body>
    <div id="footer">
        <div class="footA"> MoMo </div>
        <div class="footB"> Copyright © MoMo All Rights Reserved. </div>
    </div>

    <button type="button" class="mobile_menu"><i class="fas fa-bars"></i></button>
    <div class="menu_wrap">
        <nav id="menu">
            <div id="mobile_logo"> <!--  로고 -->
                <a href="/"><img src="/img/main/logo.png"/></a>
            </div>

            <div id="mo_menu">
                <div id="login_box"><a href="#">로그인</a></div>
                <div id="signup_box"><a href="#">회원가입</a></div>
            </div>

            <form id="mobile_search_box">
                <input type="text" placeholder="검색 지역을 입력해 주세요"/>
                <button>검색</button>
            </form>

            <hr/>

            <ul class="category_list">
                <li><a href="#">강남구</a></li>
                <li><a href="#">강동구</a></li>
                <li><a href="#">강북구</a></li>
                <li><a href="#">강서구</a></li>
                <li><a href="#">관악구</a></li>
                <li><a href="#">광진구</a></li>
                <li><a href="#">구로구</a></li>
                <li><a href="#">금천구</a></li>
                <li><a href="#">노원구</a></li>
                <li><a href="#">도봉구</a></li>
                <li><a href="#">동대문구</a></li>
                <li><a href="#">동작구</a></li>
                <li><a href="#">마포구</a></li>
                <li><a href="#">서대문구</a></li>
                <li><a href="#">서초구</a></li>
                <li><a href="#">성동구</a></li>
                <li><a href="#">성북구</a></li>
                <li><a href="#">송파구</a></li>
                <li><a href="#">양천구</a></li>
                <li><a href="#">영등포구</a></li>
                <li><a href="#">용산구</a></li>
                <li><a href="#">은평구</a></li>
                <li><a href="#">종로구</a></li>
                <li><a href="#">중구</a></li>
                <li><a href="#">중랑구</a></li>
            </ul>
        </nav>
    </div>

</body>

</html>