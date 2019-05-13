package filmsystem.DAO;

import java.sql.*;

public class BaseDAO {
	Connection ct;

	public BaseDAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			ct = DriverManager.getConnection("jdbc:mysql://localhost:3306/movie", "root", "root");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() {
		return ct;
	}

	public void close() {
		try {
			if (ct != null) {
				ct.close();
				ct = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}