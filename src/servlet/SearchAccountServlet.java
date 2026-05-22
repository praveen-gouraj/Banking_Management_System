package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import service.BankService;
import util.ValidationUtil;

@WebServlet("/search-account")
public class SearchAccountServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/search.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int accNo = ValidationUtil.parseAccountNo(req.getParameter("accNo"));
            Account account = BankService.getAccount(accNo);

            req.setAttribute("title", "Account Lookup");
            if (account == null) {
                req.setAttribute("message", "Account not found.");
            } else {
                req.setAttribute("message", "Account found successfully.");
                req.setAttribute("account", account);
            }
        } catch (Exception ex) {
            req.setAttribute("title", "Search Failed");
            req.setAttribute("message", ex.getMessage());
        }

        req.getRequestDispatcher("/message.jsp").forward(req, resp);
    }
}