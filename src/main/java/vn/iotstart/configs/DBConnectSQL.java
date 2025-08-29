package vn.iotstart.configs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConnectSQL {
	private final String serverName = "localhost";
	private final String dbName = "web_test";
	private final String portNumber = "1433";
	private final String instance   = "DUYSQL";      
	private final String userID = "sa";
	private final String password = "40938813dD#";

	public Connection getConnection() throws Exception {
		String server = (instance == null || instance.trim().isEmpty()) ? (serverName + ":" + portNumber)
				: (serverName + "\\" + instance);

		String url = "jdbc:sqlserver://" + server + ";databaseName=" + dbName
				+ ";encrypt=false;trustServerCertificate=true" + ";loginTimeout=10";

		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		return DriverManager.getConnection(url, userID, password);
	}

	public static void main(String[] args) {
		try {
			Connection conn = new DBConnectSQL().getConnection();
			if (conn != null) {
				System.out.println("Kết nối SQL Server thành công với user sa!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}