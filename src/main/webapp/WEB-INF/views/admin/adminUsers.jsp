<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <title>admin</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
    />

    <style>
        .multiDeleteAllCheck{
            position: relative;
            left:7%;
        }
        a, a:visited, a:link, a:hover{
            color : black;
            text-decoration: none;
        }
        a:active {
            color : #00C471;
        }
        #searchWord1, #searchWord2, #searchWord3, #searchWord4{
            border: 2px solid black;
            outline: none;
        }
        .paging{

            text-align:center;
            height: 30px;
            overflow: auto;
        }
        .paging>li{
            width:30px;
            display:inline-block;
        }
        .paging #prevBtn, .paging #nextBtn {
            visibility: hidden;
        }
        .paging #pagingNumberStyle {
            background-color:white;font-weight:bold;font-size: 1.1em;
        }
        li {
            margin:0;
            padding:0;
            list-style-type: none;
        }
        #listMenu{
            overflow:auto;
        }
        .listMenu>li:nth-child(5n+1) {
            width:8%;
        }
        .listMenu>.listMenuFE>li:nth-child(5n+1) {
            width:8%;
        }
        .listMenu>li, .listMenu>.listMenuFE>li{
            float:left;
            height: 30px;
            line-height: 30px;
            width:23%;
            text-align: center;/*left*/
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            padding:0px 5px;
        }
        .listMenu>li{
            font-weight: bold;
        }
        .listMenu>.listMenuFE>li{
            font-weight: normal;
        }
        body {
            font-family:  'Nanum Gothic', sans-serif;
            font-weight: bolder;
        }
        .reset-a {
            color: #fff;
            text-decoration: none;
            outline: none;
        }
        .reset-a:hover,
        .reset-a:active {
            text-decoration: none;
            color: #fff;
            cursor: pointer;
        }
        h5 {
            color: #00C471;
            font-family:  'Nanum Gothic', sans-serif;
            font-weight: bolder;
        }
        input[type=search]{
            border : 2px solid black;
            outline : none;
        }
        input[type=submit]{
            border : 0px;
            background-color: #00C471;
            font-family:  'Nanum Gothic', sans-serif;
            font-weight: bolder;
            color : white;
        }
        input:focus {
            outline: none;
        }


    </style>
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
<div class="container">
    <div class="row m-4">
        <div class="col-12"></div>

        <div class="col-12 d-flex justify-content-center">
            <a href="/" class="d-inline-flex justify-content-center align-items-center reset-a" id="brand">
                <img src="/img/main/logo2.png" style="max-width: 70%; height: auto;">
            </a>
        </div>

        <div class="row">
            <div class="col-3">
                <ul>
                    <li class="w-100"  style="height:70px;line-height:70px;text-align:center;border:2px solid black;background-color:#00C471;"><a href="/admin" style="color:white;" class="delBtn">유저관리</a></li>
                </ul>
            </div>
            <div class="col-3">
                <ul>
                    <li class="w-100"  style="height:70px;line-height:70px;text-align:center;border:2px solid black;background-color:#00C471;"><a href="/adminBoards" style="color:white;" class="delBtn">모집글관리</a></li>
                </ul>
            </div>
            <div class="col-3">
                <ul>
                    <li class="w-100"  style="height:70px;line-height:70px;text-align:center;border:2px solid black;background-color:#00C471;"><a href="/adminJoin" style="color:white;" class="delBtn">참여관리</a></li>
                </ul>
            </div>
            <div class="col-3">
                <ul>
                    <li class="w-100"  style="height:70px;line-height:70px;text-align:center;border:2px solid black;background-color:#00C471;"><a href="/adminComment" style="color:white;" class="delBtn">댓글관리</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="row mb-3">
        <div class="col-12 d-flex flex-column justify-content-start" style="height: 500px">
            <div>
                <h5>
                    유저 관리
                </h5>
            </div>
            <form action="/admin" method="get" id="searchFrm1">
                <div class="d-flex justify-content-start">
                        <select name="searchKey">
                            <option value="nickname">닉네임</option>
                            <option value="email">이메일</option>
                            <option value="id">아이디</option>
                        </select>
                        <input class="w-75" type="text" name="searchWord" id="searchWord1" placeholder="탈퇴시키고자 하는 회원의 정보를 입력해주세요">
                        <input class="w-25" type="submit" value="찾기" id="userSearch1">
                </div>
            </form>
            <div> <%-- class="overflow-auto"--%>
                <div style="margin-top:48px;" class="w-100">
                        <ul class="listMenu">
                            <li style="width:20%">아이디</li>
                            <li style="width:20%">닉네임</li>
                            <li style="width:20%">지역</li>
                            <li style="width:20%">이메일</li>
                            <li style="width:20%">&nbsp;</li>

                            <div class="listMenuFE">
                            <c:forEach var="vo" items="${adminUserList}">

                                <li style="width:20%" class="text-center">${vo.id}</li>
                                <li style="width:20%" class="text-center">${vo.nickname}</li>
                                <li style="width:20%" class="text-center">${vo.region}</li>
                                <li style="width:20%" class="text-center">${vo.email}</li>
                                <li style="border:2px solid black; margin:2px;background-color:#00C471; width:19%;"><a style="color:white;" class="delBtn" href="javascript:memberDelChk('${vo.id}')">탈퇴</a></li>
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
</body>
</html>
