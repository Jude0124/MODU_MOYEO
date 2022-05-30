<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>

<link rel="stylesheet" href="/css/base.css" type="text/css" />
<link rel="stylesheet" href="/css/admin/adminMain.css" type="text/css" />
<link rel="stylesheet" href="/css/admin/adminMenu.css" type="text/css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script async src='/cdn-cgi/bm/cv/669835187/api.js'></script>
<script type="text/javascript" src="/js/admin/adminSideTab.js"></script>
<script type="text/javascript" src="/js/admin/adminCheckBox.js"></script>

<style>

    #listMenu>li:nth-child(8n+1) {
        width:5%;
    }
    #listMenu>li:nth-child(8n+3)
    {
        width:20%;
    }
    #listMenu>li:nth-child(8n+6),
    #listMenu>li:nth-child(8n+7),
    #listMenu>li:nth-child(8n+8)
    {
        width:15%;
    }

    #listMenu>#listMenuFE>li:nth-child(8n+1) {
        width:5%;
    }
    #listMenu>#listMenuFE>li:nth-child(8n+3)
    {
        width:20%;
    }
    #listMenu>#listMenuFE>li:nth-child(8n+6),
    #listMenu>#listMenuFE>li:nth-child(8n+7),
    #listMenu>#listMenuFE>li:nth-child(8n+8)
    {
        width:15%;
    }

</style>
<!-- <script type="text/javascript">

