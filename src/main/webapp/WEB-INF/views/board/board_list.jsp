<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>게시판 - 모두모여</title>
    <link rel="shorcut icon" type="image/x-icon" href="/img/main/favicon.ico">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>


<style>
    html, body {
        margin: 0;
        height: 100%
    }
    #board_list{
        height: auto !important;
        min-height: calc(100vh - 180px);
        padding-top: 50px;
        padding-bottom: 50px;
        overflow: auto;
    }

    #board_list_box{
        text-align: center;
        width: 1200px;
        margin: 0 auto 100px;
    }

    .title img{
        width: 200px;
        margin: 0 auto 30px;
    }

    #listMenu{
        border-top:solid 3px gray;
        margin-top:5px;
    }
    #listMenu>#list_title>li{
        float: left;
        width: 10%;
        height: 40px;
        line-height: 40px;
        border-bottom: 3px solid #d0d0d0;
        box-sizing: border-box;
    }
    #listMenu>#list_title>li:nth-child(1) {
        width:50%
    }
    #listMenu>#list_title>li:nth-child(2) {
        width:30%
    }
    #list_title{
        height: 40px;
    }
    .list_select{
        height: 40px;
        cursor: pointer;
    }
    #listMenuFE li{
        float: left;
        width: 10%;
        height: 40px;
        line-height: 40px;
        border-bottom: 1px solid #d0d0d0;
        box-sizing: border-box;
    }
    #listMenuFE li:nth-child(4n+1) {
        width:50%
    }
    #listMenuFE li:nth-child(4n+2) {
        width:30%
    }
    #listMenuFE>div:hover li{
        background: rgba(0, 196, 113, 0.3);
    }

    .select_view{
        display: none;
        width: 100%;
        height: 600px;
    }
    .left_box{
        float: left;
        width: 40%;
    }
    .content_view{
        width: 100%;
        height: 200px;
        background: #ddd;
    }
    .participate_view{
        width: 100%;
        height: 400px;
        background: #67493B;
    }
    .right_box{
        float: left;
        width: 60%;
    }
    .write_review{
        width: 100%;
        height: 100px;
        background: blue;
    }
    .review_view{
        width: 100%;
        height: 500px;
        background: red;
    }
</style>
<script>
$(document).ready(function(){
   $("#listMenuFE>div").click(function(){
      var idx = $(this).index();
      if($(this).hasClass("on")){
          $(this).removeClass("on");
          $("#listMenuFE>div").eq(idx+1).slideUp();
      }else{
          $(this).addClass("on");
          $(".select_view").slideUp();
          $("#listMenuFE>div").eq(idx+1).slideDown();
      }
   });
});

</script>
<body>
<%@ include file="../main/main_header.jsp" %>

