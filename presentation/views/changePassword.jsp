<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    //TODO Navbar
    <p>Change Password</p>
    <form action="changePasswordController.jsp" method="post" name="changePasswordForm" onsubmit="return validateChangePassword()">
        <table>
            <tr>
                <td>Old Password: </td>
                <td><input type="password" name="oldPassword" id=""></td>
            </tr>
            <tr>
                <td>New Password: </td>
                <td><input type="password" name="newPassword" id=""></td>
            </tr>
            <tr>
                <td>Confirm New Password:</td>
                <td><input type="password" name="confirmNewPassword" id=""></td>
            </tr>
            <tr>
                <td><input type="submit" value="Change Password"></td>
            </tr>
        </table>
    </form>

    <script>
        function validateChangePassword() {
            let oldPassword = document.forms["changePasswordForm"]["oldPassword"].value;
            let newPassword = document.forms["changePasswordForm"]["newPassword"].value;
            let confirmNewPassword = document.forms["changePasswordForm"]["confirmNewPassword"].value;

            let regexPassword = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;

            if(oldPassword == "") {
                alert("Old password must not be empty");
                return false;
            } else if(newPassword == "") {
                alert("New password must not be empty");
                return false;
            } else if(oldPassword == newPassword) {
                alert("New password must not be the same with old password");
                return false;
            } else if(!newPassword.match(regexPassword)) {
                alert("Password must be 8 until 15 characters and contain at least one lowercase letter, one uppercase letter, one numeric digit, and one special character");
                return false;
            } else if(newPassword != confirmNewPassword) {
                alert("Confirm new password must be the same with new password");
                return false;
            } else if("//TODO wrong old password" == true) {
                alert("Wrong old password");
                return false;
            } else {
                let confirmChangePassword = confirm("Are you sure you want to change your password?");
                if(confirmChangePassword) {
                    alert("Password changed successfully");
                    return true;
                } else {
                    return false;
                }
            }
        }
    </script>
</body>
</html>