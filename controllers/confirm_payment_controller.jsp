<%
    String id = (String) session.getAttribute("userId");
    Integer userId = 0;
    if(id != null) {
        userId = Integer.parseInt(id);
    }
    Integer companyId = Integer.parseInt(request.getParameter("companyId"));
    Double percentage = Double.parseDouble(request.getParameter("stockReceived"));
    Long amount = Long.parseLong(request.getParameter("investmentNominal").replace(",", ""));
    String date = (new java.util.Date()).toLocaleString();
    
    //TODO INSERT INVESTMENT TO DATABASE

    //TODO Update Companies is_invested and is_completed if needed

    //TODO Redirect to list transaction
    //response.sendRedirect("portofolio.jsp");

%>