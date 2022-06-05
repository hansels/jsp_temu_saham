<%@ include file="../models/Investment.jsp" %>

<%!
interface InvestmentRepository {
    public boolean addInvestment(Invesment invesment);
}
%>