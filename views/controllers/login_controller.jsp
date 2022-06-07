<%
    //TODO import necessary file
%>

<%
    String email = request.getParameter("email");

    //TODO get user by email

    String id = "1"; //TODO get user ID

    session.setAttribute("userId", id);
    session.setMaxInactiveInterval(-1);

    response.sendRedirect("../../home.jsp");
%>