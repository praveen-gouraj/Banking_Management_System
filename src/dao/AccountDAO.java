package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import util.DBConnection;

public class AccountDAO {

    public static void insert(Account account) throws SQLException {
        String sql = "INSERT INTO account (acc_no, name, balance) VALUES (?, ?, ?)";

        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, account.getAccNo());
            ps.setString(2, account.getName());
            ps.setDouble(3, account.getBalance());
            ps.executeUpdate();
        }
    }

    public static Account findById(int accNo) throws SQLException {
        String sql = "SELECT acc_no, name, balance FROM account WHERE acc_no = ?";

        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, accNo);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Account(
                        rs.getInt("acc_no"),
                        rs.getString("name"),
                        rs.getDouble("balance")
                    );
                }
            }
        }

        return null;
    }

    public static List<Account> findAll() throws SQLException {
        String sql = "SELECT acc_no, name, balance FROM account ORDER BY acc_no";
        List<Account> accounts = new ArrayList<>();

        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                accounts.add(new Account(
                    rs.getInt("acc_no"),
                    rs.getString("name"),
                    rs.getDouble("balance")
                ));
            }
        }

        return accounts;
    }

    public static boolean exists(int accNo) throws SQLException {
        String sql = "SELECT 1 FROM account WHERE acc_no = ?";

        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, accNo);

            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }

    public static void updateBalance(int accNo, double balance) throws SQLException {
        String sql = "UPDATE account SET balance = ? WHERE acc_no = ?";

        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setDouble(1, balance);
            ps.setInt(2, accNo);
            ps.executeUpdate();
        }
    }
}