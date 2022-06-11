<%@ include file="../repositories/company_repository_impl.jsp" %>

<%@ include file="../instances/temu_saham_db_instance.jsp" %>

<%
    String userEmail = request.getParameter("userEmail");

    String description = request.getParameter("description");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String url = request.getParameter("url");

    UserRepository userRepository = new UserRepositoryImpl();
    CompanyRepository companyRepository = new CompanyRepositoryImpl();

    Company company = new Company();

    company.description = description;
    company.email = email;
    company.phone = phone;
    company.url = url;

    company.owner = userRepository.getUserByEmail(userEmail);

    companyRepository.updateCompany(company);
    
    response.sendRedirect("../home.jsp");
    
%>