<%
    String id = request.getParameter("id");
    session.invalidate();
    response.sendRedirect("../home.jsp");
%>