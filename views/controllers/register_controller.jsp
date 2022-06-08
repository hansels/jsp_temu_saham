<%@ include file="../../data/repositories/user_repository_impl.jsp" %>
<%@ include file="../../data/repositories/company_repository_impl.jsp" %>

<%@ include file="../../domain/models/User.jsp" %>
<%@ include file="../../domain/models/Company.jsp" %>

<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String role = request.getParameter("role");

    User user = new User();

    user.name = name;
    user.email = email;
    user.password = password;
    user.type = role;

    UserRepository userRepository = new UserRepositoryImpl();
    CompanyRepository companyRepository = new CompanyRepositoryImpl();

    User userFromDB = userRepository.getUserByEmail(email);

    if (userFromDB != null) {
        response.sendRedirect("../login.jsp?alert=User with this email already exists");
    } else {
        userRepository.addUser(user);

        User insertedUser = userRepository.getUserByEmail(email);

        if(role.equals("investor")) {
            response.sendRedirect("../login.jsp?alert=User successfully registered!");
        } else {
            Company company = new Company();

            company.userId = insertedUser.id;
            companyRepository.addCompany(company);

            response.sendRedirect("../create_company.jsp?alert=User successfully registered!");
        }
    }    
%>