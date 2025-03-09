package com.otp.mobileservlet;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import org.apache.log4j.Logger;

public class DatabasePracticeUtil {

    static final Logger log = Logger.getLogger(DatabasePracticeUtil.class);

    // Updated Oracle JDBC URL
    static final String url = "jdbc:oracle:thin:@localhost:1521:orcl"; 
    static final String username = "sys as sysdba";
    static final String password = "system123#"; // Replace with actual password

    public static void callprocedure(String mobileNo, boolean isVerfied,String apiResponse) throws ClassNotFoundException {
        Class.forName("oracle.jdbc.driver.OracleDriver");

        log.info("Stored procedure execution started for mobile: " + mobileNo + " : " + isVerfied);

        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url, username, password);

            CallableStatement stmt = conn.prepareCall("{call sp_insert_verification(?,?,?)}");
            stmt.setString(1, mobileNo);
            stmt.setString(2, isVerfied ? "Y" : "N");
             stmt.setString(3, apiResponse);

            stmt.execute();

            log.info("Stored procedure executed successfully for mobile: " + mobileNo);
        } catch (SQLException ex) {
            log.error("Error executing stored procedure: ", ex);
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (SQLException e) {
                log.error("Error closing connection: ", e);
            }
        }
    }
}
