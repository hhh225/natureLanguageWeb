package DBbean;
import java.sql.*;
public class Database {
	static private Connection conn;
	static private String user="root";
	static private String pw="123456";
	static private Statement stm=null;
	public Database() {
		// TODO Auto-generated constructor stub
	}
	static {
		
			try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://47.92.255.34:3306/natureLanguage?useSSL=false&serverTimezone=UTC",user,pw);
			stm=conn.createStatement();
		}
		catch(Exception e) {}
		
	}
	public static Statement getStm() {
//		if(stm==null) {
//			try {
//			Class.forName("com.mysql.cj.jdbc.Driver");
//			conn=DriverManager.getConnection("jdbc:mysql://47.92.255.34:3306/natureLanguage?useSSL=false&serverTimezone=UTC",user,pw);
//			stm=conn.createStatement();
//		}
//		catch(Exception e) {}
//		}
		return stm;
	}
	public static void close() {
		try {
			stm.close();
			conn.close();
		}
		catch(SQLException e) {}
	}
}
