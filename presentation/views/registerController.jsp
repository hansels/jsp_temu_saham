<%
    //TODO IMPORT NEEDED FILES
%>

<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String role = request.getParameter("role");

    //TODO Add dummy company to DB if role = owner
    //And get company ID by last inserted company
    
    //TODO Add User to DB
    //IF role = owner, then add User with company ID
    //ELSE no need company ID


    response.sendRedirect("register.jsp");
%>