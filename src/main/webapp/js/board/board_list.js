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