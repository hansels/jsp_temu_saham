<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login | Temu Saham</title>
    <link rel="stylesheet" href="../style/login_style.css">
</head>
<body>
    <section>
        <div class="login_page">
            <h1 style="text-align: center; font-size: 40px;">Login</h1>
            <img src="../../assets/logo.png" alt="Logo Tlp" class="logo_temusaham">
            <form action="login_controller.jsp" method="post" name="loginForm" onsubmit="return validateLogin()">
                <div class="login_input">
                    <div class="form_input">
                        <label for="email">Email Address</label>
                        <input type="text" name="email" placeholder="Input your email..">
                    </div>
    
                    <div class="form_input">
                        <label for="pass">Password</label>
                        <input type="password" name="password" placeholder="Input your password..">
                    </div>
    
                    <input type="submit" id="submit" value="Login">
                </div>
            </form>
        </div>
    </section>
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
                alert("Logged in successfully");
                return true;
            }
        }
    </script>
</body>
</html>