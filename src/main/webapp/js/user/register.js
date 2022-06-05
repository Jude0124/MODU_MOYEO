$(()=>{
    /* id, email input 값 변경 시 중복체크한 내용 사라짐 */
    $("#userId").change(function(){
        $('#idCheckResult').val('')
    });
    $("#email").change(function(){
        $('#emailCheckResult').val('')
    });

    /* form submit 유효성 체크 */
    var error = document.querySelectorAll('.msgError');
    $("#signUp-form").submit(function(){

        //아이디 유효성검사
        var reg = /^[a-z0-9]{5,15}$/;
        if($("#userId").val()==''){
            error[0].innerHTML = "아이디를 입력하세요.";
            error[0].style.display = "inline-block";
            error[0].style.color = "red";
            $("#userId").focus();
            return false;
        }
        else if(!reg.test($("#userId").val())){
            error[0].innerHTML = "5~15자의 영문 소문자, 숫자만 사용 가능합니다."
            error[0].style.display = "inline-block";
            error[0].style.color = "red";
            $("#userId").focus();
            return false;
        }else if($('#idCheckResult').val()===""){
            error[0].innerHTML = "아이디 중복확인을 진행해주세요.";
            error[0].style.display = "inline-block";
            error[0].style.color = "red";
            return false;
        }
        else{
            error[0].style.display = "none";
        }

        // 비밀번호 유효성검사
        reg = /^[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{5,15}$/;
        if($("#password").val()==''){
            error[1].innerHTML = "비밀번호를 입력하세요.";
            error[1].style.display = "inline-block";
            error[1].style.color = "red";
            $("#password").focus();
            return false;
        }else if(!reg.test($("#password").val())){
            error[1].innerHTML = "5~15자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
            error[1].style.display = "inline-block";
            error[1].style.color = "red";
            $("#password").focus();
            return false;
        }else{
            error[1].style.display = "none";
        }

        // 비밀번호 확인 유효성검사
        if($("#password").val() != $("#pwCheck").val()){
            error[2].innerHTML = "비밀번호가 일치하지 않습니다.";
            error[2].style.display = "inline-block";
            error[2].style.color = "red";
            $("#pwCheck").focus();
            return false;
        }else{
            error[2].style.display = "none";
        }

        // 이메일 유효성검사
        reg = /^\w{5,20}[@]{1}[a-zA-Z]{2,8}[.]{1}[a-zA-Z]{2,4}([.][a-zA-Z]{2,4})?$/;
        if($("#email").val()==''){
            error[4].innerHTML = "이메일을 입력하세요.";
            error[4].style.display = "inline-block";
            error[4].style.color = "red";
            $("#email").focus();
            return false;
        }else if(!reg.test($("#email").val())){
            error[4].innerHTML = "이메일을 확인해주세요.";
            error[4].style.display = "inline-block";
            error[4].style.color = "red";
            $("#email").focus();
            return false;
        }else if($('#emailCheckResult').val()===""){
            error[4].innerHTML = "이메일 중복확인을 진행해주세요.";
            error[4].style.display = "inline-block";
            error[4].style.color = "red";
            return false;
        }
        else{
            error[4].style.display = "none";
        }

        // 내 지역 유효성검사
        if($("#region").val()==''){
            error[5].innerHTML = "내 지역을 선택해주세요.";
            error[5].style.display = "inline-block";
            error[5].style.color = "red";
            $("#region").focus();
            return false;
        }else{
            error[5].style.display = "none";
        }
    });

});
/* id 중복체크 버튼 */
function idCheck() {
    var error = document.querySelectorAll('.msgError');
    var reg = /^[a-z0-9]{5,15}$/;
    const Id = $('#userId').val();
    if (Id.trim()===""){
        error[0].innerHTML = "아이디를 입력하세요.";
        error[0].style.display = "inline-block";
        error[0].style.color = "red";
        $("#userId").focus();
    } else if(!reg.test($("#userId").val())) {
        error[0].innerHTML = "5~15자의 영문 소문자, 숫자만 사용 가능합니다."
        error[0].style.display = "inline-block";
        error[0].style.color = "red";
        $("#userId").focus();
    } else {
        $.ajax({
            async : true,
            type : 'POST',
            data: Id,
            url: "/register/idDuplicateCheck",
            dataType: "json",
            contentType: "application/json; charset=UTF-8",
            success: function(result) {
                if(result.toString()==="false") {
                    error[0].style.display = "none";
                    alert('사용 가능한 ID입니다.')
                    $('#idCheckResult').val('success')
                } else{
                    alert('이미 사용중인 ID입니다. 다른 ID를 입력해주세요.')
                }
            },
            error: function (request, status, error) {
                alert('code:' + request.status + '\n' + 'message:' + request.responseText + '\n' + 'error:' + error);
            }
        });
    }

}

/* email 중복체크 버튼 */
function emailCheck() {
    var error = document.querySelectorAll('.msgError');
    const email = $('#email').val();
    reg = /^\w{5,20}[@]{1}[a-zA-Z]{2,8}[.]{1}[a-zA-Z]{2,4}([.][a-zA-Z]{2,4})?$/;
    if(email===''){
        error[4].innerHTML = "이메일을 입력하세요.";
        error[4].style.display = "inline-block";
        error[4].style.color = "red";
        $("#email").focus();
    }else if(!reg.test($("#email").val())){
        error[4].innerHTML = "이메일을 확인해주세요.";
        error[4].style.display = "inline-block";
        error[4].style.color = "red";
        $("#email").focus();
    }else {
        $.ajax({
            async : true,
            type : 'POST',
            data: email,
            url: "/register/emailDuplicateCheck",
            dataType: "json",
            contentType: "application/json; charset=UTF-8",
            success: function(result) {
                if(result.toString()==="false") {
                    error[4].style.display = "none";
                    alert('사용 가능한 이메일입니다.')
                    $('#emailCheckResult').val('success')
                } else{
                    alert('이미 사용중인 이메일입니다. 다른 이메일을 입력해주세요.')
                }
            },
            error: function (request, status, error) {
                alert('code:' + request.status + '\n' + 'message:' + request.responseText + '\n' + 'error:' + error);
            }
        });
    }

}