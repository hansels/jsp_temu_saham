<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Portofolio | TemuSaham</title>
    <link rel="stylesheet" href="../styles/style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
    <%@ include file = "../database_tapi_boong.jsp" %>
    <%@ include file="../navbars/navbar_views_not_login.jsp" %>

    <h1 style="text-align: center; font-size: 40px; padding-top: 30px">
        Portofolio
    </h1>

    <br>

    <%
        String userIdString = request.getParameter("userId");
        int userId = -1;
        if(userIdString != null && !userIdString.isEmpty()){
            userId = Integer.parseInt(userIdString);
        }
    %>

    <%
        // Some more dummy data since I don't want to make another dummy database :v
        Integer [] investmentUserId = {1, 2, 1, 1, 2};
        Integer [] investmentCompanyId = {3, 1, 4, 1, 5};
        Double [] investmentPercentage = {2.75,3.69,3.01,1.44,5.12,7.33};
        Integer [] investmentAmount = {1000, 2000, 1500, 700, 3000, 5000};
        String [] investmentDate = {"01/06/2022", "02/06/2022", "03/06/2022", "04/06/2022", "05/06/2022", "06/06/2022"};
        int investmentSize = investmentUserId.length;
        long totalInvestment = 0;
        ArrayList<Integer> investmentList = new ArrayList<Integer>();
        for(int i = 0; i<investmentSize; ++i){
            if(investmentUserId[i].equals(userId)){
                investmentList.add(i);
                totalInvestment+= investmentAmount[i];
            }
        }
    %>

    <% if(investmentList.isEmpty()){ %>
        <div class="wrapper">
            <h4>You haven't make any investment yet, <a href="company_list.jsp">invest now</a></h4>
        </div>
    <% } else { %>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">
                                    Total Investasi Anda : Rp. <%= totalInvestment %>
                                </h5>
                                <h6 class="card-subtitle mb-2 text-muted">
                                    Total investasi anda dalam perusahaan-perusahaan yang anda miliki.
                                </h6>
                                <p class="card-text">
                                    <%
                                        for(int i = 0; i<investmentList.size(); ++i) {
                                            int index = investmentList.get(i);
                                            String companyName = name[index];
                                            String date = investmentDate[index];
                                            int amount = investmentAmount[index];
                                            double percentage = investmentPercentage[index];
                                            String percentageString = percentage + "%";
                                            String amountString = "Rp. " + amount;
                                    %>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <b>
                                                <%= companyName %>
                                            </b>
                                        </div>
                                        <div class="col-md-3">
                                            <%= date %>
                                        </div>
                                        <div class="col-md-3">
                                            <%= percentageString %>
                                        </div>
                                        <div class="col-md-3">
                                            <%= amountString %>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    <% } %>
</body>
</html>