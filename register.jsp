<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register | Temu Saham</title>
</head>
<body>
    Register
    <form action="registerController.jsp" method="post" name="registerForm" onsubmit="return validateRegister()">
        <table>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name" id=""></td>
            </tr>
            <tr>
                <td>Email: </td>
                <td><input type="text" name="email" id=""></td>
            </tr>
            <tr>
                <td>Password: </td>
                <td><input type="password" name="password" id=""></td>
            </tr>
            <tr>
                <td>Confirm Password: </td>
                <td><input type="password" name="confirmPassword" id=""></td>
            </tr>
            <tr>
                <td>Role: </td>
                <td>
                    <input type="radio" name="role" value="investor">Investor
                    <input type="radio" name="role" value="owner">Owner
                </td>
            </tr>
            <tr>
                <td><input type="submit" value="Register"></td>
            </tr>
        </table>
    </form>
    <script>
        function validateRegister() {
            let name = document.forms["registerForm"]["name"].value;
            let email = document.forms["registerForm"]["email"].value;
            let password = document.forms["registerForm"]["password"].value;
            let confirmPassword = document.forms["registerForm"]["confirmPassword"].value;
            let role = document.getElementsByName("role");

            let regexEmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            let regexPassword = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
            
            let roleSelected = false;
            for(let i = 0 ; i < role.length ; i++) {
                if(role[i].checked) {
                    roleSelected = true;
                    break;
                }
            }

            if(name == "") {
                alert("Name must not be empty");
                return false;
            } else if(email == "") {
                alert("Email must not be empty");
                return false;
            } else if(password == "") {
                alert("Password must not be empty");
                return false;
            } else if(!roleSelected) {
                alert("Select your role");
                return false;
            } else if(!email.match(regexEmail)) {
                alert("Enter a valid email");
                return false;
            } else if(!password.match(regexPassword)) {
                alert("Password must be 8 until 15 characters and contain at least one lowercase letter, one uppercase letter, one numeric digit, and one special character");
                return false;
            } else if(password != confirmPassword) {
                alert("Confirm password must be the same with password");
                return false;
            } else if("//TODO email has been registered" == true) {
                alert("Email is already being used");
                return false;
            } else {
                let confirmRegister = confirm("Are you sure you want to register with the data above? (You can only change password after registering)");
                if(confirmRegister) {
                    return true;
                } else {
                    return false;
                }
            }
        }
    </script>
</body>
</html>