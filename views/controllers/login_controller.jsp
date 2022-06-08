<%@ include file="../../data/repositories/user_repository_impl.jsp" %>

<%@ include file="../../domain/models/User.jsp" %>

<%
    String email = request.getParameter("email");

    UserRepository userRepository = new UserRepositoryImpl();

    User user = userRepository.getUserByEmail(email);

    if (user != null) {
        String password = user.getPassword();
        String passwordConfirmation = request.getParameter("passwordConfirmation");
        if (password.equals(passwordConfirmation)) {
            user.setPassword(password);
            userRepository.updateUser(user);
            response.sendRedirect("../../views/user/login.jsp");
        } else {
            response.sendRedirect("../../views/user/password_reset.jsp?email=" + email);
        }
    } else {
        response.sendRedirect("../../views/user/password_reset.jsp?email=" + email);
    }



    session.setAttribute("userId", user.id);
    session.setMaxInactiveInterval(-1);

    response.sendRedirect("../../home.jsp");
%>