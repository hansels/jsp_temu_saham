<%@ include file="../repositories/company_repository_impl.jsp" %>

<%@ include file="../instances/temu_saham_db_instance.jsp" %>

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

    // NOT FINISHED
    Company company = new Company();

    company.name = name;
    company.description = description;
    company.location = location;
    company.investmentTarget = investmentTarget;
    

    company.isCompleted = true;

    CompanyRepository companyRepository = new CompanyRepositoryImpl();


    response.sendRedirect("../../home.jsp");
    
%>