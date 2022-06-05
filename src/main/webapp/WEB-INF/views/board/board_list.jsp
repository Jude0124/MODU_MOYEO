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
    <script src="/js/board/board_list.js"></script>
</head>

</style>
<body>
<%@ include file="../main/main_header.jsp" %>

<div id="board_list">


    <div class="btn_box">
        <div class="search_box">
            <div id="searchRegion">
                <select name="region" onchange="location.href=this.value">
                    <option value="" selected>-- 지역 선택 --</option>
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
            <a href="/boardWrite" id="writeBtn" >글쓰기</a>
        </div>
    </div>
    <div id="board_list_box">
        <div class="title">
            <img src="/img/main/logo.png">
        </div>

        <ul id="listMenu">
            <div id="list_title">
                <li>모두의 이야기</li>
                <li>작성자</li>
                <li>작성일</li>
                <li>참여인원</li>
            </div>

            <jsp:useBean id="now" class="java.util.Date" />
            <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

            <c:forEach var="vo" items="${list}">
            <div id="listMenuFE">
                <div class="list_select" id="${vo.no}">
                    <li class="content_title"><span class="content_region">#${vo.region}</span>${vo.title}</li>
                    <li class="content_nickname">${vo.nickname}</li>

                    <c:set var = "time" value="${vo.time}"/>
                    <c:choose>
                        <c:when test="${fn:startsWith(time, today)}">
                            <li>${fn:substring(time, 11, 16)}</li>
                        </c:when>
                        <c:otherwise>
                            <li>${fn:substring(time, 0, 10)}</li>
                        </c:otherwise>
                    </c:choose>

                    <li>${vo.max}</li>
                </div>
                <div class="select_view ${vo.no}">
                    <div class="left_box">
                        <div class="content_view">
                            <div class="content_view_top">
                                <c:set var = "nickname" value="${vo.nickname}"/>
                                <div class="nick_icon">${fn:substring(nickname, 0, 1)}</div>
                                <b>${vo.nickname}</b><br/>
                                <span class="content_time">${vo.time}</span>
                                <span class="content_edit_del">삭제</span>
                            </div>
                            <div class="content_view_bottom">
                                <div>
                                    ${vo.title}
                                </div>
                            </div>
                        </div>

                        <div class="participate_view">
                            <div class="participate_view_top">
                                <span class="par_num">참여인원 : 3 / 5</span>
                                <a href="#" class="par_btn" style="color:#fff;">참여하기</a>
                            </div>
                            <div class="participate_view_bottom">
                                <ul class="par_who">
                                    <li>참여인원1</li>
                                    <li>참여인원2</li>
                                    <li>참여인원3</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="right_box">
                        <div class="write_reply">
                            <form class="reply_form">
                                <textarea name="comment" class="comment_area" placeholder="댓글을 입력하세요"></textarea>
                                <input type="submit" class="comment_btn" value="등록">
                            </form>
                        </div>
                        <div class="reply_view">
                            <div class="reply_view_top">
                                <span class="reply_num">속닥속닥 4</span>
                            </div>
                            <div class="reply_view_bottom">
                                <ul class="reply_list">
                                    <li>
                                        <div class="reply_content">
                                            <div class="nick_icon">가</div>
                                            <div class="comment_view">
                                                <b class="reply_nickname">댓글 작성자 닉네임</b>
                                                <span>
                                                    댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
                                                    댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
                                                    댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
                                                </span><br/>
                                                <span class="reply_time">댓글 작성 시간</span>
                                                <span class="reply_edit_del">수정 | 삭제</span>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="reply_content">
                                            <div class="nick_icon">가</div>
                                            <div class="comment_view">
                                                <b class="reply_nickname">댓글 작성자 닉네임</b>
                                                <span>
                                                    댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
                                                </span><br/>
                                                <span class="reply_time">댓글 작성 시간</span>
                                                <span class="reply_edit_del">수정 | 삭제</span>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="reply_content">
                                            <div class="nick_icon">가</div>
                                            <div class="comment_view">
                                                <b class="reply_nickname">댓글 작성자 닉네임</b>
                                                <span>
                                                    댓글내용댓글내용댓글내용
                                                </span><br/>
                                                <span class="reply_time">댓글 작성 시간</span>
                                                <span class="reply_edit_del">수정 | 삭제</span>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="reply_content">
                                            <div class="nick_icon">가</div>
                                            <div class="comment_view">
                                                <b class="reply_nickname">댓글 작성자 닉네임</b>
                                                <span>
                                                    댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
                                                    댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
                                                </span><br/>
                                                <span class="reply_time">댓글 작성 시간</span>
                                                <span class="reply_edit_del">수정 | 삭제</span>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
        </ul>

        <div>
            총 레코드 수 : ${bpvo.totalRecord} / 총 페이지 개수 : ${bpvo.totalPage} / 현재 페이지 번호 : ${bpvo.pageNum}
        </div>
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