<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%@ include file="../../domain/models/Company.jsp" %>
<%@ include file="../../domain/repositories/company_repository.jsp" %>
<%@ include file="../sources/instances/temu_saham_db_instance.jsp" %>

<%!
class CompanyRepositoryImpl implements CompanyRepository {
    
    @Override
    public Company getCompanyById(int id) {
        String query = "" +
        "SELECT c.id" +
        "     , u.name                          AS ownerName" +
        "     , u.email                         AS ownerEmail" +
        "     , c.name" +
        "     , c.description" +
        "     , c.location" +
        "     , ca.name                         AS categoryName" +
        "     , c.investment_stock              AS investmentStock" +
        "     , c.investment_target             AS investmentTarget" +
        "     , COALESCE(SUM(i.amount), 0)      AS investedAmount" +
        "     , COALESCE(SUM(i.percentage), 0)  AS fulfilledPercentage" +
        "     , c.image" +
        "     , c.email" +
        "     , c.phone" +
        "     , c.url" +
        "     , c.founded_year                  AS foundedYear" +
        "     , c.is_invested                   AS isInvested" +
        "     , c.is_completed                  AS isCompleted" +
        "  FROM Companies c" +
        "       LEFT JOIN Investments i" +
        "       ON   i.company_id = c.id" +
        "       " +
        "       JOIN Categories ca" +
        "       ON   ca.id = c.category_id" +
        "       " +
        "       JOIN Users u" +
        "       ON  u.user_id = c.user_id" +
        " WHERE c.id = ?" +
        " GROUP BY c.id" +
        "     , u.name" +
        "     , u.email" +
        "     , c.name" +
        "     , c.description" +
        "     , c.location" +
        "     , ca.name" +
        "     , c.investment_stock" +
        "     , c.investment_target" +
        "     , c.image" +
        "     , c.email" +
        "     , c.phone" +
        "     , c.url" +
        "     , c.founded_year" +
        "     , c.is_invested" +
        "     , c.is_completed";

        Object[] parameters = new Object[] { id };

        RowSet rowSet = TemuSahamDbInstance.executeQuery(query, parameters);

        Company company = new Company();
        try {
            rowSet.beforeFirst();
            while(rowSet.next()) {
                company.id = rowSet.getInt("id");
                company.owner.name = rowSet.getInt("ownerName");
                company.owner.email = rowSet.getSting("ownerEmail");
                company.name = rowSet.getString("name");
                company.description = rowSet.getString("description");
                company.location = rowSet.getString("location");
                company.categoryName = rowSet.getString("categoryName");
                company.investmentStock = rowSet.getInt("investmentStock");
                company.investmentTarget = rowSet.getLong("investmentTarget");
                company.investedAmount = rowSet.getLong("investedAmount");
                company.fulfilledPercentage = rowSet.getFloat("fulfilledPercentage");
                company.image = rowSet.getString("image");
                company.email = rowSet.getString("email");
                company.phone = rowSet.getString("phone");
                company.url = rowSet.getString("url");
                company.foundedYear = Integer.valueOf(rowSet.getString("foundedYear"));
                company.isInvested = rowSet.getString("isInvested") == 'Y' ? true : false;
                company.isCompleted = rowSet.getString("isCompleted") == 'Y' ? true : false;
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

        return company;
    }
    
    @Override
    public List<Company> getInvestedCompanyListByUserId(int userId) {
        String query = "" +
        "SELECT c.id" +
        "     , u.name                          AS ownerName" +
        "     , u.email                         AS ownerEmail" +
        "     , c.name" +
        "     , c.description" +
        "     , c.location" +
        "     , ca.name                         AS categoryName" +
        "     , c.investment_stock              AS investmentStock" +
        "     , c.investment_target             AS investmentTarget" +
        "     , COALESCE(SUM(i.amount), 0)      AS investedAmount" +
        "     , COALESCE(SUM(i.percentage), 0)  AS fulfilledPercentage" +
        "     , c.image" +
        "     , c.email" +
        "     , c.phone" +
        "     , c.url" +
        "     , c.founded_year                  AS foundedYear" +
        "     , c.is_invested                   AS isInvested" +
        "     , c.is_completed                  AS isCompleted" +
        "  FROM Companies c" +
        "       LEFT JOIN Investments i" +
        "       ON   i.company_id = c.id" +
        "       " +
        "       JOIN Categories ca" +
        "       ON   ca.id = c.category_id" +
        "       " +
        "       JOIN Users u" +
        "       ON  u.user_id = c.user_id" +
        " WHERE u.user_id = ?" +
        " GROUP BY c.id" +
        "     , u.name" +
        "     , u.email" +
        "     , c.name" +
        "     , c.description" +
        "     , c.location" +
        "     , ca.name" +
        "     , c.investment_stock" +
        "     , c.investment_target" +
        "     , c.image" +
        "     , c.email" +
        "     , c.phone" +
        "     , c.url" +
        "     , c.founded_year" +
        "     , c.is_invested" +
        "     , c.is_completed";

        Object[] parameters = new Object[] { userId };
        
        RowSet rowSet = TemuSahamDbInstance.executeQuery(query, parameters);

        List<Company> companyList = new ArrayList<>();
        Company company = new Company();
        try {
            rowSet.beforeFirst();
            while(rowSet.next()) {
                company.id = rowSet.getInt("id");
                company.name = rowSet.getString("name");
                company.description = rowSet.getString("description");
                company.location = rowSet.getString("location");
                company.categoryName = rowSet.getString("categoryName");
                company.investmentStock = rowSet.getInt("investmentStock");
                company.investmentTarget = rowSet.getLong("investmentTarget");
                company.investedAmount = rowSet.getLong("investedAmount");
                company.fulfilledPercentage = rowSet.getFloat("fulfilledPercentage");
                company.image = rowSet.getString("image");
                company.email = rowSet.getString("email");
                company.phone = rowSet.getString("phone");
                company.url = rowSet.getString("url");
                company.foundedYear = Integer.valueOf(rowSet.getString("foundedYear"));
                company.isInvested = rowSet.getString("isInvested") == 'Y' ? true : false;
                company.isCompleted = rowSet.getString("isCompleted") == 'Y' ? true : false;

                companyList.add(company);
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

        return companyList;
    }
    
    @Override
    public List<Company> getCompanyListByKeyword(String keyword) {
        String query = "" +
        "SELECT c.id" +
        "     , u.name                          AS ownerName" +
        "     , u.email                         AS ownerEmail" +
        "     , c.name" +
        "     , c.description" +
        "     , c.location" +
        "     , ca.name                         AS categoryName" +
        "     , c.investment_stock              AS investmentStock" +
        "     , c.investment_target             AS investmentTarget" +
        "     , COALESCE(SUM(i.amount), 0)      AS investedAmount" +
        "     , COALESCE(SUM(i.percentage), 0)  AS fulfilledPercentage" +
        "     , c.image" +
        "     , c.email" +
        "     , c.phone" +
        "     , c.url" +
        "     , c.founded_year                  AS foundedYear" +
        "     , c.is_invested                   AS isInvested" +
        "     , c.is_completed                  AS isCompleted" +
        "  FROM Companies c" +
        "       LEFT JOIN Investments i" +
        "       ON   i.company_id = c.id" +
        "       " +
        "       JOIN Categories ca" +
        "       ON   ca.id = c.category_id" +
        "       " +
        "       JOIN Users u" +
        "       ON  u.user_id = c.user_id" +
        " WHERE is_completed = 'Y' " +
        "   AND UPPER(c.name) LIKE UPPER('%'+?+'%') " +
        " GROUP BY c.id" +
        "     , u.name" +
        "     , u.email" +
        "     , c.name" +
        "     , c.description" +
        "     , c.location" +
        "     , ca.name" +
        "     , c.investment_stock" +
        "     , c.investment_target" +
        "     , c.image" +
        "     , c.email" +
        "     , c.phone" +
        "     , c.url" +
        "     , c.founded_year" +
        "     , c.is_invested" +
        "     , c.is_completed";

        Object[] paremeters = new Object[] { keyword };

        RowSet rowSet = TemuSahamDbInstance.executeQuery(query, parameters);

        List<Company> companyList = new ArrayList<>();
        Company company = new Company();
        try {
            rowSet.beforeFirst();
            while(rowSet.next()) {
                company.id = rowSet.getInt("id");
                company.name = rowSet.getString("name");
                company.description = rowSet.getString("description");
                company.location = rowSet.getString("location");
                company.categoryName = rowSet.getString("categoryName");
                company.investmentStock = rowSet.getInt("investmentStock");
                company.investmentTarget = rowSet.getLong("investmentTarget");
                company.investedAmount = rowSet.getLong("investedAmount");
                company.fulfilledPercentage = rowSet.getFloat("fulfilledPercentage");
                company.image = rowSet.getString("image");
                company.email = rowSet.getString("email");
                company.phone = rowSet.getString("phone");
                company.url = rowSet.getString("url");
                company.foundedYear = Integer.valueOf(rowSet.getString("foundedYear"));
                company.isInvested = rowSet.getString("isInvested") == 'Y' ? true : false;
                company.isCompleted = rowSet.getString("isCompleted") == 'Y' ? true : false;

                companyList.add(company);
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

        return companyList;
    }
    
    @Override
    public boolean updateCompany(Company company) {
        String query = "" +
        "UPDATE c " +
        "   SET c.description = ? " +
        "     , c.image = ? " +
        "     , c.email = ? " +
        "     , c.phone = ? " +
        "     , c.url = ? " +
        "  FROM Companies c " +
        " WHERE c.id = ?";

        Object[] parameters = new Object[] {
            company.description,
            company.image,
            company.email,
            company.phone,
            company.url,
            company.id
        }
        
        TemuSahamDbInstance.executeQuery(query, parameters);
        return true;
    }

    @Override
    public boolean deleteCompany(int id) {
        String query = "" +
        "DELETE FROM Companies " +
        " WHERE id = ? " +
        "   AND is_invested = 'N'";

        TemuSahamDbInstance.executeQuery(query, null);
        return true;
    }
}
%>