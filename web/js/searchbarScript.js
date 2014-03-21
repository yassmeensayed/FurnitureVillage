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
    $("#loginButton").click(function(){
        if($("#email").val().trim()!=""||$("#password").val().trim()!=""){
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
    
});