<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
    <link rel="stylesheet" href="/css/board/board_list.css" type="text/css"/>
<%--    <script src="/js/board/board_list.js"></script>--%>
</head>
<script>

    function contentDelChk(no){
        if(confirm("게시글을 삭제하시겠습니까?")) {
            location.href="/board/contentDel?no="+no;
        }
    }
    function need_login(){
        alert("로그인이 필요한 서비스입니다");
    }

    $(document).ready(function(){
        $("button[id='par_btn_null']").click(function(){
            alert("로그인이 필요한 서비스입니다");
        })

        var leng = $("div[class='list_select']").length;
        var listarr = new Array(leng);
        var maxarr = new Array(leng);
        var session_nickname = "${sessionScope.loginUser.getNickname()}";
        for(var i=0; i<leng; i++) {
            listarr[i] = $("div[class='list_select']").eq(i).attr('id');
            maxarr[i] = $("div[id='listMenuFE']").eq(i).attr('class');
            var nownum = $(".par_who"+ listarr[i] + " > li").length;
            var parnum = document.querySelectorAll('.parnum'+listarr[i]);
            parnum[0].innerHTML = nownum;
            parnum[1].innerHTML = nownum;
            for(var j=0; j<nownum; j++) {
                var participate_btn = document.getElementById("participate_btn"+listarr[i]);
                var cancel_btn = document.getElementById("cancel_btn"+listarr[i]);

                if($(".par_who"+ listarr[i] + " > li").eq(j).attr('class') === session_nickname){
                    participate_btn.style.display='none';
                    cancel_btn.style.display='block';
                }
            }
        }

        $("#participateInsert" + listarr[0]).submit(function(){
            if($(".par_who"+ listarr[0] + " > li").length >= maxarr[0]){
                alert("해당 글에는 더 이상 참여하기를 할 수 없습니다.");
                return false;
            }
        });
        $("#participateInsert" + listarr[1]).submit(function(){
            if($(".par_who"+ listarr[1] + " > li").length >= maxarr[1]){
                alert("해당 글에는 더 이상 참여하기를 할 수 없습니다.");
                return false;
            }
        });
        $("#participateInsert" + listarr[2]).submit(function(){
            if($(".par_who"+ listarr[2] + " > li").length >= maxarr[2]){
                alert("해당 글에는 더 이상 참여하기를 할 수 없습니다.");
                return false;
            }
        });
        $("#participateInsert" + listarr[3]).submit(function(){
            if($(".par_who"+ listarr[3] + " > li").length >= maxarr[3]){
                alert("해당 글에는 더 이상 참여하기를 할 수 없습니다.");
                return false;
            }
        });
        $("#participateInsert" + listarr[4]).submit(function(){
            if($(".par_who"+ listarr[4] + " > li").length >= maxarr[4]){
                alert("해당 글에는 더 이상 참여하기를 할 수 없습니다.");
                return false;
            }
        });
        $("#participateInsert" + listarr[5]).submit(function(){
            if($(".par_who"+ listarr[5] + " > li").length >= maxarr[5]){
                alert("해당 글에는 더 이상 참여하기를 할 수 없습니다.");
                return false;
            }
        });
        $("#participateInsert" + listarr[6]).submit(function(){
            if($(".par_who"+ listarr[6] + " > li").length >= maxarr[6]){
                alert("해당 글에는 더 이상 참여하기를 할 수 없습니다.");
                return false;
            }
        });


        $("#listMenuFE>div[class='list_select']").click(function(){
            var idName = $(this).attr('id');
            if($(this).hasClass("on")){
                $(this).removeClass("on");
                $(".select_view").slideUp();
            }else{
                $(".list_select").removeClass("on");
                $(this).addClass("on");
                $(".select_view").slideUp();
                $('.' + idName).slideDown();
            }

            $(".reply_form" + idName).submit(function(){
                event.preventDefault();
                const now = new Date();
                const year = now.getFullYear();
                const month = now.getMonth()+1;
                const date = now.getDate();
                const hours = now.getHours();
                const minutes = now.getMinutes();
                const seconds = now.getSeconds();

                const fulldate = year + "-" + (("0"+month.toString()).slice(-2)) + "-" + (("0"+date.toString()).slice(-2))
                    + " " + hours + ":" + (("0"+minutes.toString()).slice(-2)) + ":" + (("0"+seconds.toString()).slice(-2));

                $("#commentTime"  + idName).val(fulldate);

                if($(".comment_area" + idName).val()==="") {
                    alert("내용을 입력후 등록하세요.");
                    return false;
                }else {
                    var params = $(".reply_form" + idName).serialize();
                    $.ajax({
                        url: 'comment/commentOk',
                        async: true,
                        data: params,
                        type: 'POST',
                        success: function(r){
                            $(".comment_area" + idName).val("");
                            reviewListAll();
                        },
                        error: function(e){
                            console.log(e.responseText);
                        }
                    });
                }
            });

            function reviewListAll() {
                $.ajax({
                    url: 'comment/commentList',
                    data: {
                        no: idName
                    },
                    success: function(result) {
                        var $result = $(result);
                        var tag = "";
                        var cnt = 0;
                        var session_nickname = "${sessionScope.loginUser.getNickname()}";
                        $result.each(function(idx, vo){
                            tag += "<li><div class='reply_content'>";
                            if(vo.nickname.charCodeAt(0) % 7 == 0){
                                tag += "<div class='nick_icon' style='background: #ff0000;'>";
                            }
                            if(vo.nickname.charCodeAt(0) % 7 == 1){
                                tag += "<div class='nick_icon' style='background: #ff8c00;'>";
                            }
                            if(vo.nickname.charCodeAt(0) % 7 == 2){
                                tag += "<div class='nick_icon' style='background: #ffff00; color: black;'>";
                            }
                            if(vo.nickname.charCodeAt(0) % 7 == 3){
                                tag += "<div class='nick_icon' style='background: #008000;'>";
                            }
                            if(vo.nickname.charCodeAt(0) % 7 == 4){
                                tag += "<div class='nick_icon' style='background: #0000ff;'>";
                            }
                            if(vo.nickname.charCodeAt(0) % 7 == 5){
                                tag += "<div class='nick_icon' style='background: #4b0082;'>";
                            }
                            if(vo.nickname.charCodeAt(0) % 7 == 6){
                                tag += "<div class='nick_icon' style='background: #800080;'>";
                            }
                            tag += vo.nickname.substring(0,1) + "</div>";
                            tag += "<div class='comment_view'><b class='reply_nickname'>" + vo.nickname + "</b>";
                            tag += "<span>" + vo.comment + "</span><br/>";
                            tag += "<span class='reply_time'>" + vo.time + "</span>";
                            if(session_nickname === vo.nickname) {
                                tag += "<input type='button' value='삭제' title='" + vo.comment_no + "' class='reply_edit_del'/>";
                            }
                            tag += "</div></li>";
                            cnt++;
                        });
                        $("#reply_list" + idName).html(tag);

                        var tag2 = "";
                        tag2 += "<span class='reply_num'>속닥속닥 ";
                        if(cnt > 0) {
                            tag2 += cnt;
                        }
                        tag2 += "</span>";
                        $("#reply_view_top" + idName).html(tag2);
                    },
                    error: function(e) {
                        console.log(e.responseText);
                    }
                });
            }

            $(document).on('click', '.reply_content input[value="삭제"]', function(){
                if(confirm('댓글을 삭제하시겠습니까?')){
                    var params = "comment_no=" + $(this).attr("title");
                    $.ajax({
                        url: 'comment/commentDel',
                        data: params,
                        success: function(result){
                            reviewListAll();
                        },
                        error: function(e) {
                            console.log(e.responseText);
                        }
                    })
                }
            });
            reviewListAll();

        });

        $("#searchFrm").submit(function(){
            if($("#searchWord").val().length<2) {
                alert("검색어는 2자 이상 입력하세요.");
                return false;
            }
        });

        const container = document.querySelector("#board_list");
        const box = container.querySelector(".btn_box");

        const {width:containerWidth, height:containerHeight} =
            container.getBoundingClientRect();
        const {width:boxWidth, height:boxHeight} =
            box.getBoundingClientRect();
        let isDragging = null;
        let originLeft = null;
        let originTop = null;
        let originX = null;
        let originY = null;

        box.addEventListener("mousedown", (e) => {
            isDragging = true;
            originX = e.clientX;
            originY = e.clientY;
            originLeft = box.offsetLeft;
            originTop = box.offsetTop;
        });

        document.addEventListener("mouseup", (e) => {
            isDragging = false;
        });

        document.addEventListener("mousemove", (e) => {
            if(isDragging){
                const diffX = e.clientX - originX;
                const diffY = e.clientY - originY;
                const endOfXPoint = containerWidth - boxWidth;
                const endOfYPoint = containerHeight - boxHeight;
                box.style.left = Math.min(Math.max(0, originLeft + diffX), endOfXPoint) + "px";
                box.style.top = Math.min(Math.max(0, originTop + diffY), endOfYPoint) + "px";
            }
        });
        $( window ).resize(function() {
            //창크기 변화 감지
            const container = document.querySelector("#board_list");
            const box = container.querySelector(".btn_box");

            const {width:containerWidth, height:containerHeight} =
                container.getBoundingClientRect();
            const {width:boxWidth, height:boxHeight} =
                box.getBoundingClientRect();
            let isDragging = null;
            let originLeft = null;
            let originTop = null;
            let originX = null;
            let originY = null;

            box.addEventListener("mousedown", (e) => {
                isDragging = true;
                originX = e.clientX;
                originY = e.clientY;
                originLeft = box.offsetLeft;
                originTop = box.offsetTop;
            });

            document.addEventListener("mouseup", (e) => {
                isDragging = false;
            });

            document.addEventListener("mousemove", (e) => {
                if(isDragging){
                    const diffX = e.clientX - originX;
                    const diffY = e.clientY - originY;
                    const endOfXPoint = containerWidth - boxWidth;
                    const endOfYPoint = containerHeight - boxHeight;
                    box.style.left = Math.min(Math.max(0, originLeft + diffX), endOfXPoint) + "px";
                    box.style.top = Math.min(Math.max(0, originTop + diffY), endOfYPoint) + "px";
                }
            });
        });

    });
