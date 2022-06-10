<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Company List | Temu Saham</title>
    <link rel="stylesheet" href="../styles/style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
    <%@ include file = "../database_tapi_boong.jsp" %>

    <%
    String id = (String) session.getAttribute("userId");
    String type = (String) session.getAttribute("userType");

        if (!id.isEmpty() && type.equals("investor")) {
    %>
      <%@ include file="../navbars/navbar_views_investor.jsp" %>
    <%
        } else if (!id.isEmpty() && type.equals("owner")) {
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
        Company List
    </h1>

    <%
        String searchQuery = request.getParameter("searchBar");
        if(searchQuery == null) searchQuery = new String();
    %>

    <br>
    
    <form action="company_list.jsp" method="get" name="SearchCompany" onsubmit="return(validateSearch())">
        <div class="input-group" style="padding-left: 40px; padding-right: 40px;">
            <input type="text" class="form-control" name="searchBar" placeholder="Company Name">
            <div class="input-group-append">
                <button class="btn btn-outline-secondary" type="submit"><i class="fas fa-search"></i></button>
            </div>
        </div>
    </form>

    <br>

    <%
        ArrayList<Integer> companyResult = new ArrayList<Integer>();
        for(int i = 0; i < sizeList; ++i){
            if(name[i].toLowerCase().contains(searchQuery.toLowerCase())){
                companyResult.add(i);
            }
        }
    %>

    <% if(companyResult.isEmpty()){ %>
        <h1 style="text-align: center; font-size: 30px; padding-top: 30px">
            No Result Found
        </h1>
    <% } else { %>
    <%
        int itemPerRow = 4;
        int rowCount = companyResult.size() / itemPerRow;
        int lastRowCount = companyResult.size() % itemPerRow;
        if (lastRowCount > 0) {
          rowCount++;
        }

        int itemIndex = 0;

        for (int i = 0; i < rowCount; i++) {
        if (i == (rowCount - 1) && lastRowCount > 0) {
            itemPerRow = lastRowCount;
        }
    %>
        <div class="row" style="padding-left: 40px; padding-right: 40px;">
    <%
        for (int j = 0; j < itemPerRow; j++) {
            Integer idx = companyResult.get(itemIndex);
    %>
            <div class="col-md-3">
                <div class="card">
                    <img src="<%= image[idx] %>" class="card-img-top" alt="...">
                    <div class="card-body">
                      <h5 class="card-title"><%= name[idx] %> </h5>
                      <p class="card-text"><%= shortDescription[idx] %></p>
                      <a href="company_detail.jsp?companyId=<%= Id[idx] %>" class="btn btn-primary">See More</a>
                    </div>
                </div>
            </div>
    <%
        itemIndex++;
    }
    %>
        </div>
        <br>
        <% } %>   
    <% } %>

    <br>
    
    <script>
        function validateSearch(){
            // Entah mau di validasi atau gak, kan cuma search
            return true;
        }
    </script>
</body>
</html>