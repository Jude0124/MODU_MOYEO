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
    <link rel="stylesheet" href="/css/main/main.css" type="text/css"/>
</head>


<body>
<%@ include file="../main/main_header.jsp" %>

<div id="main">
    <div id="main_box">
        <img id="main_logo" src="/img/main/logomain.png"/>
        <form id="search_box">
            <input type="text" placeholder="찾으시고자 하는 동네를 입력해 주세요"/>
            <button>
                <i class="fa fa-search"></i>
            </button>
        </form>
        <div id="tag_box">
            <a href="#"> #전체 </a>
            <a href="#"> #강남구 </a>
        </div>
    </div>
</div>

<%@ include file="../main/main_footer.jsp" %>
</body>
</html>
