<%@ page import = "java.text.NumberFormat" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Checkout Payment | Temu Saham</title>
    <link rel="stylesheet" href="../style/checkout_style.css">
</head>
<body>
    <%
        String companyId = request.getParameter("companyId");
        companyId = "13"; //TODO DELETE WHEN INTEGRATING
        //TODO get company by id

        //Company company = getCompanyById(companyId);
        String companyName = "Tokopedia";
        NumberFormat formatPrice = NumberFormat.getInstance();
    %>
    <section>
        <div class="checkout">
            <h1 style="text-align: center; font-size: 40px;">Checkout Payment</h1>
            <form action="confirm_payment.jsp" method="post" name="checkoutPaymentForm" onsubmit="return validateCheckoutPayment()">
                <input type="hidden" name="companyId" value="<%= companyId %>">
                <div class="form_input">
                    <label for="name">Company Name</label>
                    <input type="text" name="companyName" value="[company name placeholder]" readonly> 
                    <%-- <input type="text" name="companyName" value="<%= company.name %>" readonly>  --%>
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
                    <label for="nominal">Investment Nominal (in IDR, without separator)</label>
                    <%
                        if(request.getParameter("investmentNominal") != null) {
                            %>
                            <input type="number" name="investmentNominal" value="<%= request.getParameter("investmentNominal") %>" min="10000" step="10000" max="90000000">
                        <%
                        } else {
                            %>
                            <input type="number" name="investmentNominal" placeholder="Your investment... (multiple of 10000)" min="10000" step="10000" max="90000000">
                            <%-- <input type="number" name="investmentNominal" placeholder="Your investment... (multiple of 10000)" min="10000" step="10000" max="<%= company.getRemainingInvestmentNeeded %>"> --%>
                        <%
                        }
                    %>
                </div>

                <input type="submit" id="next" value="Next">
            </form>
        </div>
    </section>
    <script>
        function validateCheckoutPayment() {
            let investmentNominal = document.forms["checkoutPaymentForm"]["investmentNominal"].value;

            if(investmentNominal == "") {
                alert("Investment nominal must not be empty");
                return false;
            } else {
                return true;
            }
        }
    </script>
</body>
</html>