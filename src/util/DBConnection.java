package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnection {

    private static final String DEFAULT_URL = "jdbc:mysql://localhost:3306/bank?useSSL=false&serverTimezone=UTC";
    private static final String DEFAULT_USER = "root";
    private static final String DEFAULT_PASSWORD = "praveen";
    private static final String DEFAULT_DRIVER = "com.mysql.cj.jdbc.Driver";
    private static volatile boolean schemaInitialized;

    public static Connection getConnection() throws SQLException {
        String url = System.getProperty("bank.db.url", DEFAULT_URL);
        String user = System.getProperty("bank.db.user", DEFAULT_USER);
        String password = System.getProperty("bank.db.password", DEFAULT_PASSWORD);
        String driver = System.getProperty("bank.db.driver", DEFAULT_DRIVER);

        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ignored) {
        }

        Connection connection = DriverManager.getConnection(url, user, password);
        initializeSchemaIfNeeded(connection);
        return connection;
    }

    private static void initializeSchemaIfNeeded(Connection connection) throws SQLException {
        if (schemaInitialized) {
            return;
        }

        synchronized (DBConnection.class) {
            if (schemaInitialized) {
                return;
            }

            try (Statement statement = connection.createStatement()) {
                statement.executeUpdate(
                    "CREATE TABLE IF NOT EXISTS account ("
                        + "acc_no INT PRIMARY KEY,"
                        + "name VARCHAR(100) NOT NULL,"
                        + "balance DECIMAL(12,2) NOT NULL DEFAULT 0.00"
                        + ")"
                );

                statement.executeUpdate(
                    "CREATE TABLE IF NOT EXISTS transactions ("
                        + "transaction_id INT AUTO_INCREMENT PRIMARY KEY,"
                        + "acc_no INT NOT NULL,"
                        + "type VARCHAR(20) NOT NULL,"
                        + "amount DECIMAL(12,2) NOT NULL,"
                        + "balance_after DECIMAL(12,2) NOT NULL,"
                        + "created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,"
                        + "CONSTRAINT fk_transactions_account FOREIGN KEY (acc_no) REFERENCES account(acc_no) ON DELETE CASCADE"
                        + ")"
                );
            }

            schemaInitialized = true;
        }
    }
}