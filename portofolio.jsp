<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portofolio</title>
    
    <style>
        .wrapper {
            position: relative;
            text-align: center;
        }
    </style>
</head>
<body>
    <%@ include file = "database_tapi_boong.jsp" %>

    <div class="wrapper">
        <h3>Portofolio</h3>
    </div>

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

    <table border="1px" align="center">
        <tr>
            <td>
                Total Investment:
            </td>
            <td>
                <%= totalInvestment %>
            </td>
        </tr>
    </table>

    <% if(investmentList.isEmpty()){ %>
        <div class="wrapper">
            <h4>You haven't make any investment yet, <a href="company_list.jsp">invest now</a></h4>
        </div>
    <% } else { %>
        <table width="100%">
            <tr>
                <th>Company</th>
                <th>Amount Invested</th>
                <th>Percentage</th>
                <th>Date Invested</th>
            </tr>
            <% for(int i = 0; i < investmentList.size(); ++i){ %>
                <% Integer idx = investmentList.get(i); %>
                <% int companyId = investmentCompanyId[idx]; %>
                <tr align="center">
                    <td><%= name[companyId] %></td>
                    <td>$<%= investmentAmount[idx] %></td>
                    <td><%= investmentPercentage[idx] %>%</td>
                    <td><%= investmentDate[idx] %></td>
                </tr>
            <% } %>
        </table>
    <% } %>
</body>
</html>