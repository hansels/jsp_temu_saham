<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    <title>Profile | TemuSaham</title>
    <style>
        html, body {
            width: 100%;
            padding: 0px;
            margin: 0px;
        }
        body {
            min-height: 100vh;
        }
    </style>
</head>
<body>
    <%@ include file="../repositories/company_repository.jsp" %>
    <%@ include file="../repositories/company_repository_impl.jsp" %>

    <%@ include file="../repositories/user_repository.jsp" %>
    <%@ include file="../repositories/user_repository_impl.jsp" %>

    <%
    String id = (String) session.getAttribute("userId");

    UserRepository userRepository = new UserRepositoryImpl();
    CompanyRepository companyRepository = new CompanyRepositoryImpl();

    User user = userRepository.getUserById(id);
    Company company = companyRepository.getCompanyByUserEmail(user.email);

    String investedAmountString = "Rp0.00";
    String investmentTargetString = "Rp0.00";

    if(company != null) {
        investedAmountString = "Rp" + String.format("%,.2f", company.investedAmount);
        investmentTargetString = "Rp" + String.format("%,.2f", company.investmentTarget);
    }
    %>

    <div class="container w-100 h-100 d-flex flex-column justify-content-center align-items-center">
        <h1 class="my-4">Profile</h1>

        <form action="edit_company.jsp" method="post" class="border rounded p-3 mb-5">

            <div class="container" style="min-height: fit-content; margin-bottom: 12px;">
                <h3>User</h3>
                <table>
                    <tr class="form-group">
                        <td style="width: 40%;"><b>Name</b></td>
                        <td><input type="text" class="form-control-plaintext" name="user-name" id="user-name" value="<%= user.name %>" readonly></td>
                    </tr>
                    <tr class="form-group">
                        <td style="width: 40%;"><b>Email</b></td>
                        <td><input type="email" class="form-control-plaintext" name="user-email" id="user-email" value="<%= user.email %>" readonly></td>
                    </tr>
                    <tr class="form-group">
                        <td style="width: 40%; padding-right: 20px;"><b>Password</b></td>
                        <td><input type="password" class="form-control-plaintext" name="user-password" id="user-password" value="<%= user.password %>" readonly></td>
                    </tr>
                    
                </table>

                <a href="change_password.jsp" style="text-decoration: none;">Change Password</a>
            </div>

            <% if(user.type != "owner") { %>
            <div class="container mt-5" id="company-profile">
                <div class="d-flex justify-content-between align-items-center">
                    <h3>Company</h3>

                    <% if(company.investedAmount == 0) { %>
                    <button type="button" id="btn-delete-company" class="btn btn-danger">Delete</button>
                    <% } %>
                </div>

                <div class="row">
                    <div class="col-sm d-flex align-items-center">
                        <img src="../assets/partner1.png" alt="" style="height: 200px; width: 200px;">
                    
                        <div class="container" style="margin-left: 12px;">
                            <h3 class="mb-0"><%= company.name %> (<%= company.foundedYear %>)</h3>
                            <p><%= company.categoryName %></p>
                            <br>
                            <p class="m-0"><b>Location</b></p>
                            <p><%= company.location %></p>
                        </div>
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col-sm">
                        <p class="m-0"><b>Accumulated Investments</b></p>
                        <div class="d-flex justify-content-start align-items-center">
                            <p style="font-size: 20px;" id="invested-amount"><%= investedAmountString %></p><p style="font-size: 20px;">/</p><p class="align-self-center" style="font-size: 12px;" id="investment-target"><%= investmentTargetString %></p>
                        </div>
                    </div>
                    <div class="col-sm">
                        <p class="m-0"><b>Fulfilled Stocks</b></p>
                        <p style="font-size: 20px;"><%= investmentStock %>%</p>
                        <%-- <p style="font-size: 20px;" id="Purchased Stock">28%</p><p style="font-size: 20px;">/</p><p class="align-self-end" style="font-size: 12px;" id="investment-target"></p> --%>
                    </div>
                </div>

                <div class="row"><b>Description</b></div>
                <div class="row form-group mt-2" style="margin: 0px;">
                    <%-- <textarea class="form-control-plaintext" style="resize: none;" name="description" id="company_description" cols ="30" rows="10" readonly>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</textarea> --%>
                    <p class="form-control-plaintext" style="resize: none;" id="company_description" readonly><%= company.description %></p>
                </div>

                <div class="row mt-4 mb-2"><b>Contacts</b></div>
                <div class="row">
                    <div class="form-group mb-2">
                        <label style="font-size: 14px;" for="email"><b>Email</b></label><br>
                        <input class="form-control-plaintext" type="text" name="email" value="<%= company.email %>" readonly>
                    </div>
                    <div class="form-group mb-2">
                        <label style="font-size: 14px;" for="phone"><b>Phone</b></label><br>
                        <input class="form-control-plaintext" type="text" name="phone" value="<%= company.phone %>" readonly>
                    </div>
                    <div class="form-group">
                        <label style="font-size: 14px;" for="url"><b>Url</b></label><br>
                        <input class="form-control-plaintext" type="text" name="url" value="<%= company.url %>" readonly>
                    </div>
                </div>
            </div>
            <% } %>
            <div class="d-flex justify-content-between mt-4 align-items-center" style="margin: 0px 12px;">
                <a href="../controllers/logout_controller.jsp?id=<%= id %>" class="text-danger" style="text-decoration: none;">Log Out</a>

                <button type="submit" class="btn btn-primary">Update Company</button>
            </div>
        </form>
    </div>
</body>
</html>