package service;

import dao.AccountDAO;
import dao.TransactionDAO;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import model.Account;
import model.Transaction;
import util.ValidationUtil;

public class BankService {

    private static final Map<Integer, Account> CACHE = new ConcurrentHashMap<>();
    private static final List<Transaction> TRANSACTION_CACHE = Collections.synchronizedList(new ArrayList<>());

    private BankService() {
    }

    public static Account createAccount(int accNo, String name, double openingBalance) throws Exception {
        ValidationUtil.requirePositiveAccountNo(accNo);
        String validName = ValidationUtil.requireValidName(name);
        ValidationUtil.requirePositiveAmount(openingBalance);

        if (AccountDAO.exists(accNo)) {
            throw new IllegalArgumentException("Account already exists.");
        }

        Account account = new Account(accNo, validName, openingBalance);
        AccountDAO.insert(account);
        CACHE.put(accNo, account);
        recordTransaction(accNo, "OPEN", openingBalance, openingBalance);
        return account;
    }

    public static Account deposit(int accNo, double amount) throws Exception {
        ValidationUtil.requirePositiveAccountNo(accNo);
        ValidationUtil.requirePositiveAmount(amount);

        Account account = getAccount(accNo);
        if (account == null) {
            throw new IllegalArgumentException("Account not found.");
        }

        account.setBalance(account.getBalance() + amount);
        AccountDAO.updateBalance(accNo, account.getBalance());
        CACHE.put(accNo, account);
        recordTransaction(accNo, "DEPOSIT", amount, account.getBalance());
        return account;
    }

    public static Account withdraw(int accNo, double amount) throws Exception {
        ValidationUtil.requirePositiveAccountNo(accNo);
        ValidationUtil.requirePositiveAmount(amount);

        Account account = getAccount(accNo);
        if (account == null) {
            throw new IllegalArgumentException("Account not found.");
        }

        if (account.getBalance() < amount) {
            throw new IllegalArgumentException("Insufficient balance.");
        }

        account.setBalance(account.getBalance() - amount);
        AccountDAO.updateBalance(accNo, account.getBalance());
        CACHE.put(accNo, account);
        recordTransaction(accNo, "WITHDRAW", amount, account.getBalance());
        return account;
    }

    public static Account getAccount(int accNo) throws Exception {
        ValidationUtil.requirePositiveAccountNo(accNo);

        Account cached = CACHE.get(accNo);
        if (cached != null) {
            return cached;
        }

        Account account = AccountDAO.findById(accNo);
        if (account != null) {
            CACHE.put(accNo, account);
        }
        return account;
    }

    public static List<Account> getAllAccounts() throws Exception {
        List<Account> accounts = AccountDAO.findAll();
        for (Account account : accounts) {
            CACHE.put(account.getAccNo(), account);
        }
        return accounts;
    }

    public static List<Account> searchAccounts(String query) throws Exception {
        String term = query == null ? "" : query.trim().toLowerCase();
        List<Account> matches = new ArrayList<>();

        for (Account account : getAllAccounts()) {
            String accNoText = String.valueOf(account.getAccNo());
            if (accNoText.equals(term) || account.getName().toLowerCase().contains(term)) {
                matches.add(account);
            }
        }

        return matches;
    }

    public static List<Transaction> getTransactions(int accNo) throws Exception {
        ValidationUtil.requirePositiveAccountNo(accNo);
        return TransactionDAO.findByAccount(accNo);
    }

    public static List<Transaction> getCachedTransactions() {
        return new ArrayList<>(TRANSACTION_CACHE);
    }

    private static void recordTransaction(int accNo, String type, double amount, double balanceAfter) throws SQLException {
        Transaction transaction = new Transaction(0, accNo, type, amount, balanceAfter, new Timestamp(System.currentTimeMillis()));
        TransactionDAO.insert(transaction);
        TRANSACTION_CACHE.add(transaction);
    }
}