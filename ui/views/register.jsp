<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Register</title>
    <link rel="stylesheet" href="../style/register_style.css">
</head>
<body>
    <header>
        
    </header>
    <section>
        <div class="register">
            <h1 style="text-align: center; font-size: 40px;">Register</h1>
            <form action="x" class="register_form">
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
                    <input type="password" id="passw" placeholder="Input your password..">
                </div>

                <div class="form_input">
                    <label for="pass">Confirmation your password</label>
                    <input type="password" id="passw" placeholder="Please input your password again..">
                </div>

                <input type="submit" id="submit" value="Submit">
            </form>
        </div>
    </section>
    <footer>
        
    </footer>
</body>
</html>