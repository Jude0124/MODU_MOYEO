<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko" >
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>관리자페이지 - 모두모여</title>
    <link rel="shorcut icon" type="image/x-icon" href="/img/main/favicon.ico">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
    />
    <link rel="stylesheet" type="text/css" href="/css/admin/adminUser.css"/>

    <script>
        $(function(){

            //리스트 체크하기
            $("#allCheck2").click(function(){
                $(".chk2").prop("checked", $("#allCheck2").prop("checked"));
            });

            $("#multiDel2").click(function(){
                var cnt = 0;
                $(".chk2").each(function(i, obj){
                    if(obj.checked){
                        cnt++;//checkbox가 체크 상태일 때...
                    }
                });
                if(cnt<=0){ // or cnt<1
                    alert("목록을 선택 후 삭제하세요..")
                    return false;
                }
                $(".listMenuFrm").submit();
            });
        });
        $(function(){

            //리스트 체크하기
            $("#allCheck3").click(function(){
                $(".chk3").prop("checked", $("#allCheck3").prop("checked"));
            });

            $("#multiDel3").click(function(){
                var cnt = 0;
                $(".chk3").each(function(i, obj){
                    if(obj.checked){
                        cnt++;//checkbox가 체크 상태일 때...
                    }
                });
                if(cnt<=0){ // or cnt<1
                    alert("목록을 선택 후 삭제하세요..")
                    return false;
                }
                $(".listMenuFrm").submit();
            });
        });
        $(function(){

            //리스트 체크하기
            $("#allCheck4").click(function(){
                $(".chk4").prop("checked", $("#allCheck4").prop("checked"));
            });

            $("#multiDel4").click(function(){
                var cnt = 0;
                $(".chk4").each(function(i, obj){
                    if(obj.checked){
                        cnt++;//checkbox가 체크 상태일 때...
                    }
                });
                if(cnt<=0){ // or cnt<1
                    alert("목록을 선택 후 삭제하세요..")
                    return false;
                }
                $(".listMenuFrm").submit();
            });
        });
        function memberDelChk(id){
            if(confirm("회원("+id+") 정보를 삭제하시겠습니까?")) {
                location.href="/adminUsersDel?id="+id;
            }
        }
    </script>
</head>
<body>
<%@ include file="../main/main_header.jsp" %>


<div id="admin">

    <div id="admin_box">
        <div class="title">
            <img src="/img/main/logo2.png"/>
        </div>
        <div class="forbidden">
            <h3>해당 기기로는 관리자페이지 접속이 불가합니다.</h3>
        </div>
        <div id="admin_menu">
            <a href="/adminBoards" class="Btn1" style="color: #fff;">모집글관리</a>
            <a href="/adminJoin" style="color:white;" class="Btn2">참여관리</a>
            <a href="/adminComment" style="color:white;" class="Btn3">댓글관리</a>
        </div>
        <div id="Show1" class="row mb-3" style="border:1px solid #d0d0d0; padding:10px; width: 800px; height: 530px;">
            <div class="col-12 d-flex flex-column justify-content-start" style="height: 500px;">
                <div style="width: 800px;">
                    <h4 style="text-align: left;">
                        <a href="/admin" style="color: #00C471;">유저 관리</a>
                    </h4>
                </div>
                <form action="/admin" method="get" id="searchFrm1" style="width: 800px;">
                    <div class="d-flex justify-content-start" >
                            <select name="searchKey" style="width: 80px; text-align: center;">
                                <option value="nickname">닉네임</option>
                                <option value="email">이메일</option>
                                <option value="id">아이디</option>
                            </select>
                            <input
                                    class="w-auto" type="text" name="searchWord" id="searchWord1"
                                    style="padding: 0 10px;"
                                    placeholder="전체 유저 검색"
                            >
                            <input class="w-auto" type="submit" value="찾기" id="userSearch1" style="padding:0 15px;">
                    </div>
                </form>
                <div> <%-- class="overflow-auto"--%>
                    <div style="margin-top:40px;" class="w-100">
                            <ul class="listMenu">
                                <li style="width:20%; border-bottom: 3px solid #ddd;">아이디</li>
                                <li style="width:20%; border-bottom: 3px solid #ddd;">닉네임</li>
                                <li style="width:20%; border-bottom: 3px solid #ddd;">지역</li>
                                <li style="width:30%; border-bottom: 3px solid #ddd;">이메일</li>
                                <li style="width:10%; border-bottom: 3px solid #ddd;">&nbsp;</li>

                                <div class="listMenuFE" >
                                <c:forEach var="vo" items="${adminUserList}">

                                    <li style="width:20%;" class="text-center">${vo.id}</li>
                                    <li style="width:20%" class="text-center">${vo.nickname}</li>
                                    <li style="width:20%" class="text-center">${vo.region}</li>
                                    <li style="width:30%" class="text-center">${vo.email}</li>
                                    <li style="border:2px solid black; margin:2px;background-color:#626262; width:9%;"><a style="color:white;" class="delBtn" href="javascript:memberDelChk('${vo.id}')">탈퇴</a></li>
                                </c:forEach>
                                </div>
                            </ul>
                        <ul class="paging">
                            <!-- 이전페이지 -->
                            <c:if test="${apvo.pageNum==1}">
                                <li id="prevBtn">◀</li>
                            </c:if>
                            <c:if test="${apvo.pageNum>1}">
                                <li><a href="/admin?pageNum=${apvo.pageNum-1}
                                                <c:if test='${apvo.searchWord!=null}'>
                                                &searchKey=${apvo.searchKey}
                                                &searchWord=${apvo.searchWord}
                                                </c:if>
                                            ">
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
                                    <a href="/admin?pageNum=${p}
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
                                <li><a href="/admin?pageNum=${apvo.pageNum+1}
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
        </div>

    </div>
</div>

<%@ include file="../main/main_footer.jsp" %>
</body>
</html>
