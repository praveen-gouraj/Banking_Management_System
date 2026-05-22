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

@WebServlet("/withdraw")
public class WithdrawServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/withdraw.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int accNo = ValidationUtil.parseAccountNo(req.getParameter("accNo"));
            double amount = ValidationUtil.parseAmount(req.getParameter("amount"));

            Account account = BankService.withdraw(accNo, amount);
            req.setAttribute("title", "Withdrawal Successful");
            req.setAttribute("message", "Amount withdrawn successfully.");
            req.setAttribute("account", account);
        } catch (Exception ex) {
            req.setAttribute("title", "Withdrawal Failed");
            req.setAttribute("message", ex.getMessage());
        }

        req.getRequestDispatcher("/message.jsp").forward(req, resp);
    }
}