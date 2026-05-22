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

@WebServlet("/create-account")
public class CreateAccountServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/createAccount.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int accNo = ValidationUtil.parseAccountNo(req.getParameter("accNo"));
            String name = ValidationUtil.requireValidName(req.getParameter("name"));
            double balance = ValidationUtil.parseAmount(req.getParameter("balance"));

            Account account = BankService.createAccount(accNo, name, balance);
            req.setAttribute("title", "Account Created");
            req.setAttribute("message", "Account created successfully.");
            req.setAttribute("account", account);
        } catch (Exception ex) {
            req.setAttribute("title", "Create Account Failed");
            req.setAttribute("message", ex.getMessage());
        }

        req.getRequestDispatcher("/message.jsp").forward(req, resp);
    }
}