<%@ include file="../../data/repositories/user_repository_impl.jsp" %>
<%@ include file="../../data/repositories/company_repository_impl.jsp" %>

<%@ include file="../../domain/models/User.jsp" %>

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
        response.sendRedirect("../login.jsp?error=User with this email already exists");
    } else {
        userRepository.addUser(user);
        if(role.equals("investor")) {
            response.sendRedirect("../login.jsp?success=User successfully registered");
        } else {

        //TODO Add dummy company to DB
        //And get company ID by last inserted company
        //TODO Add User to DB with company ID
        //response.sendRedirect("create_company.jsp");
        }
        userRepository.addUser(user);
        response.sendRedirect("../login.jsp");
    }
%>