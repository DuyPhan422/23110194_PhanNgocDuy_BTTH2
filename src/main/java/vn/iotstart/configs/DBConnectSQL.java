package vn.iotstart.configs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectSQL {
	private final String serverName = ".\\DUYSQL";
	private final String dbName = "web_test";
	private final String portNumber = "1433";
	private final String instance = "";
	private final String userID = "sa";
	private final String password = "40938813dD#";

	public Connection getConnection() throws Exception {
		String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName
				+ ";encrypt=false;";

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