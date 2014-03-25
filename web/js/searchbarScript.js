/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
$(function(){
    SyntaxHighlighter.all();
});
$(window).load(function(){
    $('.flexslider').flexslider({
        animation: "slide",
        start: function(slider){
            $('body').removeClass('loading');
        }
    }); 
    function updateLoginArea(responseTxt,statusTxt,xhr){
        if(statusTxt=="success"){
            $(".error.required:eq(0)").css("display","block");
            $(".error.required:eq(0)").html(responseTxt);
            if(responseTxt=="logged in successfully"){
                location.href="ViewProfile?date="+new Date().getTime();
            }
        //$("#loginLabel").val(responseTxt);
        }
    }
    $("#loginButton").click(function(){
        if($("#email").val().trim()!=""||$("#password").val().trim()!=""){
            $.post("Login?data="+new Date().getTime(), {
                email:$("#email").val(),
                pass:$("#password").val()
            }, updateLoginArea);
        }else{
            $(".error.required:eq(0)").css("display","block");    
        }
    });
    $("#sortBy").on('change',function(e){
        var selectedOption = $("#sortBy option:selected,this");
        if(selectedOption.val()=="Price"){
            $("#priceSearch").css("display","inline");
            $("#categorySearch").css("display","none");
        }else{
            $("#priceSearch").css("display","none");
            $("#categorySearch").css("display","inline");
        }
    });
    function confirmCheckout(responseTxt,statusTxt,xhr){
        if(statusTxt=="success"){
                $("#checkOutResult").css("display", "block");
                $("#checkOutResult").html(responseTxt);
                $(".section.group").css("display","none");
                $("#checkOutButton").css("display","none");
        }
                
    }
    $("#checkOutButton").click(function(){
        var r=confirm("Are you sure you want to check out?");
        if (r==true)
        {
            $.post("CheckOut?date="+new Date().getTime(),confirmCheckout);
        }
    });
    
});
