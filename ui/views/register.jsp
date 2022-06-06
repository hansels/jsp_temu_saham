<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Register | Temu Saham</title>
    <link rel="stylesheet" href="../style/register_style.css">
</head>
<body>
    <section>
        <div class="register">
            <h1 style="text-align: center; font-size: 40px;">Register</h1>
            <form action="registerController.jsp" method="post" name="registerForm" onsubmit="return validateRegister()">
                <div class="form_input">
                    <label for="name">Full Name</label>
                    <input type="text" id="name" placeholder="Input your name.."> 
                </div>

                <div class="form_input">
                    <label for="email">Email Address</label>
                    <input type="text" id="email" placeholder="Input your email..">
                </div>

                <div class="form_input">
                    <label for="Information">Role</label> 
                    <div class="personal-information">
                        <div class="category_option">
                            <label id="category" for="category">Category</label>
                            <input type="radio" id="investor-category" class="label-category" value="Investor" name="category"> Investor
                            <input type="radio" id="company-category" class="label-category" value="Company" name="category"> Company
                        </div>
                    </div>
                </div>

                <div class="form_input">
                    <label for="pass">Set up your password</label>
                    <input type="password" id="password" placeholder="Input your password..">
                </div>

                <div class="form_input">
                    <label for="pass">Confirmation your password</label>
                    <input type="password" id="confirmPassword" placeholder="Please input your password again..">
                </div>

                <input type="submit" id="submit" value="Submit">
            </form>
        </div>
    </section>
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
                    alert("Registered successfully");
                    return true;
                } else {
                    return false;
                }
            }
        }
    </script>
</body>
</html>