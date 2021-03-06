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
    <link rel="shorcut icon" type="image/x-icon" href="/img/main/favicon.ico">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/main/main.css" type="text/css"/>
</head>
<script>
    $(document).ready(function(){
        $("#search_box button").click(function(){
            if($("#searchWord").val().length<2) {
                alert("검색어는 2자 이상 입력하세요.");
                return false;
            }
        });
    });

</script>

<body>
<%@ include file="../main/main_header.jsp" %>

<div id="main">
    <div id="main_box">
        <img id="main_logo" src="/img/main/logomain2.png"/>
        <form id="search_box" method="get" action="/boardList">
            <input type="hidden" name="searchKey" value="all"/>
            <input type="text"  name="searchWord" id="searchWord" placeholder="검색어를 입력하세요."/>
            <button type="submit" form="search_box">
                <i class="fa fa-search"></i>
            </button>
        </form>
        <div id="tag_box">
            <a href="/boardList"> #전체 </a>
            <c:if test="${sessionScope.loginUser!=null}">
                <a href="boardList?searchKey=region&searchWord=${userInfo.region}"> #${userInfo.region} </a>
            </c:if>
        </div>
    </div>
</div>

<%@ include file="../main/main_footer.jsp" %>
</body>
</html>
