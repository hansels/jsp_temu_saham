<%
    String id = (String) session.getAttribute("userId");
    int userId = Integer.parseInt(id);
    
    CompanyRepository companyRepository = new CompanyRepositoryImpl();
    companyRepository.deleteCompany(userId);
%>