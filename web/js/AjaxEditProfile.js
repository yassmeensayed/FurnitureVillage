/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(function() {
    $('.grid-img a').lightBox();
});

$(document).ready(
        function() {
            fname = document.getElementById("fname");
            email = document.getElementById("email");
            address = document.getElementById("address");
            bday = document.getElementById("bday");
            password = document.getElementById("newpassword");
            confirmpassword = document.getElementById("confpassword");
            balance = document.getElementById("balance");
            interestsy = document.getElementById("interests");

            $("#fname").focusout(function() {
                validateName()
            });

            $("#email").focusout(function() {
                validateEmail()
            });

            $("#address").focusout(function() {
                validateAddress()
            });

            $("#bday").focusout(function() {
                validateBirthday()
            });

            $("#newpassword").focusout(function() {
                validatePassword()
            });

            $("#confpassword").focusout(function() {
                confirmPassword()
            });

            $("#interests").focusout(function() {
                validateinterests()
            });

            function validateName() {
                var namePattern = /^[a-zA-Z]/;
                if (fname.value == null || fname.value.trim() == "" || !namePattern.test(fname.value)) {
                    $(".error.required:eq(0)").css("display", "inline");
                    return false;
                } else {
                    $(".error.required:eq(0)").css("display", "none");
                    return true;
                }
            }
            function validateEmail() {
                atpos = email.value.indexOf("@");
                dotpos = email.value.lastIndexOf(".");
                if (atpos < 1 || (dotpos - atpos < 2) || email.value.trim() == "")
                {
                    $(".error.required:eq(1)").css("display", "inline");
                    return false;
                } else {
                    $(".error.required:eq(1)").css("display", "none");
                    return true;
                }
            }
            function validateAddress() {
                var namePattern = /^[a-zA-Z]/;
                if (address.value == null || address.value.trim() == "" || !namePattern.test(address.value)) {
                    $(".error.required:eq(2)").css("display", "inline");
                    return false;
                } else {
                    $(".error.required:eq(2)").css("display", "none");
                    return true;
                }
            }

            function validatePassword() {
                var passwordPattern = /^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[@#$%]).{6,20}$/;
                if (password.value == null || password.value.trim() == "" || !passwordPattern.test(password.value)) {
                    $(".error.required:eq(5)").css("display", "inline");
                    return false;
                } else {
                    $(".error.required:eq(5)").css("display", "none");
                    return true;
                }
            }

            function validateBirthday()
            {
                //yyyy-mm-dd 
                var bdayPattern = /^[0-9]{4}-(((0[13578]|(10|12))-(0[1-9]|[1-2][0-9]|3[0-1]))|(02-(0[1-9]|[1-2][0-9]))|((0[469]|11)-(0[1-9]|[1-2][0-9]|30)))$/;
                if (bday.value == null || bday.value.trim() == "" || !bdayPattern.test(bday.value)) {
                    $(".error.required:eq(3)").css("display", "inline");
                    return false;
                } else {
                    $(".error.required:eq(3)").css("display", "none");
                    return true;
                }
            }
            function confirmPassword()
            {
                if (confirmpassword.value == null || confirmpassword.value.trim() == "" || !(confirmpassword.value === password.value)) {
                    $(".error.required:eq(6)").css("display", "inline");
                    return false;
                } else {
                    $(".error.required:eq(6)").css("display", "none");
                    return true;
                }
            }
            function validateinterests()
            {
                var namePattern = /^[a-zA-Z]/;
                if (interestsy.value == null || interestsy.value.trim() == "" || !namePattern.test(interestsy.value)) {
                    $(".error.required:eq(8)").css("display", "inline");
                    return false;
                } else {
                    $(".error.required:eq(8)").css("display", "none");
                    return true;
                }
            }

            function ajaxCallBack(responseTxt, statusTxt, xhr)
            {

                if (statusTxt == "success")
                {
                    alert("Success");
                }
                else {
                    alert("Error");
                }
            }

            // $("btn_submit").removeAttr("disabled");
            //  document.getElementById("btn_submit").removeAttribute("disabled");
            //document.getElementById("btn_submit").removeAttribute("disabled"); 
            //document.getElementById("btn_submit").disabled = false;
            $("#btn_submit").click(function() {
                if (validateName() && validateEmail() && validateAddress() && validateBirthday() && validatePassword() && confirmPassword() && validateinterests()) {
                    $.post("SaveProfileChanges?date=" + new Date().getTime(), {
                        mail: document.getElementById("email").value,
                        oldpassword: document.getElementById("password").value,
                        uName: document.getElementById("fname").value,
                        address: document.getElementById("address").value,
                        bday: document.getElementById("bday").value,
                        newpassword: document.getElementById("newpassword").value,
                        balance: document.getElementById("balance").value,
                        interests: document.getElementById("interests").value
                    }, ajaxCallBack);
                } else
                {
                    alert("please fill all fields");
                }

            });
//            } else {
//                //   document.getElementById("btn_submit").setAttribute("disabled","disabled");
//                //document.getElementById("btn_submit").disabled = true;
//            }
        }
);



