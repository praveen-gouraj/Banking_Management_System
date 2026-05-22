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

@WebServlet("/deposit")
public class DepositServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/deposit.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int accNo = ValidationUtil.parseAccountNo(req.getParameter("accNo"));
            double amount = ValidationUtil.parseAmount(req.getParameter("amount"));

            Account account = BankService.deposit(accNo, amount);
            req.setAttribute("title", "Deposit Successful");
            req.setAttribute("message", "Amount deposited successfully.");
            req.setAttribute("account", account);
        } catch (Exception ex) {
            req.setAttribute("title", "Deposit Failed");
            req.setAttribute("message", ex.getMessage());
        }

        req.getRequestDispatcher("/message.jsp").forward(req, resp);
    }
}