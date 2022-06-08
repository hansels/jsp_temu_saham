<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%!
class UserRepositoryImpl implements UserRepository {

    @Override
    public User getUserById(int id) {
        String query = "" +
        "SELECT u.id, u.name, u.type, u.email, u.password" +
        "  FROM Users u" +
        " WHERE u.id = ?";

        Object[] parameters = new Object[] { id };

        RowSet rowSet = TemuSahamDbInstance.executeQuery(query, parameters);

        User user = new User();
        try {
            rowSet.beforeFirst();
            while(rowSet.next()) {
                user.id = rowSet.getInt("id");
                user.name = rowSet.getString("name");
                user.type = rowSet.getString("type");
                user.email = rowSet.getString("email");
                user.password = rowSet.getString("password");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user.id != null ? user : null;
    }

    @Override
    public User getUserByEmail(String email) {
        String query = "" +
        "SELECT u.id, u.name, u.type, u.email, u.password" +
        "  FROM Users u" +
        " WHERE u.email = ?";

        Object[] parameters = new Object[] { email };

        RowSet rowSet = TemuSahamDbInstance.executeQuery(query, parameters);

        User user = new User();
        try {
            rowSet.beforeFirst();
            while(rowSet.next()) {
                user.id = rowSet.getInt("id");
                user.name = rowSet.getString("name");
                user.type = rowSet.getString("type");
                user.email = rowSet.getString("email");
                user.password = rowSet.getString("password");
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

        return user.id != null ? user : null;;
    }

    @Override
    public boolean addUser(User user) {
        System.out.println("AddUser is running.");
        System.out.println("Preparing query.");
        String query = "" +
        "INSERT INTO Users (name, type, email, password) " +
        "VALUES (?, ?, ?, ?)";

        System.out.println("Preparing parameter.");
        Object[] parameters = new Object[] {
            user.name, user.type, user.email, user.password
        };

        System.out.println("Calling executeQuery.");
        TemuSahamDbInstance.executeQuery(query, parameters);
        System.out.println("Called executeQuery.");
        System.out.println("Returning.");
        return true;
    }

    @Override
    public boolean updateUser(User user) {
        String query = "" +
        "UPDATE u " +
        "   SET name = ? " +
        "     , email = ? " +
        "     , password = ? " +
        "  FROM Users u " +
        " WHERE u.id = ?";

        Object[] parameters = new Object[] {
            user.name, user.email, user.password, user.id
        };

        TemuSahamDbInstance.executeQuery(query, parameters);
        return true;
    }

    @Override
    public List<String> getUserTypes() {
        String query = "" +
        "SELECT DISTINCT type " +
        "  FROM Users " +
        " ORDER BY name";

        RowSet rowSet = TemuSahamDbInstance.executeQuery(query, null);

        List<String> userTypeList = new ArrayList<>();
        try {
            rowSet.beforeFirst();
            while(rowSet.next()) {
                userTypeList.add(rowSet.getString(1));
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

        return userTypeList.size() != 0 ? userTypeList : null;
    }
}
%>