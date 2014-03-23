/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

        $(document).ready(function() {
            $("#btn_submit").click(function() {
                $.post("SaveProfileChanges?date=" + new Date().getTime(), {
                    uName: document.getElementById("fname").value,
                    mail: document.getElementById("email").value,
                    address: document.getElementById("address").value,
                    bday: document.getElementById("bday").value,
                    password: document.getElementById("password").value,
                    newpassword: document.getElementById("newpassword").value,
                    confpassword: document.getElementById("confpassword").value,
                    balance: document.getElementById("balance").value,
                    interests: document.getElementById("interests").value
                }, ajaxCallBack);
            });
        });

        function ajaxCallBack(responseTxt, statusTxt, xhr)
        {

            if (statusTxt == "success")
            {
                // alert("Success");
                document.getElementById("msg").value = "";
            }
            else {
                alert("Error");
            }
        }