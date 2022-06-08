<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">  
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    <title>Profile | Temu Saham</title>
    <style>
        html, body {
            height: 100%;
            width: 100%;
            padding: 0px;
            margin: 0px;
        }

    </style>
</head>
<body>
    <div class="container w-100 h-100 d-flex justify-content-center align-items-center">
        <div class="card" style="width: 25rem;">
            <h4 class="card-title pt-3" style="text-align: center;">Profile</h5>
            <div class="card-body">
                <dl class="row" style="margin-bottom: 0px;">
                    <dt class="col-sm-3">Name</dt>
                    <dd class="col-sm-9" id="name">John Doe</dd>

                    <dt class="col-sm-3">Email</dt>
                    <dd class="col-sm-9" id="email">johndoe@gmail.com</dd>

                    <dt class="col-sm-3">Password</dt>
                    <dd class="col-sm-9" style="vertical-align: middle;">
                        <p class="mt-1" id="password">*********</p>
                    </dd>
                </dl>

                <div class="d-flex justify-content-between align-items-end">
                    <a href="#" class="card-link" style="text-decoration: none; color: #97D729;">Change Password</a>
                    <button href="company_profile.jsp" class="card-link btn" style="background-color: #A2E62E; color: white;">View Company</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>