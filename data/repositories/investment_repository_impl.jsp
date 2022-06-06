<%@ include file="../../domain/models/Investment.jsp" %>
<%@ include file="../../domain/repositories/investment_repository.jsp" %>
<%@ include file="../sources/instances/temu_saham_db_instance.jsp" %>

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
        };
        
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

    @Override
    public List<Investment> getInvestmentByUserId(int userId) {
        String query = "" +
        "SELECT i.id, i.user_id AS userId, i.company_id AS companyId, i.percentage, i.created_at AS createdAt, i.amount" +
        "  FROM Investment i" +
        " WHERE i.user_id = ?" +
        "";

        Object[] parameters = new Object[] { userId };

        RowSet rowSet = TemuSahamDbInstance.executeQuery(query, parameters);

        List<Investment> investmentList = new ArrayList<>();
        Investment investment = new Investment();
        try {
            rowSet.beforeFirst();
            while(rowSet.next()) {
               investment.id = rowSet.getInt("id");
               investment.userId = rowSet.getInt("userId");
               investment.companyId = rowSet.getInt("companyId");
               investment.percentage = rowSet.getFloat("percentage");
               investment.createdAt = rowSet.getTimestamp("createdAt");
               investment.amount = rowSet.getLong("amount");

               investmentList.add(investment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                rowSet.close();
                rowSet = null;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return investmentList;
    }
}
%>