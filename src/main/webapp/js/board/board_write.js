$(()=>{

    $("#writeForm").submit(function(){
        const now = new Date();
        const utc =
            now.getTime() +
            (now.getTimezoneOffset() * 60 * 1000);
        const KR_TIME_DIFF = 9 * 60 * 60 * 1000;
        const kr_curr =
            new Date(utc + (KR_TIME_DIFF));
        const year = kr_curr.getFullYear();
        const month = kr_curr.getMonth()+1;
        const date = kr_curr.getDate();
        const hours = kr_curr.getHours();
        const minutes = kr_curr.getMinutes();
        const seconds = kr_curr.getSeconds();

        const fulldate = year + "-" + (("00"+month.toString()).slice(-2)) + "-" + (("00"+date.toString()).slice(-2))
            + " " + (("00"+hours.toString()).slice(-2)) + ":" + (("00"+minutes.toString()).slice(-2)) + ":" + (("00"+seconds.toString()).slice(-2));

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