<div id="board_list">
    <div id="board_list_box">
        <div class="title">
            <img src="/img/main/logo.png">
        </div>

        <div>
            총 레코드 수 : ${bpvo.totalRecord} / 총 페이지 개수 : ${bpvo.totalPage} / 현재 페이지 번호 : ${bpvo.pageNum}
        </div>
        <div id="searchRegion">
            <select name="region" onchange="location.href=this.value">
                <option>선택</option>
                <option value="/boardList?region=강남구">강남구</option>
                <option value="/boardList?region=강서구">강서구</option>
                <option value="/boardList?region=송파구">송파구</option>
                <option value="/boardList?region=양천구">양천구</option>
                <option value="/boardList?region=구로구">구로구</option>
            </select>
        </div>
        <!-- 검색 -->
        <div>
            <form method="get" action="/boardList" id="searchFrm">
                <select name="searchKey">
                    <option value="nickname">작성자</option>
                    <option value="title">내용</option>
                    <option value="no">글번호</option>
                </select>
                <input type="text" name="searchWord" id="searchWord" />
                <input type="submit" value="Search" />
            </form>
        </div>
        <div class="boardInsert">
            <a href="/boardWrite">글쓰기</a>
        </div>

        <ul id="listMenu">
            <div id="list_title">
                <li>모두의 이야기</li>
                <li>작성자</li>
                <li>작성일</li>
                <li>참여인원</li>
            </div>
            <!--
            <div id="listMenuFE">
                <div class="list_select">
                    <li>이번주 석촌호수 만개라던데 다들 보러가실분 모아요!!</li>
                    <li>호그와트특급호구열차에 탑승한 호구</li>
                    <li>22:46</li>
                    <li>4 / 6</li>
                </div>
                <div class="select_view">
                    <div class="left_box">
                        <div class="content_view">

                        </div>
                        <div class="participate_view">

                        </div>
                    </div>
                    <div class="right_box">
                        <div class="write_review">

                        </div>
                        <div class="review_view">

                        </div>
                    </div>
                </div>


                <div class="list_select">
                    <li>이번주 석촌호수 만개라던데 다들 보러가실분 모아요!!</li>
                    <li>호그와트특급호구열차에 탑승한 호구</li>
                    <li>22:46</li>
                    <li>4 / 6</li>
                </div>
                <div class="select_view">
                    <div class="left_box">
                        <div class="content_view">

                        </div>
                        <div class="participate_view">

                        </div>
                    </div>
                    <div class="right_box">
                        <div class="write_review">

                        </div>
                        <div class="review_view">

                        </div>
                    </div>
                </div>


                <div class="list_select">
                    <li>이번주 석촌호수 만개라던데 다들 보러가실분 모아요!!</li>
                    <li>호그와트특급호구열차에 탑승한 호구</li>
                    <li>22:46</li>
                    <li>4 / 6</li>
                </div>
                <div class="select_view">
                    <div class="left_box">
                        <div class="content_view">

                        </div>
                        <div class="participate_view">

                        </div>
                    </div>
                    <div class="right_box">
                        <div class="write_review">

                        </div>
                        <div class="review_view">

                        </div>
                    </div>
                </div>


                <div class="list_select">
                    <li>이번주 석촌호수 만개라던데 다들 보러가실분 모아요!!</li>
                    <li>호그와트특급호구열차에 탑승한 호구</li>
                    <li>22:46</li>
                    <li>4 / 6</li>
                </div>
                <div class="select_view">
                    <div class="left_box">
                        <div class="content_view">

                        </div>
                        <div class="participate_view">

                        </div>
                    </div>
                    <div class="right_box">
                        <div class="write_review">

                        </div>
                        <div class="review_view">

                        </div>
                    </div>
                </div>


                <div class="list_select">
                    <li>이번주 석촌호수 만개라던데 다들 보러가실분 모아요!!</li>
                    <li>호그와트특급호구열차에 탑승한 호구</li>
                    <li>22:46</li>
                    <li>4 / 6</li>
                </div>
                <div class="select_view">
                    <div class="left_box">
                        <div class="content_view">

                        </div>
                        <div class="participate_view">

                        </div>
                    </div>
                    <div class="right_box">
                        <div class="write_review">

                        </div>
                        <div class="review_view">

                        </div>
                    </div>
                </div>


                <div class="list_select">
                    <li>이번주 석촌호수 만개라던데 다들 보러가실분 모아요!!</li>
                    <li>호그와트특급호구열차에 탑승한 호구</li>
                    <li>22:46</li>
                    <li>4 / 6</li>
                </div>
                <div class="select_view">
                    <div class="left_box">
                        <div class="content_view">

                        </div>
                        <div class="participate_view">

                        </div>
                    </div>
                    <div class="right_box">
                        <div class="write_review">

                        </div>
                        <div class="review_view">

                        </div>
                    </div>
                </div>


                <div class="list_select">
                    <li>이번주 석촌호수 만개라던데 다들 보러가실분 모아요!!</li>
                    <li>호그와트특급호구열차에 탑승한 호구</li>
                    <li>22:46</li>
                    <li>4 / 6</li>
                </div>
                <div class="select_view">
                    <div class="left_box">
                        <div class="content_view">

                        </div>
                        <div class="participate_view">

                        </div>
                    </div>
                    <div class="right_box">
                        <div class="write_review">

                        </div>
                        <div class="review_view">

                        </div>
                    </div>
                </div>
                -->


                <c:forEach var="vo" items="${list}">
                    <div id="listMenuFE">
                        <div class="list_select">
                            <li>${vo.title}</li>
                            <li>${vo.nickname}</li>
                            <li>${vo.time}</li>
                            <li>${vo.max}</li>
                        </div>
                    </div>
                </c:forEach>


            </div>
        </ul>

        <%--
            <ul class="paging">
                <!-- 이전페이지 -->
                <c:if test="${bpvo.pageNum==1}">
                    <li id="prevBtn">◀</li>
                </c:if>
                <c:if test="${bpvo.pageNum>1}">
                    <li><a href="/admin/adminMembers?pageNum=${bpvo.pageNum-1}
                                <c:if test='${bpvo.searchWord!=null}'>
                                &searchKey=${bpvo.searchKey}
                                &searchWord=${bpvo.searchWord}
                                </c:if>">
                    ◀</a></li>
                </c:if>
            </ul>
        --%>


    </div>

</div>

<%@ include file="../main/main_footer.jsp" %>
</body>
</html>