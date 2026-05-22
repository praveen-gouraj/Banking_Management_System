package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Transaction;
import util.DBConnection;

public class TransactionDAO {

    public static void insert(Transaction transaction) throws SQLException {
        String sql = "INSERT INTO transactions (acc_no, type, amount, balance_after, created_at) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, transaction.getAccNo());
            ps.setString(2, transaction.getType());
            ps.setDouble(3, transaction.getAmount());
            ps.setDouble(4, transaction.getBalanceAfter());
            ps.setTimestamp(5, transaction.getCreatedAt());
            ps.executeUpdate();

            try (ResultSet keys = ps.getGeneratedKeys()) {
                if (keys.next()) {
                    transaction.setTransactionId(keys.getInt(1));
                }
            }
        }
    }

    public static List<Transaction> findByAccount(int accNo) throws SQLException {
        String sql = "SELECT transaction_id, acc_no, type, amount, balance_after, created_at FROM transactions WHERE acc_no = ? ORDER BY created_at DESC, transaction_id DESC";
        List<Transaction> transactions = new ArrayList<>();

        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, accNo);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    transactions.add(new Transaction(
                        rs.getInt("transaction_id"),
                        rs.getInt("acc_no"),
                        rs.getString("type"),
                        rs.getDouble("amount"),
                        rs.getDouble("balance_after"),
                        rs.getTimestamp("created_at")
                    ));
                }
            }
        }

        return transactions;
    }

    public static List<Transaction> findAll() throws SQLException {
        String sql = "SELECT transaction_id, acc_no, type, amount, balance_after, created_at FROM transactions ORDER BY created_at DESC, transaction_id DESC";
        List<Transaction> transactions = new ArrayList<>();

        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                transactions.add(new Transaction(
                    rs.getInt("transaction_id"),
                    rs.getInt("acc_no"),
                    rs.getString("type"),
                    rs.getDouble("amount"),
                    rs.getDouble("balance_after"),
                    rs.getTimestamp("created_at")
                ));
            }
        }

        return transactions;
    }
}