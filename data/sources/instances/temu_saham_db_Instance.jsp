<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>

<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Statement" %>

<%@ page import="javax.sql.RowSet" %>
<%@ page import="javax.sql.rowset.CachedRowSet" %>
<%@ page import="javax.sql.rowset.RowSetProvider" %>

<%@ include file="../entities/categories_entity.jsp" %>
<%@ include file="../entities/companies_entity.jsp" %>
<%@ include file="../entities/investments_entity.jsp" %>
<%@ include file="../entities/users_entity.jsp" %>

<%!
static class TemuSahamDbInstance {
    protected static String driver = "com.mysql.cj.jdbc.Driver";
    protected static String url = "jdbc:mysql://localhost:3306/";
    public static String name = "TemuSahamDb";
    protected static String user = "root";
    protected static String password = "";
    protected static Connection connection = null;

    public static Connection getConnection() {

        try {
            Class.forName(driver);
            
            if (connection == null) {
                System.out.println("Database has been created.");
                connection = DriverManager.getConnection(url + name, user, password);
                connection.setAutoCommit(true);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            if (connection == null) {
                System.out.println("Database has not been created.");
                initDatabase();
            }
        }

        return connection;
    }

    /*
    public static RowSet executeQuery(String query, Object[] parameters) {
        CachedRowSet rowSet = null;
        connection = getConnection();

        try {
            System.out.println("Hello 1");
            rowSet = RowSetProvider.newFactory().createCachedRowSet();
            rowSet.setCommand(query);

            System.out.println("Hello 2");
            if (parameters != null) {
                System.out.println("Hello 3");
                for (int i = 0; i < parameters.length; i++) {
                    rowSet.setObject(i + 1, parameters[i]);
                }
            }
            System.out.println("Hello 4");
            System.out.println(connection.isClosed() ? "A Connection is closed": "A Connection is not closed");
            rowSet.execute(connection);
            System.out.println(connection.isClosed() ? "A Connection is closed": "A Connection is not closed");
            System.out.println("Hello 5");
            rowSet.first();
            System.out.println("Hello 6");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                    connection = null;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return rowSet;
    }*/

    public static RowSet executeQuery(String query, Object[] parameters) {
        CachedRowSet rowSet = null;
        connection = getConnection();
        System.out.println(query.toUpperCase());
        System.out.println(query.toUpperCase().indexOf("SELECT"));
        try { 
            if(query.toUpperCase().indexOf("SELECT") != 0) {
                System.out.println("Manipulation Query");
                System.out.println(connection == null);
                
                PreparedStatement statement = connection.prepareStatement(query);
                System.out.println("Prepared the statement");

                if (parameters != null) {
                    for (int i = 0; i < parameters.length; i++) {
                        statement.setObject(i + 1, parameters[i]);
                    }
                }

                System.out.println("Parameters has been input.");
                // int i = statement.executeUpdate();
                // System.out.println(i + "row(s) affected.");
                //connection.commit();
                statement.executeUpdate();
                System.out.println("Statement executed.");

                statement.close();
                statement = null;
                System.out.println("Statement terminated.");
            } else { 
                System.out.println("Retrieval Query");
                rowSet = RowSetProvider.newFactory().createCachedRowSet();
                rowSet.setCommand(query);

                if (parameters != null) {
                    for (int i = 0; i < parameters.length; i++) {
                        rowSet.setObject(i + 1, parameters[i]);
                    }
                }
                // System.out.println(connection.isClosed() ? "1 Connection is closed": "1 Connection is not closed");
                // System.out.println(connection.isClosed() ? "1 Connection is closed": "1 Connection is not closed");
                // System.out.println(connection.getMetaData().getURL());
                rowSet.execute(connection);
                rowSet.first();
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            System.out.println("Im in.");
            try {
                if (connection != null) {
                    System.out.println("Infiltrated.");
                    connection.close();
                    connection = null;
                    System.out.println("Terminated.");
                    System.out.println(connection == null);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return rowSet;
    }

    public static RowSet executeQuery(String query, Object[] parameters, int offset, int size) {
        String paginatedQuery = query + " LIMIT ?, ?";
        Object[] paginationParameters = new Object[parameters.length + 1];

        for (int i = 0; i < parameters.length; ++i) {
            paginationParameters[i] = parameters[i];
        }

        paginationParameters[parameters.length] = offset;
        paginationParameters[parameters.length + 1] = size;

        return executeQuery(paginatedQuery, parameters);
    }

    public static void initDatabase() {
        try {
            connection = DriverManager.getConnection(url, user, password);
            System.out.println(connection.isClosed() ? "1 Connection is closed": "1 Connection is not closed");
            System.out.println(connection.isClosed() ? "2 Connection is closed": "2 Connection is not closed");
            executeQuery("CREATE DATABASE IF NOT EXISTS " + name, null);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(connection != null) {
                    connection.close();
                    connection = null;
                }
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }

        initTables();
    }

    public static void initTables() {
        try {
            connection = DriverManager.getConnection(url + name, user, password);
            connection.setAutoCommit(true);

            executeQuery(CategoriesEntity.SQL_CREATE, null);
            executeQuery(UsersEntity.SQL_CREATE, null);
            executeQuery(CompaniesEntity.SQL_CREATE, null);
            executeQuery(InvestmentsEntity.SQL_CREATE, null);
            
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                if(connection != null) {
                    connection.close();
                    connection = null;
                }
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }
    }

    public static void drop() {
        executeQuery("DROP DATABASE IF EXISTS " + name, null);
    }
}
%>