<%@ page import="java.util.List" %>
<%@ include file="../models/Company.jsp" %>

<%!
interface CompanyRepository {
    public Company getCompanyById(int id);
    public List<Company> getInvestedCompanyList();
    public List<Company> getCompanyListByKeyword(String keyword);
    public boolean updateCompany(Company company);
    public boolean deleteCompany(int id);
}
%>