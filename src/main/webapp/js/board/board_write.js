$(()=>{

    $("#writeForm").submit(function(){
        const now = new Date();
        const year = now.getFullYear();
        const month = now.getMonth()+1;
        const date = now.getDate();
        const hours = now.getHours();
        const minutes = now.getMinutes();
        const seconds = now.getSeconds();

        const fulldate = year + "-" + (("0"+month.toString()).slice(-2)) + "-" + (("0"+date.toString()).slice(-2))
            + " " + hours + ":" + (("0"+minutes.toString()).slice(-2)) + ":" + (("0"+seconds.toString()).slice(-2));

        $("#boardTime").val(fulldate);

        if($("#boardMax").val()==''){
            alert('참여인원을 설정해주세요.');
            return false;
        }

        if($("#boardTitle").val()==''){
            alert('내용을 입력해주세요.');
            return false;
        }

    });

});