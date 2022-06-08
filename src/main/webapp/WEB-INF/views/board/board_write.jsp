<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"/>
	<meta name="viewport"
		  content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>글쓰기 - 모두모여</title>
	<link rel="shorcut icon" type="image/x-icon" href="/img/main/favicon.ico">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/js/board/board_write.js"></script>
	<link rel="stylesheet" href="/css/board/board_write.css" type="text/css"/>
</head>

<body>
<%@ include file="../main/main_header.jsp" %>

<div class="write">

	<div id="write_box">
		<div class="title">
			<img src="/img/main/logo.png">
			<img src="/img/main/write.png">
		</div>

		<form class="form-group" id="writeForm" name="writeForm" method="post" action="/boardWriteOK">
			<input type="hidden" name="time" id="boardTime" value=""/>
			<div>
				<div class="write_top">
					<c:set var = "nickname" value="${userInfo.nickname}"/>
					<c:set var = "no" value="${nickname.charAt(0) + 65536}"/>
					<c:if test="${no % 7 == 0}">
						<div class="nick_icon" style="background: #ff0000;">
					</c:if>
					<c:if test="${no % 7 == 1}">
						<div class="nick_icon" style="background: #ff8c00;">
					</c:if>
					<c:if test="${no % 7  == 2}">
						<div class="nick_icon" style="background: #ffff00; color: black;">
					</c:if>
					<c:if test="${no % 7  == 3}">
						<div class="nick_icon" style="background: #008000;">
					</c:if>
					<c:if test="${no % 7  == 4}">
						<div class="nick_icon" style="background: #0000ff;">
					</c:if>
					<c:if test="${no % 7  == 5}">
						<div class="nick_icon" style="background: #4b0082;">
					</c:if>
					<c:if test="${no % 7  == 6}">
						<div class="nick_icon" style="background: #800080;">
					</c:if>
					${fn:substring(nickname, 0, 1)}</div>
					<input type="text" name="nickname" id="boardNickname" value = "${userInfo.nickname}" readonly/><br/>
					#<input type="text" name="region" id="boardRegion" value = "${userInfo.region}" readonly/>
					<div class="number_box">
						참여인원 : <input type="number" id="boardMax" name="max" min="1" max="30" placeholder=""/>
					</div>
				</div>

				<div class="write_bottom">
					<textarea type="text" name="title" id="boardTitle" placeholder="참여를 제안해보세요!"></textarea>
					<div class="btns">
						<div class="btn_box">
							<input type="submit" class="btn" id="writeBtn" value="등록"/>
							<a href="/boardList"><input type="button" class="btn" id="resetBtn" value="취소"/></a>
						</div>
					</div>
				</div>

			</div>
		</form>

	</div>

</div>

<%@ include file="../main/main_footer.jsp" %>
</body>
</html>