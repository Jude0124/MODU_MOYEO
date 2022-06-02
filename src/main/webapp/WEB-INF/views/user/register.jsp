<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko" >
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>회원가입 - 모두모여</title>
    <link rel="shorcut icon" type="image/x-icon" href="/img/main/favicon.ico">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" />
    <script src="/js/user/register.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/user/register.css"/>
</head>


<body>
<%@ include file="../main/main_header.jsp" %>

<div id="register">
    <div id="register_box">
        <div class="title">
            <img src="/img/main/logo.png">
            <img src="/img/user/register.png">
        </div>

                <input
                        type="text"
                        class="form-control input-border"
                        id="nick-name"
                        name="nick-name"
                        required
                />
                <button
                        type="button"
                        class="btn w-25"
                        style="background-color: #00C471; color: white"
                        disabled
                ><i class="bi bi-arrow-clockwise"></i></button>
            </div>

        </div>
        <div class="email-form mt-2">
            <label for="email" class="form-label">E-mail</label>
            <input
                    type="email"
                    class="form-control"
                    id="email"
                    name="email"
                    placeholder="xxxx@xxxx.xxx 형식으로 입력해주세요"
                    required
            />
            <div id="emailError" class="error"></div>
            <div class="feedback-email"></div>
        </div>
        <div class="region-form mt-2">
            <label for="region" class="form-label">내 지역</label>
            <div>
                <select class="form-select" id="region" required>
                    <option value="" disabled selected >-- 내 지역 선택 --</option>
                    <option value="1">강남구</option>
                    <option value="2">강동구</option>
                    <option value="3">강북구</option>
                    <option value="4">강서구</option>
                    <option value="5">관악구</option>
                    <option value="6">광진구</option>
                    <option value="7">구로구</option>
                    <option value="8">금천구</option>
                    <option value="9">노원구</option>
                    <option value="10">도봉구</option>
                    <option value="11">동대문구</option>
                    <option value="12">동작구</option>
                    <option value="13">마포구</option>
                    <option value="14">서대문구</option>
                    <option value="15">서초구</option>
                    <option value="16">성동구</option>
                    <option value="17">성북구</option>
                    <option value="18">송파구</option>
                    <option value="19">양천구</option>
                    <option value="20">영등포구</option>
                    <option value="21">용산구</option>
                    <option value="22">은평구</option>
                    <option value="23">종로구</option>
                    <option value="24">중구</option>
                    <option value="25">중랑구</option>
                </select>

                <input type="submit" class="btn_register" value="회원가입" id="submit"/>
            </form>
        </div>
    </div>
</div>

<%@ include file="../main/main_footer.jsp" %>
</body>
</html>
