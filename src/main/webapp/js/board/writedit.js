$(function(){
	// 글 등록폼에 빈칸으로 두면 alert 설정
	$("#writeForm").submit(function(){
		if($("#gatherTitle").val()==''){
			alert("제목을 입력해주세요");
			return false;
		}
		if($("#number").val()=='' || $("#number").val()==0){
			alert("참여인원을 입력해주세요");
			return false;
		}
		if($("number").val()>=31) {
			alert("참여인원을 확인해주세요.");
			return false;
		}
		if(CKEDITOR.instances.content.getData()==''){
			alert("내용을 입력해주세요");
			return false;
		}
	});
});