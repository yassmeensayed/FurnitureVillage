/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
function updateLoginArea(){
    
}
$document.ready(function(){
    $("#loginButton").click(function(){
        $.post("Login?data="+new Date().getTime(), {email:$("").val(),pass:$("").val()}, updateLoginArea);
    });
});

