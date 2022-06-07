<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Company List</title>
    
    <style>
        td{
            text-align: center;
            vertical-align: middle;
            width: 25%;
        }
        .wrapper {
            position: relative;
            text-align: center;
        }
        tr:hover { 
            background: gray;
        }
    </style>
</head>
<body>
    <%@ include file = "../database_tapi_boong.jsp" %>

    <div class="wrapper">
        <h3>Company List</h3>
    </div>

    <%
        String searchQuery = request.getParameter("searchBar");
        if(searchQuery == null)searchQuery = new String();
    %>
    <form action="company_list.jsp" method="get" name="SearchCompany" onsubmit="return(validateSearch())">
        <input type="search" name="searchBar" id="" value="<%=searchQuery%>" placeholder="Company Name">
        <input type="submit" value="search">
    </form>

    <%
        ArrayList<Integer> companyResult = new ArrayList<Integer>();
        for(int i = 0; i < sizeList; ++i){
            if(name[i].toLowerCase().contains(searchQuery.toLowerCase())){
                companyResult.add(i);
            }
        }
    %>

    <% if(companyResult.isEmpty()){ %>
        <div class="wrapper">
            <h3>No Result Found</h3>
        </div>
    <% } else { %>
        <table class="table">
            <tr>
                <th><h4>Name</h4></th>
                <th><h4>Company Description</h4></th>
                <th><h4>Category</h4></th>
                <th><h4>Location</h4></th>
            </tr>
            <% for(int i = 0; i < companyResult.size(); ++i){ %>
                <% Integer idx = companyResult.get(i); %>
                <tr onclick="window.location='company_detail.jsp?companyId=<%= Id[idx] %>';">
                    <td>
                        <img src="<%= image[idx] %>" width="60%">
                        <h4><%= name[idx] %></h4>
                    </td>
                    <td>
                        <%= shortDescription[idx] %>
                    </td>
                    <td>
                        <%= category[idx] %>
                    </td>
                    <td>
                        <%= location[idx] %>
                    </td>
                <tr>
            <% } %>
        </table>
    <% } %>   
    
    <script>
        function validateSearch(){
            // Entah mau di validasi atau gak, kan cuma search
            return true;
        }
    </script>
</body>
</html>