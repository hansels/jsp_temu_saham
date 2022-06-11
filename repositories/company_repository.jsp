<%@ page import="java.util.List" %>

<%!
interface CompanyRepository {
    public Company getCompanyById(int id);
    public Company getCompanyByUserEmail(String userEmail);
    public List<Company> getInvestedCompanyListByUserId(int userId);
    public List<Company> getCompanyListByKeyword(String keyword);
    public boolean updateCompanyFull(Company company);
    public boolean updateCompany(Company company);
    public boolean deleteCompany(int id);
    public Company createCompany(Company company);
    public Company createCompanyKosongan(Company company);
}
%>  