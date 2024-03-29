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
            <form action="/admin/userSearch" method="get">
                <div class="d-flex justify-content-start">
                    <input class="w-75" type="search" name="searchId" placeholder="탈퇴시키고자 하는 회원의 닉네임을 입력해주세요">
                    <input class="w-25" type="submit" value="찾기">
                </div>
            </form>
            <div class="overflow-auto">
                <table class="w-100">
                    <thead>
                    <tr class="text-center">
                        <th>아이디</th>
                        <th>닉네임</th>
                        <th style="width: 15%">지역</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr th:each="user:${userList}">
                        <td>
                            <div class="w-100 text-center" th:text="${user.userIdx}"></div>
                        </td>
                        <td>
                            <div class="w-100 text-center" th:text="${user.userId}"></div>
                        </td>
                        <td th:if="${user.role == 'ROLE_AUTH'}">
                            <input class="userId" type="hidden" th:value="${user.userId}">
                            <input class="w-100" type="button" th:onclick="roleDelete(event)" th:value="인증박탈">
                        </td>
                        <td th:unless="${user.role == 'ROLE_AUTH'}">
                        </td>
                        <td  th:with="text=${user.lockUser?'해제':'잠금'}">
                            <div class="w-100 text-center" th:if="${user.role == 'ROLE_ADMIN'}">관리자</div>
                            <div class="w-100" th:unless="${user.role == 'ROLE_ADMIN'}">
                                <input type="hidden" th:value="${user.userId}">
                                <input class="w-100" type="button" th:onclick="lockToggle(event, [[${user.lockUser}]])" th:value="${text}">
                            </div>
                        </td>
                        <td>
                            <input class="userId" type="hidden" th:value="${user.userId}">
                            <input class="w-100" type="button" th:onclick="userDelete(event)" th:value="삭제">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-6 d-flex flex-column justify-content-start" style="height: 500px">
            <div>
                <h5>
                    모임글 관리
                </h5>
            </div>
            <div class="w-100">
                <form class="w-100 d-flex justify-content-center w-100" action="/admin/boardSearchByUserId" method="get">
                    <div class="row d-flex justify-content-center w-100">
                        <input class="w-75 p-0" type="search" name="searchId" placeholder="삭제하고자 하는 글번호를 입력하세요">
                        <input class="w-25" type="submit" value="찾기">
                    </div>
                </form>
            </div>
            <div class="overflow-auto">
                <table class="w-100">
                    <thead>
                    <tr class="text-center">
                        <th>글번호</th>
                        <th>모임이름</th>
                        <th>참여인원</th>
                        <th>작성자</th>
                        <th>작성시간</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr th:each="board:${boardList}">
                        <td>
                            <div class="w-100 text-center" th:text="${board.bid}"></div>
                        </td>
                        <td>
                            <div class="w-100 text-center" th:text="${board.author}"></div>
                        </td>
                        <td>
                            <div class="w-100 text-center" th:text="${board.title}"></div>
                        </td>
                        <td th:with="text=${board.visible?'숨기기':'보이기'}">
                            <input class="w-100" type="button" th:onclick="visibleToggle([[${board.bid}]], [[${board.visible}]])" th:value="${text}">
                        </td>
                        <td>
                            <input class="w-100" type="button" th:onclick="boardDelete([[${board.bid}]])" th:value="삭제">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-6 d-flex flex-column justify-content-start" style="height: 500px">
            <div>
                <h5>
                    모임인원 관리
                </h5>
            </div>
            <div class="d-flex w-100">
                <form class="w-100" action="/admin/noticeSearchByTitle" method="get">
                    <div class="d-flex justify-content-center">
                        <input class="w-75" type="search" name="searchTitle" placeholder="모임번호를 입력해 주세요">
                        <input class="w-25" type="submit" value="찾기">
                    </div>
                </form>
            </div>
            <div class="overflow-auto">
                <table class="w-100">
                    <thead>
                    <tr class="text-center">
                        <th>참여자</th>
                        <th>모임이름</th>
                        <th>삭제</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr th:each="notice:${noticeList}">
                        <td>
                            <div class="text-center" th:text="${notice.bid}"></div>
                        </td>
                        <td>
                            <div class="text-center" th:text="${notice.author}"></div>
                        </td>
                        <td>
                            <div class="text-center" th:text="${notice.title}"></div>
                        </td>
                        <td>
                            <form class="w-100" th:action="@{/notice/rewrite}" th:method="GET">
                                <input type="hidden" name="bid" th:value="${notice.bid}">
                                <input class="w-100" type="submit" th:value="수정">
                            </form>
                        </td>
                        <td>
                            <form class="w-100" th:action="@{/notice/delete(bid=${notice.bid})}" th:method="POST">
                                <input class="w-100" type="submit" th:value="삭제">
                            </form>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-6 d-flex flex-column justify-content-start" style="height: 500px">
            <div>
                <h5>
                    댓글관리
                </h5>
            </div>
            <div class="d-flex">
                <form class="w-100" action="/admin/preAuthUserDataSearchByUserId" method="get">
                    <div class="d-flex justify-content-center w-100">
                        <input class="w-75" type="search" name="searchId" placeholder="모임번호를 입력해주세요">
                        <input class="w-25" type="submit" value="찾기">
                    </div>
                </form>
            </div>
            <div class="overflow-auto">
                <table class="w-100">
                    <thead>
                    <tr class="text-center">
                        <th>모임명</th>
                        <th>닉네임</th>
                        <th>댓글</th>
                        <th>삭제</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr th:each="preAuthUserData:${preAuthUserDataList}">
                        <td>
                            <div class="text-center" th:text="${preAuthUserData.aid}"></div>
                        </td>
                        <td>
                            <div class="text-center" th:text="${preAuthUserData.courseName}"></div>
                        </td>
                        <td>
                            <div class="text-center" th:text="${preAuthUserData.userId}"></div>
                        </td>
                        <td>
                            <input class="w-100" type="button" th:onclick="authPopUp([[${preAuthUserData.aid}]])" th:value="인증">
                        </td>
                        <td>
                            <input class="w-100" type="button" th:onclick="denyAuth([[${preAuthUserData.aid}]])" th:value="거부">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script th:inline="javascript" th:src="@{/js/admin/lock-toggle.js}">
    </script>
    <script th:inline="javascript" th:src="@{/js/admin/visible-toggle.js}">
    </script>
    <script th:inline="javascript" th:src="@{/js/admin/user-delete.js}">
    </script>
    <script th:inline="javascript" th:src="@{/js/admin/role-delete.js}">
    </script>
    <script th:inline="javascript" th:src="@{/js/admin/board-delete.js}">
    </script>
    <script th:inline="javascript" th:src="@{/js/admin/notice-delete.js}">
    </script>
    <script th:inline="javascript">
        function authPopUp(authId){
            let popUrl = "/admin/auth?authId="+authId;
            var popWidth = 450;
            var popHeight = 500;
            var winHeight = document.body.clientHeight;	  // 현재창의 높이
            var winWidth = document.body.clientWidth;	  // 현재창의 너비
            var winX = window.screenLeft;	                          // 현재창의 x좌표
            var winY = window.screenTop;	                          // 현재창의 y좌표
            var popX = winX + (winWidth - popWidth)/2;
            var popY = winY + (winHeight - popHeight)/2;
            window.open(popUrl,"인증 허가","top="+popY+", left="+popX+",width="+popWidth+",height="+popHeight+", scrollbars=yes,resizable=yes");
        }
    </script>
    <script th:inline="javascript">
        function noticeModify(bid){
            let params = {
                bid: bid
            };
            $.ajax({
                type: 'POST',
                url: '/notice/rewrite',
                dataType: 'json',
                data: JSON.stringify(params),
                contentType: 'application/json',
                success: function (result) {
                    if (result) {
                        location.reload();
                    }
                },
                error: function (request, status, error) {
                }
            });
        }
    </script>
    <script th:inline="javascript" th:src="@{/js/admin/deny-auth.js}">
    </script>
</div>
</body>
</html>