</script>
<body>
<%@ include file="../main/main_header.jsp" %>

<div id="board_list">

    <div class="btn_box">
        <div class="search_box">
            <div id="searchRegion">
                <select name="region" onchange="location.href=this.value">
                    <option value="" selected>-- 지역 선택 --</option>
                    <option value="boardList">전체보기</option>
                    <option value="boardList?searchKey=region&searchWord=강남구">강남구</option>
                    <option value="boardList?searchKey=region&searchWord=강동구">강동구</option>
                    <option value="boardList?searchKey=region&searchWord=강북구">강북구</option>
                    <option value="boardList?searchKey=region&searchWord=강서구">강서구</option>
                    <option value="boardList?searchKey=region&searchWord=관악구">관악구</option>
                    <option value="boardList?searchKey=region&searchWord=광진구">광진구</option>
                    <option value="boardList?searchKey=region&searchWord=구로구">구로구</option>
                    <option value="boardList?searchKey=region&searchWord=금천구">금천구</option>
                    <option value="boardList?searchKey=region&searchWord=노원구">노원구</option>
                    <option value="boardList?searchKey=region&searchWord=도봉구">도봉구</option>
                    <option value="boardList?searchKey=region&searchWord=동대문구">동대문구</option>
                    <option value="boardList?searchKey=region&searchWord=동작구">동작구</option>
                    <option value="boardList?searchKey=region&searchWord=마포구">마포구</option>
                    <option value="boardList?searchKey=region&searchWord=서대문구">서대문구</option>
                    <option value="boardList?searchKey=region&searchWord=서초구">서초구</option>
                    <option value="boardList?searchKey=region&searchWord=성동구">성동구</option>
                    <option value="boardList?searchKey=region&searchWord=성북구">성북구</option>
                    <option value="boardList?searchKey=region&searchWord=송파구">송파구</option>
                    <option value="boardList?searchKey=region&searchWord=양천구">양천구</option>
                    <option value="boardList?searchKey=region&searchWord=영등포구">영등포구</option>
                    <option value="boardList?searchKey=region&searchWord=용산구">용산구</option>
                    <option value="boardList?searchKey=region&searchWord=은평구">은평구</option>
                    <option value="boardList?searchKey=region&searchWord=종로구">종로구</option>
                    <option value="boardList?searchKey=region&searchWord=중구">중구</option>
                    <option value="boardList?searchKey=region&searchWord=중랑구">중랑구</option>
                </select>
            </div>
            <hr/>
            <!-- 검색 -->
            <div>
                <form method="get" action="/boardList" id="searchFrm">
                    <select name="searchKey">
                        <option value="nickname">작성자</option>
                        <option value="title">내용</option>
                    </select>
                    <input type="text" name="searchWord" id="searchWord" placeholder="검색 내용 입력"/>
                    <input type="submit" value="검색" id="searchBtn"/>
                    <hr/>
                </form>
            </div>
        </div>
        <div class="boardInsert">
            <c:if test="${sessionScope.loginUser!=null}">
                <a href="/boardWrite" id="writeBtn" >글쓰기</a>
            </c:if>
            <c:if test="${sessionScope.loginUser==null}">
                <a href="#" id="writeBtn" style="opacity: 0.5;" onclick="need_login()">글쓰기</a>
            </c:if>
        </div>
    </div>


    <div id="board_list_box">
        <div class="title">
            <img src="/img/main/logo.png">
            <img src="/img/main/logoside.png">
        </div>

        <div class="btn_box_mobile2">
            <div>
                <form method="get" action="/boardList" id="searchFrm_mobile">
                    <select name="searchKey">
                        <option value="nickname">작성자</option>
                        <option value="title">내용</option>
                    </select>
                    <input type="text" name="searchWord" id="searchWord_mobile" placeholder="검색 내용 입력"/>
                    <input type="submit" value="검색" id="searchBtn_mobile"/>
                </form>
            </div>
        </div>

        <div class="btn_box_mobile">
            <div id="searchRegion_mobile">
                <select name="region" onchange="location.href=this.value">
                    <option value="" selected>-- 지역 선택 --</option>
                    <option value="boardList">전체보기</option>
                    <option value="boardList?searchKey=region&searchWord=강남구">강남구</option>
                    <option value="boardList?searchKey=region&searchWord=강동구">강동구</option>
                    <option value="boardList?searchKey=region&searchWord=강북구">강북구</option>
                    <option value="boardList?searchKey=region&searchWord=강서구">강서구</option>
                    <option value="boardList?searchKey=region&searchWord=관악구">관악구</option>
                    <option value="boardList?searchKey=region&searchWord=광진구">광진구</option>
                    <option value="boardList?searchKey=region&searchWord=구로구">구로구</option>
                    <option value="boardList?searchKey=region&searchWord=금천구">금천구</option>
                    <option value="boardList?searchKey=region&searchWord=노원구">노원구</option>
                    <option value="boardList?searchKey=region&searchWord=도봉구">도봉구</option>
                    <option value="boardList?searchKey=region&searchWord=동대문구">동대문구</option>
                    <option value="boardList?searchKey=region&searchWord=동작구">동작구</option>
                    <option value="boardList?searchKey=region&searchWord=마포구">마포구</option>
                    <option value="boardList?searchKey=region&searchWord=서대문구">서대문구</option>
                    <option value="boardList?searchKey=region&searchWord=서초구">서초구</option>
                    <option value="boardList?searchKey=region&searchWord=성동구">성동구</option>
                    <option value="boardList?searchKey=region&searchWord=성북구">성북구</option>
                    <option value="boardList?searchKey=region&searchWord=송파구">송파구</option>
                    <option value="boardList?searchKey=region&searchWord=양천구">양천구</option>
                    <option value="boardList?searchKey=region&searchWord=영등포구">영등포구</option>
                    <option value="boardList?searchKey=region&searchWord=용산구">용산구</option>
                    <option value="boardList?searchKey=region&searchWord=은평구">은평구</option>
                    <option value="boardList?searchKey=region&searchWord=종로구">종로구</option>
                    <option value="boardList?searchKey=region&searchWord=중구">중구</option>
                    <option value="boardList?searchKey=region&searchWord=중랑구">중랑구</option>
                </select>
            </div>
            <c:if test="${sessionScope.loginUser!=null}">
                <a href="/boardWrite" id="writeBtn_mobile" >글쓰기</a>
            </c:if>
            <c:if test="${sessionScope.loginUser==null}">
                <a href="#" id="writeBtn_mobile" style="opacity: 0.5; cursor: default;" onclick="need_login()">글쓰기</a>
            </c:if>
        </div>

        <ul id="listMenu">
            <div id="list_title">
                <li>모두의 이야기</li>
                <li>작성자</li>
                <li>작성일</li>
                <li>참여인원</li>
            </div>

            <jsp:useBean id="now" class="java.util.Date" />
            <fmt:setLocale value="ko_kr"/>
            <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

            <c:forEach var="vo" items="${list}">
            <div id="listMenuFE" class="${vo.max}">
                <div class="list_select" id="${vo.no}">
                    <li class="content_title"><span class="content_region">#${vo.region}</span>${vo.title}</li>
                    <li class="content_nickname">${vo.nickname}</li>

                    <c:set var = "time" value="${vo.time}"/>
                    <c:choose>
                        <c:when test="${fn:substring(time, 12, 13) == ':'}">
                            <li>0${fn:substring(time, 11, 15)}</li>
                        </c:when>
                        <c:when test="${fn:startsWith(time, today)}">
                            <li>${fn:substring(time, 11, 16)}</li>
                        </c:when>
                        <c:otherwise>
                            <li>${fn:substring(time, 0, 10)}</li>
                        </c:otherwise>
                    </c:choose>

                    <li><span class="parnum${vo.no}"></span> / ${vo.max}</li>
                </div>
                <div class="select_view ${vo.no}">
                    <div class="left_box">
                        <div class="content_view">
                            <div class="content_view_top">
                                <c:set var = "nickname" value="${vo.nickname}"/>
                                <c:set var = "no" value="${nickname.charAt(0) + 65536}"/>
                                <c:if test="${no % 7 == 0}">
                                    <div class="nick_icon" style="background: #ff0000;">
                                </c:if>
                                <c:if test="${no % 7 == 1}">
                                    <div class="nick_icon" style="background: #ff8c00;">
                                </c:if>
                                <c:if test="${no % 7  == 2}">
                                    <div class="nick_icon" style="background: #ffff00; color: black;">
                                </c:if>
                                <c:if test="${no % 7  == 3}">
                                    <div class="nick_icon" style="background: #008000;">
                                </c:if>
                                <c:if test="${no % 7  == 4}">
                                    <div class="nick_icon" style="background: #0000ff;">
                                </c:if>
                                <c:if test="${no % 7  == 5}">
                                    <div class="nick_icon" style="background: #4b0082;">
                                </c:if>
                                <c:if test="${no % 7  == 6}">
                                    <div class="nick_icon" style="background: #800080;">
                                </c:if>
                                ${fn:substring(nickname, 0, 1)}</div>
                                <b>${vo.nickname}</b><br/>
                                <span class="content_time">${vo.time}</span>
                                <c:if test="${sessionScope.loginUser.getNickname() == vo.nickname}">
                                    <a class="content_edit_del" href="javascript:contentDelChk('${vo.no}')"href="javascript:contentDelChk('${vo.no}')" style="color: #b1b1b1;">삭제</a>
                                </c:if>

                            </div>
                            <div class="content_view_bottom">
                                <div>
                                    ${vo.title}
                                </div>
                            </div>
                        </div>

                        <div class="participate_view">
                            <div class="participate_view_top">
                                <span class="par_num">참여인원 : <span class="parnum${vo.no}"></span> / ${vo.max}</span>


                                    <div class="participate_cancel">
                                        <c:choose>
                                            <c:when test="${sessionScope.loginUser.getNickname()==vo.nickname}">

                                            </c:when>
                                            <c:when test="${userInfo.nickname==null}">
                                                <button id="par_btn_null" style="opacity: 0.5;">참여하기</button>
                                            </c:when>
                                            <c:when test="${userInfo.nickname!=null}">
                                                <form action="/participateInsert" method="post" id="participateInsert${vo.no}" name="participateInsert">
                                                    <input type="hidden" id="no" name="no" value="${vo.no}">
                                                    <input type="hidden" id="participatenickname" name="nickname" value="${userInfo.nickname}" />
                                                    <button class="participate_btn par_btn" id="participate_btn${vo.no}" type="submit" onclick="if(!confirm('참여하시겠습니까?')){return false;}" >
                                                        참여하기
                                                    </button>
                                                </form>
                                                <form action="/participateCancel" method="post" id="participateCancel" name="participateCancel">
                                                    <input type="hidden" id="cancelno" name="no" value="${vo.no}" />
                                                    <input type="hidden" id="cancelnickname" name="nickname" value="${userInfo.nickname}" />
                                                    <button class="cancel_btn par_btn" id="cancel_btn${vo.no}" type="submit" onclick="if(!confirm('취소하시겠습니까?')){return false;}">
                                                        참여취소
                                                    </button>
                                                </form>
                                            </c:when>
                                        </c:choose>
                                    </div>
                            </div>

                            <div class="participate_view_bottom">
                                <ul class="par_who par_who${vo.no}">
                                    <c:forEach var="vo2" items="${list2}">
                                        <c:if test="${vo.no == vo2.no}">
                                            <li class="${vo2.nickname}">${vo2.nickname}</li>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="right_box">
                        <div class="write_reply">
                            <form method="post" class="reply_form${vo.no}">
                                <input type="hidden" name="no" value="${vo.no}" />
                                <input type="hidden" name="time" id="commentTime${vo.no}" value="" />
                                <c:if test="${sessionScope.loginUser!=null}">
                                    <textarea name="comment" class="comment_area${vo.no}" placeholder="댓글을 입력하세요"></textarea>
                                    <input type="submit" class="comment_btn${vo.no}" value="등록">
                                </c:if>
                                <c:if test="${sessionScope.loginUser==null}">
                                    <textarea name="comment" class="comment_area${vo.no}" placeholder="로그인이 필요한 서비스입니다"></textarea>
                                    <input type="submit" class="comment_btn${vo.no}" style="opacity: 0.5;" value="등록" disabled>
                                </c:if>
                            </form>
                        </div>
                        <div class="reply_view">
                            <div class="reply_view_top" id="reply_view_top${vo.no}">
                                <span class="reply_num"></span>
                            </div>
                            <div class="reply_view_bottom">
                                <ul class="reply_list" id="reply_list${vo.no}">
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
        </ul>

        <ul class="paging">
            <!-- 이전페이지 -->
            <c:if test="${bpvo.pageNum==1}">
                <li><</li>
            </c:if>
            <c:if test="${bpvo.pageNum>1}">
                <li><a href="${url}/boardList?pageNum=${bpvo.pageNum-1}<c:if test='${bpvo.searchWord!=null}'>&searchKey=${bpvo.searchKey}&searchWord=${bpvo.searchWord}</c:if>"><</a></li>
            </c:if>
            <!-- 페이지번호 -->
            <li class="now">${bpvo.pageNum} / <c:if test="${bpvo.totalPage==0}">1</c:if><c:if test="${bpvo.totalPage!=0}">${bpvo.totalPage}</c:if></li>
            <!-- 다음페이지 -->
            <c:if test="${bpvo.pageNum>=bpvo.totalPage}">
                <li>></li>
            </c:if>
            <c:if test="${bpvo.pageNum<bpvo.totalPage}">
                <li><a href="${url}/boardList?pageNum=${bpvo.pageNum+1}<c:if test='${bpvo.searchWord!=null}'>&searchKey=${bpvo.searchKey}&searchWord=${bpvo.searchWord}</c:if>">></a></li>
            </c:if>
        </ul>

    </div>

</div>

<%@ include file="../main/main_footer.jsp" %>
</body>
</html>