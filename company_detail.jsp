<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Company List</title>
    
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
        <h3>Company Detail</h3>
    </div>

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
    <table>
        <tr>
            <td rowspan="3"><img src="<%= image[idx] %>" width="200px"></td>
            <td><%= name[idx] %></td>
        </tr>
        <tr>
            
            <td><%= shortDescription[idx] %></td>
            
        </tr>
        <tr>
            <td><%= category[idx] %></td>
        </tr>
    </table>

    <table>
        <tr>
            <td width="300px">Email: <%= email[idx] %></td>
            <td width="300px">Phone Number: <%= phone[idx] %></td>
            <td width="300px">url: <a href="<%= url[idx] %>"><%= url[idx] %></a></td>
        </tr>

    </table>
    
    <table>
        <br>
        <tr>
            <td width="900px">
                <%= description[idx] %>
            </td>
        </tr>
    </table>
    

    <form action="InvestTransaction.jsp" method="post" name="goToInvestForm">
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