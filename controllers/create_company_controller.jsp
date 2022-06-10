<%
    String userId = (String) session.getAttribute("userId");
    String companyId = request.getParameter("companyId");
    String name = request.getParameter("name");
    String description = request.getParameter("description");
    String location = request.getParameter("location");
    Long investmentTarget = Long.parseLong(request.getParameter("investmentTarget"));
    Long investmentStock = Long.parseLong(request.getParameter("investmentStock"));
    String logo = request.getParameter("logo");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String url = request.getParameter("url");
    Long foundedYear = Long.parseLong(request.getParameter("foundedYear"));
    String category = request.getParameter("category");

    //TODO add to database, don't forget is_invested and is_completed set to false as default
    response.sendRedirect("../../home.jsp");
    
%>