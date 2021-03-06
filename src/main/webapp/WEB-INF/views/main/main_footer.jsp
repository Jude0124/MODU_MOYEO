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
        <div class="footB"> Copyright 2022. MoMo. All Rights Reserved. </div>
    </div>

    <button type="button" class="mobile_menu"><i class="fas fa-bars"></i></button>
    <div class="menu_wrap">
        <nav id="menu">
            <div id="mobile_logo"> <!--  로고 -->
                <a href="/"><img src="/img/main/logoside.png"/></a>
            </div>

            <div id="mo_menu">
                <c:if test="${sessionScope.loginUser==null}">
                    <div id="login_box_footer">
                        <img src="/img/main/login_icon.png"/>
                        <div>
                            <a href="/login">로그인</a>
                        </div>
                    </div>
                    <div id="signup_box_footer">
                        <img src="/img/main/signup_icon.png"/>
                        <div>
                            <a href="/register">회원가입</a>
                        </div>
                    </div>
                </c:if>
                <c:if test="${sessionScope.loginUser!=null}">
                    <div id="logout_box_footer">
                        <img src="/img/main/logout_icon.png"/>
                        <div>
                            <a href="/logout">로그아웃</a>
                        </div>
                    </div>
                    <div id="mypage_box_footer">
                        <img src="/img/main/mypage_icon.png"/>
                        <div>
                            <a href="/personalInfo">내 정보</a>
                        </div>
                    </div>
                </c:if>
            </div>


<%--            <form id="mobile_search_box">--%>
<%--                <input type="text" placeholder="검색 지역을 입력해 주세요"/>--%>
<%--                <button>검색</button>--%>
<%--            </form>--%>


            <hr/>

            <ul class="category_list">
                <li><a href="boardList?searchKey=region&searchWord=강남구">강남구</a></li>
                <li><a href="boardList?searchKey=region&searchWord=강동구">강동구</a></li>
                <li><a href="boardList?searchKey=region&searchWord=강북구">강북구</a></li>
                <li><a href="boardList?searchKey=region&searchWord=강서구">강서구</a></li>
                <li><a href="boardList?searchKey=region&searchWord=관악구">관악구</a></li>
                <li><a href="boardList?searchKey=region&searchWord=광진구">광진구</a></li>
                <li><a href="boardList?searchKey=region&searchWord=구로구">구로구</a></li>
                <li><a href="boardList?searchKey=region&searchWord=금천구">금천구</a></li>
                <li><a href="boardList?searchKey=region&searchWord=노원구">노원구</a></li>
                <li><a href="boardList?searchKey=region&searchWord=도봉구">도봉구</a></li>
                <li><a href="boardList?searchKey=region&searchWord=강남구">동대문구</a></li>
                <li><a href="boardList?searchKey=region&searchWord=동작구">동작구</a></li>
                <li><a href="boardList?searchKey=region&searchWord=마포구">마포구</a></li>
                <li><a href="boardList?searchKey=region&searchWord=서대문구">서대문구</a></li>
                <li><a href="boardList?searchKey=region&searchWord=서초구">서초구</a></li>
                <li><a href="boardList?searchKey=region&searchWord=성동구">성동구</a></li>
                <li><a href="boardList?searchKey=region&searchWord=성북구">성북구</a></li>
                <li><a href="boardList?searchKey=region&searchWord=송파구">송파구</a></li>
                <li><a href="boardList?searchKey=region&searchWord=양천구">양천구</a></li>
                <li><a href="boardList?searchKey=region&searchWord=영등포구">영등포구</a></li>
                <li><a href="boardList?searchKey=region&searchWord=용산구">용산구</a></li>
                <li><a href="boardList?searchKey=region&searchWord=은평구">은평구</a></li>
                <li><a href="boardList?searchKey=region&searchWord=종로구">종로구</a></li>
                <li><a href="boardList?searchKey=region&searchWord=중구">중구</a></li>
                <li><a href="boardList?searchKey=region&searchWord=중랑구">중랑구</a></li>
            </ul>
        </nav>
    </div>

</body>

</html>