</script> -->
<body>
<div id="adminPage">
    <%@ include file="/WEB-INF/views/admin/adminTop.jsp" %>

    <div id="adminMainContent">

        <ul id="sideTapFirst">
            <li>
                <div class='menu_img' id="menu1">
                    <img src="/img/admin/adminLeftTap1/dash.PNG" class="menu_imgs" id="menu_img_dashBoard" />
                    <img src="/img/admin/adminLeftTap1/members.PNG" class="menu_imgs" id="menu_img_members" />
                    <img src="/img/admin/adminLeftTap1/campList.PNG" class="menu_imgs" id="menu_img_campList" />
                    <img src="/img/admin/adminLeftTap1/addCamperList_red.PNG" class="menu_imgs" id="menu_img_addCamperList" />
                    <img src="/img/admin/adminLeftTap1/autoCampList.PNG" class="menu_imgs" id="menu_img_autoCampList" />
                    <img src="/img/admin/adminLeftTap1/shareList.PNG" class="menu_imgs" id="menu_img_shareList" />
                    <img src="/img/admin/adminLeftTap1/reviewList.PNG" class="menu_imgs" id="menu_img_reviewList" />
                    <img src="/img/admin/adminLeftTap1/commentList.PNG" class="menu_imgs" id="menu_img_commentList" />
                </div>
            </li>

            <li class='menuExpansion'>
                <div class='menu_img' id="menu2">
                    <a class="menuATag" href="/admin/adminMain">
                        <img src="/img/admin/adminLeftTap2/dashboard_none.PNG" class="menu2right" id="dashboard_img"/>
                    </a><img src="/img/admin/adminLeftTap1/dash.PNG" class="menu2left" id="menu_img_dashBoard" />

                    <a class="menuATag" href="/admin/adminMembers">
                        <img src="/img/admin/adminLeftTap2/members_none.PNG" class="menu2right" id="members_img"/>
                    </a><img src="/img/admin/adminLeftTap1/members.PNG" class="menu2left" id="menu_img_members" />

                    <a class="menuATag" href="/admin/adminCampList">
                        <img src="/img/admin/adminLeftTap2/campList_none.PNG" class="menu2right" id="campList_img"/>
                    </a><img src="/img/admin/adminLeftTap1/campList.PNG" class="menu2left" id="menu_img_campList" />

                    <a class="menuATag" href="/admin/adminAddCamperList">
                        <img src="/img/admin/adminLeftTap2/addCamperList_bold.PNG" class="menu2right" id="addCamperList_img"/>
                    </a><img src="/img/admin/adminLeftTap1/addCamperList_red.PNG" class="menu2left" id="menu_img_addCamperList" />

                    <a class="menuATag" href="/admin/adminAutoCampList">
                        <img src="/img/admin/adminLeftTap2/autoCampList_none.PNG" class="menu2right" id="autoCampList_img"/>
                    </a><img src="/img/admin/adminLeftTap1/autoCampList.PNG" class="menu2left" id="menu_img_autoCampList" />

                    <a class="menuATag" href="/admin/adminShareList">
                        <img src="/img/admin/adminLeftTap2/shareList_none.PNG" class="menu2right" id="shareList_img"/>
                    </a><img src="/img/admin/adminLeftTap1/shareList.PNG" class="menu2left" id="menu_img_shareList" />

                    <a class="menuATag" href="/admin/adminReviewList">
                        <img src="/img/admin/adminLeftTap2/reviewList_none.PNG" class="menu2right" id="reviewList_img"/>
                    </a><img src="/img/admin/adminLeftTap1/reviewList.PNG" class="menu2left" id="menu_img_reviewList" />

                    <a class="menuATag" href="/admin/adminGatherCommentList">
                        <img src="/img/admin/adminLeftTap2/commentList_none.PNG" class="menu2right" id="commentList_img"/>
                    </a><img src="/img/admin/adminLeftTap1/commentList.PNG" class="menu2left" id="menu_img_commentList" />
                </div>
            </li>
        </ul>
        <div id="adminMainContentTop">
            <!-- <hr id="hr2px_red"> -->
            캠퍼모집목록
        </div>
        <hr id="hr2px">
        <div class="containerList">
            <!--<div>
						총 레코드 수 : ${apvo.totalRecord} / 총 페이지 개수 : ${apvo.totalPage} / 현재 페이지 번호 : ${apvo.pageNum}
					</div>  -->
            <!-- 검색 -->
            <div>
                <form method="get" action="/admin/adminAddCamperList" id="searchFrm">
                    <select name="searchKey">
                        <option value="title">제목</option>
                        <option value="nickname">작성자</option>
                        <option value="place">위치</option>
                    </select>
                    <input type="text" name="searchWord" id="searchWord" />
                    <input type="submit" value="Search" />
                </form>
            </div>
            <div id="multiDeleteAllCheck">
                &nbsp;<input type="checkbox" id="allCheck" />전체선택
                <input type="button" value="선택삭제" id="multiDel"/>
            </div>
            <form method="post" action="/admin/adminAddCamperListDel" id="listMenuFrm">
                <ul id="listMenu">
                    <li>&nbsp;</li>
                    <li>번호</li>
                    <li>제목</li>
                    <li>위치</li>
                    <li>작성자</li>
                    <li>시작일</li>
                    <li>마감일</li>
                    <li>작성일</li>

                    <div id="listMenuFE">
                        <c:forEach var="vo" items="${list}">
                            <li><input type='checkbox' name='gathernoList' value='${vo.gatherno}' class="chk"/></li>
                            <li>${vo.gatherno}</li>
                            <li><a href="/gather/gatherView?gatherno=${vo.gatherno}">${vo.title}</a></li>
                            <li>${vo.place}</li>
                            <li>${vo.nickname}</li>
                            <li>${vo.startdate}</li>
                            <li>${vo.enddate}</li>
                            <li>${vo.createdate}</li>
                        </c:forEach>
                    </div>
                </ul>
            </form>

            <ul class="paging">
                <!-- 이전페이지 -->
                <c:if test="${apvo.pageNum==1}">
                    <li id="prevBtn">◀</li>
                </c:if>
                <c:if test="${apvo.pageNum>1}">
                    <li><a href="/admin/adminAddCamperList?pageNum=${apvo.pageNum-1}
											<c:if test='${apvo.searchWord!=null}'>
											&searchKey=${apvo.searchKey}
											&searchWord=${apvo.searchWord}
											</c:if>">
                        ◀</a></li>
                </c:if>

                <!-- 페이지번호 -->
                <!-- ${apvo.startPage} ${apvo.startPage+apvo.onePageCount-1}-->
                <c:forEach var="p" begin="${apvo.startPage}" end="${apvo.startPage+apvo.onePageCount-1}">
                    <!--  총 페이지수보다 출력할 페이지번호가 작을때 -->
                    <c:if test="${p<=apvo.totalPage}">
                        <c:if test="${p==apvo.pageNum}">
                            <li id="pagingNumberStyle">
                        </c:if>
                        <c:if test="${p!=apvo.pageNum}">
                            <li>
                        </c:if>
                        <a href="/admin/adminAddCamperList?pageNum=${p}
											<c:if test='${apvo.searchWord!=null}'>
											&searchKey=${apvo.searchKey}
											&searchWord=${apvo.searchWord}
											</c:if>">
                                ${p}</a></li>
                    </c:if>
                </c:forEach>

                <!-- 다음페이지 -->

                <c:if test="${apvo.pageNum == apvo.totalPage}">
                    <li id="nextBtn">▶</li>
                </c:if>
                <c:if test="${apvo.pageNum < apvo.totalPage}">
                    <li><a href="/admin/adminAddCamperList?pageNum=${apvo.pageNum+1}
											<c:if test='${apvo.searchWord!=null}'>
											&searchKey=${apvo.searchKey}
											&searchWord=${apvo.searchWord}
											</c:if>">
                        ▶</a></li>
                </c:if>
            </ul>


        </div>
    </div>

</div>
<%@ include file="/WEB-INF/views/admin/adminBottom.jsp" %>
</body>
</html>