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
</head>

<body>
    <%@ include file = "../database_tapi_boong.jsp" %>
    <%@ include file="../navbars/navbar_views_not_login.jsp" %>

    <h1 style="text-align: center; font-size: 40px; padding-top: 30px">
        Company Detail
    </h1>

    <br>

    <%
        int companyId = Integer.parseInt(request.getParameter("companyId"));
        int idx = 0;
        for(int i = 0; i < sizeList; ++i){
            if(Id[i].equals(companyId)){
                idx = i;
                break;
            }
        }
    %>

    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <img src="<%= image[idx] %>" alt="Logo" style="width: 100%; height: auto;">
            </div>
            <div class="col-md-8">
                <h2>
                    <%= name[idx] %>
                </h2>
                <h6>
                    <%= description[idx] %>
                </h6>
                <h5>
                    <%= phone[idx] %>
                </h5>
                <h5>
                    <%= url[idx] %>
                </h5>
                <h5>
                    <%= email[idx] %>
                </h5>
                <h5>
                    <%= founded[idx] %>
                </h5>
                <h4>
                    <%= category[idx] %>
                </h4>
                <h4>
                    <%= location[idx] %>
                </h4>
            </div>
        </div>
    </div>

    <form action="checkout_payment.jsp" method="post" name="goToInvestForm">
        <table>
            <tr>
                <td>
                    Investment stock:
                </td>
                <td>
                    <%= investment_stock[idx] %>
                </td>
            </tr>
            <tr>
                <td>
                    Investment target:
                </td>
                <td>
                    $<%= investment_target[idx] %>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Invest" name="Invest">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>