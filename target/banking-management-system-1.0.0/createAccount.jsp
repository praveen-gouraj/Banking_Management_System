<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account - Atlas Banking System</title>
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
                <a href="create-account" class="active">Create Account</a>
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
                    <!-- Form Sidebar -->
                    <aside class="form-sidebar">
                        <div class="form-info-card">
                            <h2>Customer Registration</h2>
                            <p>Create a new customer account with strict validation and safe defaults for reliable account management.</p>
                            <p>Tip: Set an opening balance to enable immediate deposit and withdrawal operations for this account.</p>
                            <p>All account data is securely stored in our MySQL database with comprehensive validation checks.</p>
                        </div>
                    </aside>

                    <!-- Form Card -->
                    <div class="form-card">
                        <div class="form-header">
                            <p style="color: var(--primary); font-weight: 600; text-transform: uppercase; font-size: 0.875rem; margin: 0 0 12px;">Onboarding Desk</p>
                            <h1 class="form-title">Create New Account</h1>
                            <p class="form-description">Register a verified customer account with identity name and opening balance.</p>
                        </div>

                        <form class="bank-form" action="create-account" method="post">
                            <div class="form-group">
                                <label class="form-label" for="accNo">Account Number</label>
                                <input class="form-input" type="number" id="accNo" name="accNo" min="1" required placeholder="e.g., 1001">
                                <span class="form-help">Unique identifier for the account</span>
                            </div>

                            <div class="form-group">
                                <label class="form-label" for="name">Customer Name</label>
                                <input class="form-input" type="text" id="name" name="name" maxlength="50" required placeholder="e.g., John Smith">
                                <span class="form-help">Full name of the customer (max 50 characters)</span>
                            </div>

                            <div class="form-group">
                                <label class="form-label" for="balance">Opening Balance</label>
                                <input class="form-input" type="number" id="balance" name="balance" step="0.01" min="0.01" required placeholder="e.g., 5000.00">
                                <span class="form-help">Initial account balance (minimum 0.01)</span>
                            </div>

                            <div class="form-actions">
                                <button type="submit" class="btn btn-primary btn-lg btn-block">Create Account</button>
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