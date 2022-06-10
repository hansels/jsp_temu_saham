<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%@ page import="java.sql.SQLException" %>

<%@ page import="javax.sql.RowSet" %>
<%@ page import="javax.sql.rowset.CachedRowSet" %>
<%@ page import="javax.sql.rowset.RowSetProvider" %>

<%@ include file="../models/Company.jsp" %>
<%@ include file="company_repository.jsp" %>

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
        "       ON  u.id = c.user_id" +
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
        User user = new User();
        try {
            rowSet.beforeFirst();
            while(rowSet.next()) {
                company.id = rowSet.getInt("id");
                user.name = rowSet.getString("ownerName");
                user.email = rowSet.getString("ownerEmail");
                company.owner = user;
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
                company.isInvested = rowSet.getString("isInvested").charAt(0) == 'Y' ? true : false;
                company.isCompleted = rowSet.getString("isCompleted").charAt(0) == 'Y' ? true : false;
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

        return company.id != 0 ? company : null;
    }

    @Override
    public Company getCompanyByUserEmail(String userEmail) {
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
        "       ON  u.id = c.user_id" +
        " WHERE u.email = ?" +
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

        Object[] parameters = new Object[] { userEmail };

        //System.out.println(userEmail);
        RowSet rowSet = TemuSahamDbInstance.executeQuery(query, parameters);
        //System.out.println("Passed");

        Company company = new Company();
        User user = new User();
        try {
            rowSet.beforeFirst();
            while(rowSet.next()) {
                company.id = rowSet.getInt("id");
                user.name = rowSet.getString("ownerName");
                user.email = rowSet.getString("ownerEmail");
                company.owner = user;
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
                company.isInvested = rowSet.getString("isInvested").charAt(0) == 'Y' ? true : false;
                company.isCompleted = rowSet.getString("isCompleted").charAt(0) == 'Y' ? true : false;
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

        //System.out.println(company);
        return company.id != 0 ? company : null;
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
        "       ON  u.id = c.user_id" +
        " WHERE u.id = ?" +
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
        User user = new User();
        try {
            rowSet.beforeFirst();
            while(rowSet.next()) {
                company.id = rowSet.getInt("id");
                user.name = rowSet.getString("ownerName");
                user.email = rowSet.getString("ownerEmail");
                company.owner = user;
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
                company.isInvested = rowSet.getString("isInvested").charAt(0) == 'Y' ? true : false;
                company.isCompleted = rowSet.getString("isCompleted").charAt(0) == 'Y' ? true : false;

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

        return companyList.size() != 0 ? companyList : null;
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
        "       ON  u.id = c.user_id" +
        " WHERE is_completed = 'Y' " +
        "   AND UPPER(c.name) LIKE UPPER(?) " +
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

        Object[] parameters = new Object[] { "%" + keyword + "%"};

        RowSet rowSet = TemuSahamDbInstance.executeQuery(query, parameters);

        List<Company> companyList = new ArrayList<>();
        Company company = new Company();
        User user = new User();
        try {
            rowSet.beforeFirst();
            while(rowSet.next()) {
                company.id = rowSet.getInt("id");
                user.name = rowSet.getString("ownerName");
                user.email = rowSet.getString("ownerEmail");
                company.owner = user;
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
                company.isInvested = rowSet.getString("isInvested").charAt(0) == 'Y' ? true : false;
                company.isCompleted = rowSet.getString("isCompleted").charAt(0) == 'Y' ? true : false;

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
        //System.out.println("Returning...");
        //System.out.println(companyList.size());
        return companyList.size() != 0 ? companyList : null;
    }
    
    @Override
    public boolean updateCompany(Company company) {
        String query = "" +
        "UPDATE Companies c " +
        "   SET c.description = IFNULL(?, description)" +
        "     , c.image = IFNULL(?, image)" +
        "     , c.email = IFNULL(?, email)" +
        "     , c.phone = IFNULL(?, phone)" +
        "     , c.url = IFNULL(?, url)" +
        "     , c.is_completed = IFNULL(?, is_completed)" +
        " WHERE c.id = ?";

        Object[] parameters = new Object[] {
            company.description,
            company.image,
            company.email,
            company.phone,
            company.url,
            company.isCompleted ? "Y" : "N",
            company.id
        };
        
        TemuSahamDbInstance.executeQuery(query, parameters);
        return true;
    }

    @Override
    public boolean deleteCompany(int id) {
        String query = "" +
        "DELETE FROM Companies " +
        " WHERE id = ? " +
        "   AND is_invested = 'N'";

        Object[] parameters = new Object[] { id };

        TemuSahamDbInstance.executeQuery(query, parameters);
        return true;
    }

    @Override
    public Company createCompany(Company company) {
        String query = "" +
        "INSERT INTO Companies (user_id, category_id, name, description, location, investment_stock, investment_target, image, email, phone, url, founded_year)" +
        "SELECT u.id, c.id, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? " +
        "  FROM Users u, Categories c " +
        " WHERE u.email = ? AND c.name = ? " +
        "   AND (SELECT COUNT(*) FROM Companies co WHERE co.user_id = u.id) = 0";

        Object[] parameters = new Object[] {
            company.name,
            company.description,
            company.location,
            company.investmentStock,
            company.investmentTarget,
            company.image,
            company.email,
            company.phone,
            company.url,
            company.foundedYear,
            company.owner.email,
            company.categoryName
        };

        TemuSahamDbInstance.executeQuery(query, parameters);
        
        Company result = getCompanyByUserEmail(company.owner.email);
        //System.out.println("Hello");
        
        return result;
    }
}
%>