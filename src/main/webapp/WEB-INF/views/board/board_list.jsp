<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>

<link rel="stylesheet" href="/css/board/base.css" type="text/css" />
<link rel="stylesheet" href="/css/board/boardMain.css" type="text/css" />
<link rel="stylesheet" href="/css/board/boardPlus.css" type="text/css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>

    #listMenu>li:nth-child(4n+2) {width:50%}
    #listMenu>li:nth-child(4n+3), #listMenu>li:nth-child(4n+4)
    {
        width:20%;
    }
    #listMenu>#listMenuFE>li:nth-child(4n+2) {width:50%}

    #listMenu>#listMenuFE>li:nth-child(4n+3), #listMenu>#listMenuFE>li:nth-child(4n+4)
    {
        width:20%;
    }

</style>

<body>
<%@ include file="../main/main_header.jsp" %>
<div id="adminPage">

    <div id="adminMainContent">
        <div id="adminMainContentTop">
            모두모여
        </div>
        <%--<hr id="hr2px">--%>
        <div class="containerList">
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

            <ul id="listMenu" style="border-top:solid 3px gray; margin-top:5px;">
                <li>글번호</li>
                <li style="text-align: left">모두의 이야기</li>
                <li>작성자</li>
                <li>작성시간</li>

                <div id="listMenuFE">
                    <li>1</li>
                    <li style="text-align: left"><a href="/boardInfo">2</a></li>
                    <li>3</li>
                    <li>4</li>

                    <li>1</li>
                    <li style="text-align: left"><a href="/boardInfo">2</a></li>
                    <li>3</li>
                    <li>4</li>

                    <li>1</li>
                    <li style="text-align: left"><a href="/boardInfo">2</a></li>
                    <li>3</li>
                    <li>4</li>

                    <li>1</li>
                    <li style="text-align: left"><a href="/boardInfo">2</a></li>
                    <li>3</li>
                    <li>4</li>

                    <li>1</li>
                    <li style="text-align: left"><a href="/boardInfo">2</a></li>
                    <li>3</li>
                    <li>4</li>

                    <li>1</li>
                    <li style="text-align: left"><a href="/boardInfo">2</a></li>
                    <li>3</li>
                    <li>4</li>

                    <li>1</li>
                    <li style="text-align: left"><a href="/boardInfo">2</a></li>
                    <li>3</li>
                    <li>4</li>

                    <li>1</li>
                    <li style="text-align: left">2</li>
                    <li>3</li>
                    <li>4</li>
                    <%--
                    <c:forEach var="vo" items="${list}">
                        <li><input type='checkbox' name='noList' value='${vo.no}' class="chk"/></li>
                        <li>${vo.no}</li>
                        <li>${vo.title}</li>
                        <li><a href="/boardList?nickname=${vo.nickname}">${vo.nickname}</a></li>
                        <li>${vo.time}</li>
                    </c:forEach>
                    --%>
                </div>
            </ul>
            <div class="boardInsert">
                <a href="/boardWrite">글쓰기</a>
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
</div>
</body>