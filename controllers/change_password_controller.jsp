<%
    //TODO IMPORT NEEDED FILES
%>

<%
    String newPassword = request.getParameter("newPassword");

    String id = (String) session.getAttribute("userId");
    if(id != null) {
        //TODO UPDATE Users SET password = 'newPassword' WHERE id = 'id'
    }


    response.sendRedirect("change_password.jsp");
%>