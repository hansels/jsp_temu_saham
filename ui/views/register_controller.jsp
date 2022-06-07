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
    if(role.equals("investor")) {
        // TODO Add User to DB
        response.sendRedirect("login.jsp");
    } else {
        //TODO Add dummy company to DB
        //And get company ID by last inserted company
        //TODO Add User to DB with company ID
        response.sendRedirect("create_company..jsp");
    }
%>