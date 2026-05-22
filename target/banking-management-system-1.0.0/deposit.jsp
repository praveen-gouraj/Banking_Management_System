<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deposit Funds - Atlas Banking System</title>
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
                <a href="deposit" class="active">Deposit</a>
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
                    <!-- Form Sidebar -->
                    <aside class="form-sidebar">
                        <div class="form-info-card">
                            <h2>Balance Increase</h2>
                            <p>Credit customer accounts with secure, instant database updates and clear operation confirmation.</p>
                            <p>Tip: Verify the account number first using the search feature for faster and more accurate transactions.</p>
                            <p>All deposit transactions are logged and tracked for complete audit trails and reconciliation.</p>
                        </div>
                    </aside>

                    <!-- Form Card -->
                    <div class="form-card">
                        <div class="form-header">
                            <p style="color: var(--primary); font-weight: 600; text-transform: uppercase; font-size: 0.875rem; margin: 0 0 12px;">Funding Desk</p>
                            <h1 class="form-title">Add Funds to Account</h1>
                            <p class="form-description">Enter account number and deposit amount to update balance instantly.</p>
                        </div>

                        <form class="bank-form" action="deposit" method="post">
                            <div class="form-group">
                                <label class="form-label" for="accNo">Account Number</label>
                                <input class="form-input" type="number" id="accNo" name="accNo" min="1" required placeholder="e.g., 1001">
                                <span class="form-help">The account to receive the deposit</span>
                            </div>

                            <div class="form-group">
                                <label class="form-label" for="amount">Deposit Amount</label>
                                <input class="form-input" type="number" id="amount" name="amount" step="0.01" min="0.01" required placeholder="e.g., 1000.00">
                                <span class="form-help">Amount to deposit (minimum 0.01)</span>
                            </div>

                            <div class="form-actions">
                                <button type="submit" class="btn btn-success btn-lg btn-block">Process Deposit</button>
                            </div>
                        </form>

                        <div class="inline-actions" style="margin-top: var(--space-xl); padding-top: var(--space-xl); border-top: 1px solid var(--border-color);">
                            <a class="btn-link" href="index.jsp">← Back to Dashboard</a>
                            <a class="btn-link" href="search-account">Search Account →</a>
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