<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Withdraw Funds - Atlas Banking System</title>
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
                <a href="withdraw" class="active">Withdraw</a>
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
                    <!-- Form Sidebar -->
                    <aside class="form-sidebar">
                        <div class="form-info-card">
                            <h2>Secure Withdrawals</h2>
                            <p>Process outgoing funds with comprehensive account and balance validation to prevent overdraft situations.</p>
                            <p>Tip: Use the search feature before withdrawal to verify customer identity and available balance.</p>
                            <p>All withdrawal transactions are protected with overdraft safeguards and validation checks.</p>
                        </div>
                    </aside>

                    <!-- Form Card -->
                    <div class="form-card">
                        <div class="form-header">
                            <p style="color: var(--primary); font-weight: 600; text-transform: uppercase; font-size: 0.875rem; margin: 0 0 12px;">Debit Desk</p>
                            <h1 class="form-title">Withdraw Funds Safely</h1>
                            <p class="form-description">Withdraw amount from an account with comprehensive balance validation safeguards.</p>
                        </div>

                        <form class="bank-form" action="withdraw" method="post">
                            <div class="form-group">
                                <label class="form-label" for="accNo">Account Number</label>
                                <input class="form-input" type="number" id="accNo" name="accNo" min="1" required placeholder="e.g., 1001">
                                <span class="form-help">The account to withdraw from</span>
                            </div>

                            <div class="form-group">
                                <label class="form-label" for="amount">Withdrawal Amount</label>
                                <input class="form-input" type="number" id="amount" name="amount" step="0.01" min="0.01" required placeholder="e.g., 500.00">
                                <span class="form-help">Amount to withdraw (minimum 0.01, must not exceed balance)</span>
                            </div>

                            <div class="form-actions">
                                <button type="submit" class="btn btn-danger btn-lg btn-block">Process Withdrawal</button>
                            </div>
                        </form>

                        <div class="inline-actions" style="margin-top: var(--space-xl); padding-top: var(--space-xl); border-top: 1px solid var(--border-color);">
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