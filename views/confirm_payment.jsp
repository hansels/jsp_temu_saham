<%@ page import = "java.text.NumberFormat" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Confirm Payment | Temu Saham</title>
    <link rel="stylesheet" href="../style/checkout_style.css">
</head>
<body>
    <%
        //TODO get company by id
        //Company company = getCompanyById(companyId);
        String companyName = "Tokopedia";
        NumberFormat formatPrice = NumberFormat.getInstance();

        String companyId = request.getParameter("companyId");
        Long investmentTarget = Long.parseLong(request.getParameter("investmentTarget").replace(",", ""));
        Long remainingInvestmentNeeded = Long.parseLong(request.getParameter("remainingInvestmentNeeded").replace(",", ""));
        Long investmentStock = Long.parseLong(request.getParameter("investmentStock"));
        Long investmentNominal = Long.parseLong(request.getParameter("investmentNominal"));
        
        Double stockReceived = Double.valueOf(investmentNominal) / Double.valueOf(investmentTarget) * Double.valueOf(investmentStock);
    %>
    <section>
        <div class="checkout">
            <h1 style="text-align: center; font-size: 40px;">Confirm Payment</h1>
            <form action="confirm_payment_controller.jsp" method="post" name="confirmPaymentForm" onsubmit="return validateConfirmPayment()">
                <input type="hidden" name="companyId" value="<%= companyId %>">
                <div class="form_input">
                    <label for="name">Company Name</label>
                    <input type="text" name="companyName" value="[company name placeholder]" readonly> 
                    <%-- <input type="text" name="companyName" value="<%= companyName %>" readonly>  --%>
                </div>

                <div class="form_input">
                    <label for="target">Investment Target (in IDR)</label>
                    <input type="text" name="investmentTarget" value="<%= formatPrice.format(100000000) %>" readonly> 
                    <%-- <input type="text" name="investmentTarget" value="<%= company.investmentTarget %>" readonly>  --%>
                </div>

                <div class="form_input">
                    <label for="remaining">Remaining Investment Needed (in IDR)</label>
                    <input type="text" name="remainingInvestmentNeeded" value="<%= formatPrice.format(90000000) %>" readonly> 
                    <%-- <input type="text" name="remainingInvestmentNeeded" value="<%= company.getRemainingInvestmentNeeded() %>" readonly>  --%>
                </div>

                <div class="form_input">
                    <label for="stock">Investment Stock for Full Investment Target (in percent)</label>
                    <input type="text" name="investmentStock" value="<%= 30 %>" readonly> 
                    <%-- <input type="text" name="investmentStock" value="<%= company.investmentStock %>" readonly> --%>
                </div>

                <div class="form_input">
                    <label for="nominal">Investment Nominal (in IDR)</label>
                    <input type="text" name="investmentNominal" value="<%= formatPrice.format(investmentNominal) %>" readonly> 
                </div>

                <div class="form_input">
                    <label for="received">Stock Received (in percent)</label>
                    <input type="text" name="stockReceived" value="<%= stockReceived %>" readonly> 
                </div>

                <button type='button' onclick='window.history.back();'>Cancel</button>
                <input type="submit" id="pay" value="Pay">
            </form>
        </div>
    </section>
    <script>
        function validateConfirmPayment() {
            let confirmPayment = confirm("Are you sure you want to invest?");
            if(confirmPayment) {
                alert("Investment successful");
                return true;
            } else {
                return false;
            }
        }
    </script>
</body>
</html>