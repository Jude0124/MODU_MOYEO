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
        <div class="containerList">


            <h2>제목이 들어갈 자리</h2>
            <hr/>
            <div>글 내용이 들어갈 자리입니다</div>
            <hr/>
            <div class="boardList">
                <a href="/boardList">글목록</a>
            </div>
            <div id="boardInsert">
                <a href="/boardWrite">글쓰기</a>
            </div>
            <div id="boardDelete">
                <a href="/boardDelete">글삭제</a>
            </div>
            <div>
                <form method="post" id="replyLine" class="form-group">
                    <%--<input type="hidden" name="" id="" value="">--%>
                    <textarea name="content" id="replyContent" placeholder="댓글을 입력해주세요" ></textarea>
                    <input type="submit" id="replyButton" value="작성" >
                </form>
            </div>
            <hr/>
            <div id="replyList">
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