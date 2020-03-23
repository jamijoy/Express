function check(){
    var flag= null;
    $.ajax({
        url: '/generalController/register/checkMail',
        type: 'POST',
        success:(function(data){
            var results = JSON.parse(data);
            console.log($('#email').val());
            for(var i = 0; i < results.length; i++){
                if($('#email').val() == results[i].email){
                    $('#email').css('border', '3px solid red');
                    console.log(results[i].email);
                    flag = false;
                }
                if($('#email').val() == ""){
                    $('#email').css('border', '3px solid red');
                    $('#submit').prop("disabled",true);
                }
            }
        }),
        async: false
    });
    console.log(flag);
    if(flag == false){
        console.log("i am false");
        return false;
    }
    else if(flag == null){
        console.log("i am true");
        return true;
    }
}

function keyUpCheck(){
    $.ajax({
        url: '/generalController/register/checkMail',
        type: 'POST',
        success:(function(data){
            var results = JSON.parse(data);
            var mail = $('#email').val();
            // console.log($('#email').val());
            // console.log(results);
            for(var i = 0; i < results.length; i++){
                if(results[i].email == mail){
                    $('#email').css('border', '3px solid red');
                    $('#submit').prop("disabled",true);
                    break;
                }
                else{
                    $('#email').css('border', '3px solid green');
                    $('#submit').prop("disabled",false);
                }
            }
        })
    });
}
function checkName(){
    if($('#username').val() != ""){
        $('#username').css('border', '3px solid green');
        $('#submit').prop("disabled",false);
    }
    else{
        $('#username').css('border', '3px solid red');
        $('#submit').prop("disabled",true);
    }
}
function passwordCheck(){
    console.log($('#password').val());
    console.log($('#confirm_password').val());
    if($('#password').val() != ""){
        if($('#confirm_password').val() != ""){
            if($('#password').val() == $('#confirm_password').val()){
                $('#password').css('border', '3px solid green');
                $('#confirm_password').css('border', '3px solid green');
                $('#submit').prop("disabled",false);
            }
            else if($('#password').val() != $('#confirm_password').val()){
                $('#password').css('border', '3px solid red');
                $('#confirm_password').css('border', '3px solid red');
                $('#submit').prop("disabled",true);
            }
        }
        else if($('#confirm_password').val() == ""){
            $('#password').css('border', '3px solid red');
            $('#confirm_password').css('border', '3px solid red');
            $('#submit').prop("disabled",true);
        }
    }
    else if($('#password').val() == ""){
        $('#password').css('border', '3px solid red');
        $('#confirm_password').css('border', '3px solid red');
        $('#submit').prop("disabled",true);
    }
}