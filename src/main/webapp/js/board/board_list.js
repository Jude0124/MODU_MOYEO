$(document).ready(function(){
    $("#listMenuFE>div[class='list_select']").click(function(){
        var idName = $(this).attr('id');
        if($(this).hasClass("on")){
            $(this).removeClass("on");
            $(".select_view").slideUp();
        }else{
            $(".list_select").removeClass("on");
            $(this).addClass("on");
            $(".select_view").slideUp();
            $('.' + idName).slideDown();
        }

        $(".reply_form" + idName).submit(function(){
            event.preventDefault();
            if($(".comment_area" + idName).val()==="") {
                alert("내용을 입력후 등록하세요.");
                return false;
            }else {
                var params = $(".reply_form" + idName).serialize();
                $.ajax({
                    url: 'comment/commentOk',
                    async: true,
                    data: params,
                    type: 'POST',
                    success: function(r){
                        $(".comment_area" + idName).val("");
                        reviewListAll();
                    },
                    error: function(e){
                        console.log(e.responseText);
                    }
                });
            }
        });

        function reviewListAll() {
            $.ajax({
                url: 'comment/commentList',
                data: {
                    no: idName
                },
                success: function(result) {
                    var $result = $(result);
                    var tag = "";
                    var cnt = 0;
                    var session_nickname = "${sessionScope.loginUser.getNickname()}";
                    $result.each(function(idx, vo){
                        tag += "<li><div class='reply_content'>";
                        if(vo.nickname.charCodeAt(0) % 7 == 0){
                            tag += "<div class='nick_icon' style='background: #ff0000;'>";
                        }
                        if(vo.nickname.charCodeAt(0) % 7 == 1){
                            tag += "<div class='nick_icon' style='background: #ff8c00;'>";
                        }
                        if(vo.nickname.charCodeAt(0) % 7 == 2){
                            tag += "<div class='nick_icon' style='background: #ffff00; color: black;'>";
                        }
                        if(vo.nickname.charCodeAt(0) % 7 == 3){
                            tag += "<div class='nick_icon' style='background: #008000;'>";
                        }
                        if(vo.nickname.charCodeAt(0) % 7 == 4){
                            tag += "<div class='nick_icon' style='background: #0000ff;'>";
                        }
                        if(vo.nickname.charCodeAt(0) % 7 == 5){
                            tag += "<div class='nick_icon' style='background: #4b0082;'>";
                        }
                        if(vo.nickname.charCodeAt(0) % 7 == 6){
                            tag += "<div class='nick_icon' style='background: #800080;'>";
                        }
                        tag += vo.nickname.substring(0,1) + "</div>";
                        tag += "<div class='comment_view'><b class='reply_nickname'>" + vo.nickname + "</b>";
                        tag += "<span>" + vo.comment + "</span><br/>";
                        tag += "<span class='reply_time'>" + vo.time + "</span>";
                        if(session_nickname === vo.nickname) {
                            tag += "<input type='button' value='삭제' title='" + vo.comment_no + "' class='reply_edit_del'/>";
                        }
                        tag += "</div></li>";
                        cnt++;
                    });
                    $("#reply_list" + idName).html(tag);

                    var tag2 = "";
                    tag2 += "<span class='reply_num'>속닥속닥 ";
                    if(cnt > 0) {
                        tag2 += cnt;
                    }
                    tag2 += "</span>";
                    $("#reply_view_top" + idName).html(tag2);
                },
                error: function(e) {
                    console.log(e.responseText);
                }
            });
        }

        $(document).on('click', '.reply_content input[value="삭제"]', function(){
            if(confirm('댓글을 삭제하시겠습니까?')){
                var params = "comment_no=" + $(this).attr("title");
                $.ajax({
                    url: 'comment/commentDel',
                    data: params,
                    success: function(result){
                        reviewListAll();
                    },
                    error: function(e) {
                        console.log(e.responseText);
                    }
                })
            }
        });
        reviewListAll();
    });

    const container = document.querySelector("#board_list");
    const box = container.querySelector(".btn_box");

    const {width:containerWidth, height:containerHeight} =
        container.getBoundingClientRect();
    const {width:boxWidth, height:boxHeight} =
        box.getBoundingClientRect();
    let isDragging = null;
    let originLeft = null;
    let originTop = null;
    let originX = null;
    let originY = null;

    box.addEventListener("mousedown", (e) => {
        isDragging = true;
        originX = e.clientX;
        originY = e.clientY;
        originLeft = box.offsetLeft;
        originTop = box.offsetTop;
    });

    document.addEventListener("mouseup", (e) => {
        isDragging = false;
    });

    document.addEventListener("mousemove", (e) => {
        if(isDragging){
            const diffX = e.clientX - originX;
            const diffY = e.clientY - originY;
            const endOfXPoint = containerWidth - boxWidth;
            const endOfYPoint = containerHeight - boxHeight;
            box.style.left = Math.min(Math.max(0, originLeft + diffX), endOfXPoint) + "px";
            box.style.top = Math.min(Math.max(0, originTop + diffY), endOfYPoint) + "px";
        }
    });
});