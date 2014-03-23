/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
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
        
        $(document).ready(function() {
            $("#btn_submit").click(function() {
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
            });
        });

