<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/board/writedit.css" type="text/css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/js/board/writedit.js"></script>
<body>
<%@ include file="../main/main_header.jsp" %>
<div class="container">
	<h1>참여를 제안해보세요!</h1>
	<div id="gatherWrite">
		<form class="form-group" id="writeForm" method="post" action="/boardWriteOK">
			<div>
				<div>
					<div class="writeMark">제목</div>
				</div>
				<div class="writeTitle">
					<input style="width:100%;" type="text" name="title" id="boardTitle" placeholder="제목을 적어주세요"/>
				</div>
				<div>
					<div class="writeMark">참여인원</div>
				</div>
				<div>
					<div class="writeTitle">
						<input style="width:100%;"type="number" id="number" name="no" min="1" max="30" placeholder="참여인원수를 적어주세요. 참여인원은 1~30명 입니다."/>
					</div>
				</div>
				<div class="btns">
					<input type="submit" class="btn" id="writeBtn" value="등록"/>
					<a href="/boardList"><input type="button" class="btn" id="resetBtn" value="취소"/></a>
				</div>
			</div>
		</form>
	</div>
</div>
<br/>
</body>