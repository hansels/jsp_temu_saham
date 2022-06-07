<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login | Temu Saham</title>
    <link rel="stylesheet" href="../styles/login_style.css">
    <link rel="stylesheet" href="../styles/style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <%@ include file="../navbars/navbar_views_not_login.jsp" %>
    
     <section>
        <div class="login_page">
        <img src="../assets/logo.png" alt="Logo Tlp" class="logo_temusaham">
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

        <div class="login_page">
            <p>Don't have an account? <a href="register.jsp">Register Now</a></p>
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

    <%@ include file="../footers/footer.jsp" %>
</body>
</html>