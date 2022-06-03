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
            <form action="/admin" method="get">
                <div class="d-flex justify-content-start">
                    <input class="w-75" type="search" name="searchId" placeholder="탈퇴시키고자 하는 회원의 닉네임을 입력해주세요">
                    <input class="w-25" type="submit" value="찾기">
                </div>
            </form>
            <div class="overflow-auto">
                <table class="w-100">
                    <thead>
                    <tr class="text-center">
                        <th>□</th>
                        <th>아이디</th>
                        <th>닉네임</th>
                        <th>지역</th>
                        <th>이메일</th>
                        <th>관리자</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr class="text-center">
                        <td>□</td>
                        <td>asd123</td>
                        <td>남우위키</td>
                        <td>서울어딘가</td>
                        <td>이메일?</td>
                        <td>관리자</td>
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
                <form class="w-100 d-flex justify-content-center w-100" action="/admin" method="get">
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
                        <th>□</th>
                        <th>글번호</th>
                        <th>지역</th>
                        <th>모임이름</th>
                        <th>참여인원</th>
                        <th>작성자</th>
                        <th>작성시간</th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr class="text-center">
                            <td>□</td>
                            <td>1</td>
                            <td>서초구</td>
                            <td>아메가메돌진하실분 구합니다.</td>
                            <td>4</td>
                            <td>달헤는 밤</td>
                            <td>2022-06-02</td>
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
                <form class="w-100" action="/admin" method="get">
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
                        <th>□</th>
                        <th>참여글번호</th>
                        <th>참여자</th>
                        <th>모임이름</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr class="text-center">
                        <td>□</td>
                        <td>1</td>
                        <td>별헤는 밤</td>
                        <td>아메가메돌진 하러 가실분 구합니다.</td>
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
                <form class="w-100" action="/admin" method="get">
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
                        <th>□</th>
                        <th>모임명</th>
                        <th>닉네임</th>
                        <th>댓글</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr class="text-center">
                        <td>□</td>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
