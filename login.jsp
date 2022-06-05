
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Temu Saham</title>
</head>
<body>
    //TODO Navbar
    <p>Login</p>
    <form action="loginController.jsp" method="post" name="loginForm" onsubmit="return validateLogin()">
        <table>
            <tr>
                <td>Email:</td>
                <td><input type="text" name="email" id=""></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type="password" name="password" id=""></td>
            </tr>
            <tr>
                <td><input type="submit" value="Login"></td>
            </tr>
        </table>
    </form>

    <script>
        function validateLogin() {
            let email = document.forms["loginForm"]["email"].value;
            let password = document.forms["loginForm"]["password"].value;

            if(email == "") {
                alert("Email must not be empty");
                return false;
            } else if(password == "") {
                alert("Password must not be empty");
                return false;
            } else if("//TODO Get email, email not found" == true) {
                alert("User not found, please register first");
                return false;
            } else if("//TODO Get password, not matched" == true) {
                alert("Wrong password");
                return false;
            } else {
                alert("Login successfully");
                return true;
            }
        }
    </script>
</body>
</html>