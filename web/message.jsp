<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.List,model.Account" %>
<%
    String title = (String) request.getAttribute("title");
    String message = (String) request.getAttribute("message");
    Account account = (Account) request.getAttribute("account");
    List<Account> accounts = (List<Account>) request.getAttribute("accounts");
    if (title == null) {
        title = "Operation Result";
    }
    if (message == null) {
        message = "";
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= title %> - Atlas Banking System</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <!-- Navigation Header -->
    <header class="navbar">
        <div class="navbar-container">
            <div class="navbar-brand">
                Atlas Banking System
            </div>
            <nav class="navbar-nav">
                <a href="index.jsp">Dashboard</a>
                <a href="create-account">Create Account</a>
                <a href="deposit">Deposit</a>
                <a href="withdraw">Withdraw</a>
                <a href="search-account">Search</a>
                <a href="accounts">All Accounts</a>
            </nav>
            <div class="navbar-footer">Online Banking</div>
        </div>
    </header>

    <div class="page-container">
        <div class="page-content">
            <div class="container">
                <div class="form-wrapper">
                    <!-- Result Sidebar -->
                    <aside class="form-sidebar">
                        <div class="form-info-card">
                            <h2>Operation Result</h2>
                            <p>This response is generated directly from the service layer and JDBC-backed database records.</p>
                            <p><strong>Timestamp:</strong> <%= new java.text.SimpleDateFormat("dd MMM yyyy HH:mm:ss").format(new java.util.Date()) %></p>
                            <p>All transactions are securely logged and verified for integrity.</p>
                        </div>
                    </aside>

                    <!-- Result Card -->
                    <div class="form-card">
                        <div class="result-header">
                            <p style="color: var(--primary); font-weight: 600; text-transform: uppercase; font-size: 0.875rem;">Operation Response</p>
                            <h1 class="result-title"><%= title %></h1>
                            <p class="result-message"><%= message %></p>
                        </div>

                        <!-- Account Details Display -->
                        <% if (account != null) { %>
                        <div class="result-grid">
                            <div class="result-item">
                                <div class="result-item-label">Account Number</div>
                                <div class="result-item-value"><%= account.getAccNo() %></div>
                            </div>
                            <div class="result-item">
                                <div class="result-item-label">Customer Name</div>
                                <div class="result-item-value"><%= account.getName() %></div>
                            </div>
                            <div class="result-item">
                                <div class="result-item-label">Current Balance</div>
                                <div class="result-item-value">$<%= String.format("%.2f", account.getBalance()) %></div>
                            </div>
                        </div>
                        <% } %>

                        <!-- All Accounts Table Display -->
                        <% if (accounts != null && !accounts.isEmpty()) { %>
                        <div style="margin-top: var(--space-2xl);">
                            <h3 style="font-size: 1.25rem; font-weight: 700; margin-bottom: var(--space-lg); color: var(--text-primary);">Account List</h3>
                            <div class="table-container">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Account Number</th>
                                            <th>Customer Name</th>
                                            <th>Current Balance</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (Account item : accounts) { %>
                                        <tr>
                                            <td><strong><%= item.getAccNo() %></strong></td>
                                            <td><%= item.getName() %></td>
                                            <td><strong style="color: var(--primary);">$<%= String.format("%.2f", item.getBalance()) %></strong></td>
                                        </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <% } %>

                        <div class="inline-actions" style="margin-top: var(--space-2xl); padding-top: var(--space-xl); border-top: 1px solid var(--border-color);">
                            <a class="btn-link" href="index.jsp">← Back to Dashboard</a>
                            <a class="btn-link" href="accounts">View All Accounts →</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer>
            <div class="footer-content">
                <div class="footer-section">
                    <h3>Operations</h3>
                    <ul>
                        <li><a href="create-account">Create Account</a></li>
                        <li><a href="deposit">Deposit</a></li>
                        <li><a href="withdraw">Withdraw</a></li>
                        <li><a href="search-account">Search</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h3>Features</h3>
                    <ul>
                        <li><a href="accounts">All Accounts</a></li>
                        <li><a href="#">Account Balance</a></li>
                        <li><a href="#">Transaction History</a></li>
                        <li><a href="#">Validation Rules</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h3>System Info</h3>
                    <ul>
                        <li><a href="#">Tomcat 9</a></li>
                        <li><a href="#">MySQL Database</a></li>
                        <li><a href="#">JSP + Servlets</a></li>
                        <li><a href="#">JDBC API</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h3>Support</h3>
                    <ul>
                        <li><a href="#">Documentation</a></li>
                        <li><a href="#">Help Center</a></li>
                        <li><a href="#">API Reference</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2024 Atlas Banking Management System. All rights reserved. | Modern web-based banking platform.</p>
            </div>
        </footer>
    </div>
</body>
</html>