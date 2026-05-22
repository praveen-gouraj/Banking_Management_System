package servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import service.BankService;

@WebServlet("/accounts")
public class AllAccountsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<Account> accounts = BankService.getAllAccounts();
            req.setAttribute("title", "All Accounts");
            req.setAttribute("message", accounts.isEmpty() ? "No accounts found." : "Account list loaded successfully.");
            req.setAttribute("accounts", accounts);
        } catch (Exception ex) {
            req.setAttribute("title", "Account List Failed");
            req.setAttribute("message", ex.getMessage());
        }

        req.getRequestDispatcher("/message.jsp").forward(req, resp);
    }
}