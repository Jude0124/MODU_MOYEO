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
        <div class="col-4"></div>

        <div class="col-4 d-flex justify-content-center">
            <a href="/" class="d-inline-flex justify-content-center align-items-center reset-a" id="brand">
                <img src="/img/main/logo2.png" style="max-width: 70%; height: auto;">
            </a>
        </div>

        <div class="col-4"></div>
    </div>

    <div class="row mb-3">
        <div class="col-6 d-flex flex-column justify-content-start" style="height: 500px">
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
                        <c:if test="${apvo1.pageNum==1}">
                            <li id="prevBtn">◀</li>
                        </c:if>
                        <c:if test="${apvo1.pageNum>1}">
                            <li><a href="/admin?adminUserspageNum=${apvo1.pageNum-1}
											<c:if test='${apvo1.searchWord!=null}'>
											&searchKey=${apvo1.searchKey}
											&searchWord=${apvo1.searchWord}
											</c:if>
                                        ">
                                ◀</a></li>
                        </c:if>

                        <!-- 페이지번호 -->
                        <!-- ${apvo1.startPage} ${apvo1.startPage+apvo1.onePageCount-1}-->
                        <c:forEach var="p" begin="${apvo1.startPage}" end="${apvo1.startPage+apvo1.onePageCount-1}">
                            <!--  총 페이지수보다 출력할 페이지번호가 작을때 -->
                            <c:if test="${p<=apvo1.totalPage}">
                                <c:if test="${p==apvo1.pageNum}">
                                    <li id="pagingNumberStyle">
                                </c:if>
                                <c:if test="${p!=apvo1.pageNum}">
                                    <li>
                                </c:if>
                                <a href="/admin?adminUserspageNum=${p}
											<c:if test='${apvo1.searchWord!=null}'>
											&searchKey=${apvo1.searchKey}
											&searchWord=${apvo1.searchWord}
											</c:if>">
                                        ${p}</a></li>
                            </c:if>
                        </c:forEach>

                        <!-- 다음페이지 -->

                        <c:if test="${apvo1.pageNum == apvo1.totalPage}">
                            <li id="nextBtn">▶</li>
                        </c:if>
                        <c:if test="${apvo1.pageNum < apvo1.totalPage}">
                            <li><a href="/admin?adminUserspageNum=${apvo1.pageNum+1}
											<c:if test='${apvo1.searchWord!=null}'>
											&searchKey=${apvo1.searchKey}
											&searchWord=${apvo1.searchWord}
											</c:if>">
                                ▶</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>

        <%------------------------------------------------------%>

        <div class="col-6 d-flex flex-column justify-content-start" style="height: 500px">
            <div>
                <h5>
                    모집글 관리
                </h5>
            </div>
            <form action="/admin" method="get" id="searchFrm2">
                <div class="d-flex justify-content-start">
                    <select name="searchKey">
                        <option value="nickname">닉네임</option>
                        <option value="title">제목</option>
                        <option value="region">지역</option>
                    </select>
                    <input class="w-75" type="text" name="searchWord" id="searchWord2" placeholder="삭제시키고자 하는 게시글 정보를 입력해주세요.">
                    <input class="w-25" type="submit" value="찾기" id="userSearch2">
                </div>
            </form>
            <div> <%-- class="overflow-auto"--%>
                <div class="multiDeleteAllCheck">
                    &nbsp;<input type="checkbox" id="allCheck2" />전체선택
                    <input type="button" value="선택삭제" id="multiDel2"/>
                </div>
                <div class="w-100">
                    <form method="post" action="/adminUsersDel" class="listMenuFrm">
                        <ul class="listMenu">
                            <li style="width:5%;">&nbsp;</li>
                            <li style="width:19%;">글제목</li>
                            <li style="width:19%;">지역</li>
                            <li style="width:19%;">작성자</li>
                            <li style="width:19%;">작성일</li>
                            <li style="width:19%;">최대인원</li>

                            <div class="listMenuFE">
                                <c:forEach var="vo" items="${adminBoardList}">
                                    <li style="width:5%;" class="text-center"><input type='checkbox' name='nicknameList' value='${vo.nickname}' class="chk2"/></li>
                                    <li style="width:19%;" class="text-center">${vo.title}</li>
                                    <li style="width:19%;" class="text-center">${vo.region}</li>
                                    <li style="width:19%;" class="text-center">${vo.nickname}</li>
                                    <li style="width:19%;" class="text-center">${vo.time}</li>
                                    <li style="width:19%;" class="text-center">${vo.max}</li>
                                </c:forEach>
                            </div>
                        </ul>
                    </form>
                    <ul class="paging">
                        <!-- 이전페이지 -->
                        <c:if test="${apvo2.pageNum==1}">
                            <li id="prevBtn">◀</li>
                        </c:if>
                        <c:if test="${apvo2.pageNum>1}">
                            <li><a href="/admin?adminBoardspageNum=${apvo2.pageNum-1}
											<c:if test='${apvo2.searchWord!=null}'>
											&searchKey=${apvo2.searchKey}
											&searchWord=${apvo2.searchWord}
											</c:if>">
                                ◀</a></li>
                        </c:if>

                        <!-- 페이지번호 -->
                        <!-- ${apvo2.startPage} ${apvo2.startPage+apvo2.onePageCount-1}-->
                        <c:forEach var="p" begin="${apvo2.startPage}" end="${apvo2.startPage+apvo2.onePageCount-1}">
                            <!--  총 페이지수보다 출력할 페이지번호가 작을때 -->
                            <c:if test="${p<=apvo2.totalPage}">
                                <c:if test="${p==apvo2.pageNum}">
                                    <li id="pagingNumberStyle">
                                </c:if>
                                <c:if test="${p!=apvo2.pageNum}">
                                    <li>
                                </c:if>

                                        <a href="/admin?adminBoardspageNum=
                                                ${p}
                                                    <c:if test='${apvo2.searchWord!=null}'>
                                                        &searchKey=${apvo2.searchKey}
                                                        &searchWord=${apvo2.searchWord}
                                                    </c:if>">
                                                ${p}
                                        </a>
                                    </li>
                            </c:if>
                        </c:forEach>

                        <!-- 다음페이지 -->

                        <c:if test="${apvo2.pageNum == apvo2.totalPage}">
                            <li id="nextBtn">▶</li>
                        </c:if>
                        <c:if test="${apvo2.pageNum < apvo2.totalPage}">
                            <li><a href="/admin?adminBoardspageNum=${apvo2.pageNum+1}
											<c:if test='${apvo2.searchWord!=null}'>
											&searchKey=${apvo2.searchKey}
											&searchWord=${apvo2.searchWord}
											</c:if>">
                                ▶</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <%------------------------------------------------------%>

    <div class="row">
        <div class="col-6 d-flex flex-column justify-content-start" style="height: 500px">
            <div>
                <h5>
                    참여 관리
                </h5>
            </div>
            <form action="/admin" method="get" id="searchFrm3">
                <div class="d-flex justify-content-start">
                    <select name="searchKey">
                        <option value="nickname">닉네임</option>
                    </select>
                    <input class="w-75" type="text" name="searchWord" id="searchWord3" placeholder="삭제시키고자 하는 참여자를 입력해주세요.">
                    <input class="w-25" type="submit" value="찾기" id="userSearch3">
                </div>
            </form>
            <div> <%-- class="overflow-auto"--%>
                <div class="multiDeleteAllCheck">
                    &nbsp;<input type="checkbox" id="allCheck3" />전체선택
                    <input type="button" value="선택삭제" id="multiDel3"/>
                </div>
                <div class="w-100">
                    <form method="post" action="/adminUsersDel" class="listMenuFrm">
                        <ul class="listMenu">
                            <li>&nbsp;</li>
                            <li>아이디</li>
                            <li>닉네임</li>
                            <li>지역</li>
                            <li>이메일</li>

                            <div class="listMenuFE">
                                <c:forEach var="vo" items="${adminUserList}">
                                    <li class="text-center"><input type='checkbox' name='nicknameList' value='${vo.nickname}' class="chk3"/></li>
                                    <li class="text-center">${vo.id}</li>
                                    <li class="text-center">${vo.nickname}</li>
                                    <li class="text-center">${vo.region}</li>
                                    <li class="text-center">${vo.email}</li>
                                </c:forEach>
                            </div>
                        </ul>
                    </form>
                    <ul class="paging">
                        <!-- 이전페이지 -->
                        <c:if test="${apvo3.pageNum==1}">
                            <li id="prevBtn">◀</li>
                        </c:if>
                        <c:if test="${apvo3.pageNum>1}">
                            <li><a href="/admin?adminJoinpageNum=${apvo3.pageNum-1}
											<c:if test='${apvo3.searchWord!=null}'>
											&searchKey=${apvo3.searchKey}
											&searchWord=${apvo3.searchWord}
											</c:if>">
                                ◀</a></li>
                        </c:if>

                        <!-- 페이지번호 -->
                        <!-- ${apvo3.startPage} ${apvo3.startPage+apvo3.onePageCount-1}-->
                        <c:forEach var="p" begin="${apvo3.startPage}" end="${apvo3.startPage+apvo3.onePageCount-1}">
                            <!--  총 페이지수보다 출력할 페이지번호가 작을때 -->
                            <c:if test="${p<=apvo3.totalPage}">
                                <c:if test="${p==apvo3.pageNum}">
                                    <li id="pagingNumberStyle">
                                </c:if>
                                <c:if test="${p!=apvo3.pageNum}">
                                    <li>
                                </c:if>
                                <a href="/admin?adminJoinpageNum=${p}
											<c:if test='${apvo3.searchWord!=null}'>
											&searchKey=${apvo3.searchKey}
											&searchWord=${apvo3.searchWord}
											</c:if>">
                                        ${p}</a></li>
                            </c:if>
                        </c:forEach>

                        <!-- 다음페이지 -->

                        <c:if test="${apvo3.pageNum == apvo3.totalPage}">
                            <li id="nextBtn">▶</li>
                        </c:if>
                        <c:if test="${apvo3.pageNum < apvo3.totalPage}">
                            <li><a href="/admin?adminJoinpageNum=${apvo3.pageNum+1}
											<c:if test='${apvo3.searchWord!=null}'>
											&searchKey=${apvo3.searchKey}
											&searchWord=${apvo3.searchWord}
											</c:if>">
                                ▶</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>

        <%------------------------------------------------------%>

        <div class="col-6 d-flex flex-column justify-content-start" style="height: 500px">
            <div>
                <h5>
                    댓글 관리
                </h5>
            </div>
            <form action="/admin" method="get" id="searchFrm4">
                <div class="d-flex justify-content-start">
                    <select name="searchKey">
                        <option value="nickname">닉네임</option>
                        <option value="comment">댓글내용</option>
                        <option value="no">글번호</option>
                        <option value="comment_no">댓글번호</option>
                    </select>
                    <input class="w-75" type="text" name="searchWord" id="searchWord4" placeholder="삭제시키고자 하는 댓글을 입력해주세요.">
                    <input class="w-25" type="submit" value="찾기" id="userSearch4">
                </div>
            </form>
            <div> <%-- class="overflow-auto"--%>
                <div class="multiDeleteAllCheck">
                    &nbsp;<input type="checkbox" id="allCheck4" />전체선택
                    <input type="button" value="선택삭제" id="multiDel4"/>
                </div>
                <div class="w-100">
                    <form method="post" action="/adminUsersDel" class="listMenuFrm">
                        <ul class="listMenu">
                            <li>&nbsp;</li>
                            <li>아이디</li>
                            <li>닉네임</li>
                            <li>지역</li>
                            <li>이메일</li>

                            <div class="listMenuFE">
                                <c:forEach var="vo" items="${adminUserList}">
                                    <li class="text-center"><input type='checkbox' name='nicknameList' value='${vo.nickname}' class="chk4"/></li>
                                    <li class="text-center">${vo.id}</li>
                                    <li class="text-center">${vo.nickname}</li>
                                    <li class="text-center">${vo.region}</li>
                                    <li class="text-center">${vo.email}</li>
                                </c:forEach>
                            </div>
                        </ul>
                    </form>
                    <ul class="paging">
                        <!-- 이전페이지 -->
                        <c:if test="${apvo4.pageNum==1}">
                            <li id="prevBtn">◀</li>
                        </c:if>
                        <c:if test="${apvo4.pageNum>1}">
                            <li><a href="/admin?adminCommentpageNum=${apvo4.pageNum-1}
											<c:if test='${apvo4.searchWord!=null}'>
											&searchKey=${apvo4.searchKey}
											&searchWord=${apvo4.searchWord}
											</c:if>">
                                ◀</a></li>
                        </c:if>

                        <!-- 페이지번호 -->
                        <!-- ${apvo4.startPage} ${apvo4.startPage+apvo4.onePageCount-1}-->
                        <c:forEach var="p" begin="${apvo4.startPage}" end="${apvo4.startPage+apvo4.onePageCount-1}">
                            <!--  총 페이지수보다 출력할 페이지번호가 작을때 -->
                            <c:if test="${p<=apvo4.totalPage}">
                                <c:if test="${p==apvo4.pageNum}">
                                    <li id="pagingNumberStyle">
                                </c:if>
                                <c:if test="${p!=apvo4.pageNum}">
                                    <li>
                                </c:if>
                                <a href="/admin?adminCommentpageNum=${p}
											<c:if test='${apvo4.searchWord!=null}'>
											&searchKey=${apvo4.searchKey}
											&searchWord=${apvo4.searchWord}
											</c:if>">
                                        ${p}</a></li>
                            </c:if>
                        </c:forEach>

                        <!-- 다음페이지 -->

                        <c:if test="${apvo4.pageNum == apvo4.totalPage}">
                            <li id="nextBtn">▶</li>
                        </c:if>
                        <c:if test="${apvo4.pageNum < apvo4.totalPage}">
                            <li><a href="/admin?adminCommentpageNum=${apvo4.pageNum+1}
											<c:if test='${apvo4.searchWord!=null}'>
											&searchKey=${apvo4.searchKey}
											&searchWord=${apvo4.searchWord}
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
