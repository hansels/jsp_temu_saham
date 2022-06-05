<%@ include file="../../domain/models/Investment.jsp" %>
<%@ include file="../../domain/repositories/InvestmentRepository.jsp" %>
<%@ include file="../sources/instances/TemuSahamDbInstance.jsp" %>

<%!
class InvestmentRepositoryImpl implements InvestmentRepository {
    
    @Override
    public boolean addInvestment(Investment investment) {
        String query;

        query = "" + 
        "INSERT INTO Investments (user_id, company_id, percentage, created_at, amount) " +
        "SELECT ?, ?, ? * 100.0/investment_target, ? " +
        "  FROM Companies " +
        " WHERE id = ?";

        Object[] parameters = new Object[] {
            investment.userId,
            investment.companyId,
            investment.amount,
            investment.amount,
            invsetment.companyId
        }
        
        TemuSahamDbInstance.executeQuery(query, parameters);


        query = "" +
        "UPDATE c " +
        "   SET c.isInvested = CASE WHEN i.id IS NOT NULL THEN 'Y' ELSE 'N' END " +
        "     , c.isCompleted = CASE WHEN i.percentage >= 100 THEN 'Y' ELSE 'N' END " +
        "  FROM Companies c " +
        "       LEFT JOIN (SELECT id, SUM(percentage) AS percentage " +
        "                    FROM Investments " +
        "                   GROUP BY id) i " +
        "       ON   i.company_id = c.id " +
        " WHERE c.id = ?";

        parameters = new Object[] { investment.companyId };

        TemuSahamDbInstance.executeQuery(query, parameters);
        return true;
    }
}
%>