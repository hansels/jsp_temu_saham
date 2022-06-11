<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Company Detail | TemuSaham</title>
    <link rel="stylesheet" href="../styles/style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        form {
           text-align: center;
        }

        input[type="submit"] {
            /* display: inline-block; */
            border-radius: 13px;
            background-color: #ee4e26;
            width: 90px;
            height: 43px;
            margin: auto;
            color: white;
            font-size: 18px;
            text-align: center;
            border: none;
            color: white;
            font-family: Arial, Helvetica, sans-serif;
        }
    </style>
</head>

<body>
    <%@ include file="../models/User.jsp" %>

    <%@ include file="../repositories/company_repository_impl.jsp" %>

    <%@ include file="../instances/temu_saham_db_instance.jsp" %>

    <%
    String id = (String) session.getAttribute("userId");
    String type = (String) session.getAttribute("userType");

        if (id != null && type != null && !id.isEmpty() && type.equals("investor")) {
    %>
      <%@ include file="../navbars/navbar_views_investor.jsp" %>
    <%
        } else if (id != null && type != null && !id.isEmpty() && type.equals("owner")) {
    %>
      <%@ include file="../navbars/navbar_views_owner.jsp" %>
    <%
        } else {
    %>
      <%@ include file="../navbars/navbar_views_not_login.jsp" %>
    <%
        }
    %>

    <h1 style="text-align: center; font-size: 40px; padding-top: 30px">
        Company Detail
    </h1>

    <br>

    <%
        int companyId = Integer.parseInt(request.getParameter("companyId"));

        CompanyRepository companyRepository = new CompanyRepositoryImpl();
        Company company = companyRepository.getCompanyById(companyId);
    %>

    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <img src="<%= company.image %>" alt="Logo" style="width: 100%; height: auto;">
            </div>
            <div class="col-md-8">
                <h2>
                    <%= company.name %> - <%= company.foundedYear %> (<%= company.categoryName %>)
                </h2>
                <h4>
                    <%= company.location %>
                </h4>
                <p>
                    <%= company.description %>
                </p>
                <h3>
                    Contact Us:
                </h3>
                <p>
                    <i class="fas fa-phone-square"></i>
                    <%= company.phone %>
                </p>
                <p>
                    <i class="fas fa-envelope"></i>
                    <%= company.email %>
                </p>
                <p>
                    <i class="fas fa-link"></i>
                    <%= company.url %>
                </p>
            </div>
        </div>
    </div>

    <br>

    <div>
        <center>
            <p>
                Perusahaan ini menawarkan kepemilikan saham sebesar <b> <%= company.investmentStock %>% </b> untuk investasi sebesar <b>Rp. <%= company.investmentTarget %></b>
            </p>
        </center>
    </div>

    <br>

    <form action="checkout_payment.jsp" method="POST" name="goToInvestForm">
        <input type="hidden" name="companyId" value="<%= companyId %>">
        
        <input type="submit" value="Invest" name="Invest">
    </form>

    <br>
    <br>
    
    <%@ include file="../footers/footer.jsp" %>
</body>
</html>