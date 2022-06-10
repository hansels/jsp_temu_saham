<%@ include file="../repositories/user_repository_impl.jsp" %>

<%@ include file="../instances/temu_saham_db_instance.jsp" %>

<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    UserRepository userRepository = new UserRepositoryImpl();

    User user = userRepository.getUserByEmail(email);

    if (user != null) {
        if (password.equals(user.password)) {
            session.setAttribute("userId", String.valueOf(user.id));
            session.setAttribute("userType", user.type);
            session.setMaxInactiveInterval(-1);

            response.sendRedirect("../home.jsp");
        } else {
            response.sendRedirect("../views/login.jsp?alert=Login Failed!");
        }
    } else {
        response.sendRedirect("../views/login.jsp?alert=User Not Found, Please Register!");
    }
%>