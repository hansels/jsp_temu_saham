<%
    String userId = (String) session.getAttribute("userId");
    String companyId = request.getParameter("companyId");
    String name = request.getParameter("name");
    String description = request.getParameter("description");
    String location = request.getParameter("location");
    Long investmentTarget = Long.parseLong(request.getParameter("investmentTarget").replace(",", ""));
    Long investmentStock = Long.parseLong(request.getParameter("investmentStock"));
    String logo = request.getParameter("logo");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String url = request.getParameter("url");
    Long foundedYear = Long.parseLong(request.getParameter("foundedYear"));
    String category = request.getParameter("category");

    //TODO Update company to database
    response.sendRedirect("../../home.jsp");
    
%>