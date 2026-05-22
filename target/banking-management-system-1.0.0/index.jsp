<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Atlas Banking Management System - Dashboard</title>
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
                <a href="index.jsp" class="active">Dashboard</a>
                <a href="create-account">Create Account</a>
                <a href="deposit">Deposit</a>
                <a href="withdraw">Withdraw</a>
                <a href="search-account">Search</a>
                <a href="accounts">All Accounts</a>
            </nav>
            <div class="navbar-footer">Online Banking</div>
        </div>
    </header>

    <!-- Main Page Content -->
    <div class="page-container">
        <!-- Hero Section -->
        <section class="hero-section">
            <div class="hero-content">
                <h1 class="hero-title">Clear, Fast Banking Operations</h1>
                <p class="hero-subtitle">Modern Banking Management System with Polished Interface</p>
                <p class="hero-description">
                    Create customer accounts, manage money transfers, and inspect account balances through a professional 
                    web-based interface backed by MySQL database, comprehensive validation, and a robust service layer.
                </p>
                <div class="hero-features">
                    <div class="feature-badge">
                        <div class="feature-badge-title">Platform</div>
                        <div class="feature-badge-text">Tomcat 9 + JSP</div>
                    </div>
                    <div class="feature-badge">
                        <div class="feature-badge-title">Database</div>
                        <div class="feature-badge-text">MySQL via JDBC</div>
                    </div>
                    <div class="feature-badge">
                        <div class="feature-badge-title">Architecture</div>
                        <div class="feature-badge-text">MVC + Service Layer</div>
                    </div>
                    <div class="feature-badge">
                        <div class="feature-badge-title">Security</div>
                        <div class="feature-badge-text">Validated Inputs</div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Main Content Area -->
        <div class="page-content">
            <div class="container">
                <!-- Quick Stats -->
                <section class="section">
                    <h2 class="section-title">System Overview</h2>
                    <p class="section-subtitle">Key features and capabilities of your banking system</p>
                    
                    <div class="dashboard-grid">
                        <div class="card">
                            <div class="card-header">
                                <div class="card-icon">📋</div>
                                <div class="card-category">Architecture</div>
                                <h3 class="card-title">6 Operational Modules</h3>
                            </div>
                            <p class="card-description">
                                Create accounts, deposit funds, withdraw money, search profiles, view all accounts, and manage transactions.
                            </p>
                        </div>

                        <div class="card">
                            <div class="card-header">
                                <div class="card-icon">🗄️</div>
                                <div class="card-category">Database</div>
                                <h3 class="card-title">MySQL over JDBC</h3>
                            </div>
                            <p class="card-description">
                                Secure, reliable database connectivity with proper connection management and transaction handling.
                            </p>
                        </div>

                        <div class="card">
                            <div class="card-header">
                                <div class="card-icon">🔐</div>
                                <div class="card-category">Validation</div>
                                <h3 class="card-title">Account & Amount Rules</h3>
                            </div>
                            <p class="card-description">
                                Comprehensive input validation for customer names, account numbers, and transaction amounts.
                            </p>
                        </div>

                        <div class="card">
                            <div class="card-header">
                                <div class="card-icon">💻</div>
                                <div class="card-category">Interface</div>
                                <h3 class="card-title">Modern Web UI</h3>
                            </div>
                            <p class="card-description">
                                Professional, responsive interface optimized for all devices with smooth interactions.
                            </p>
                        </div>

                        <div class="card">
                            <div class="card-header">
                                <div class="card-icon">⚡</div>
                                <div class="card-category">Performance</div>
                                <h3 class="card-title">Fast Operations</h3>
                            </div>
                            <p class="card-description">
                                Real-time transaction processing with immediate database updates and instant feedback.
                            </p>
                        </div>

                        <div class="card">
                            <div class="card-header">
                                <div class="card-icon">📊</div>
                                <div class="card-category">Features</div>
                                <h3 class="card-title">Full Account Analytics</h3>
                            </div>
                            <p class="card-description">
                                View all accounts in tabular format, search individual profiles, and track balance information.
                            </p>
                        </div>
                    </div>
                </section>

                <!-- Quick Actions -->
                <section class="section">
                    <h2 class="section-title">Quick Actions</h2>
                    <p class="section-subtitle">Access main operations directly from the dashboard</p>
                    
                    <div class="action-cards">
                        <a href="create-account" class="action-card">
                            <div class="action-card-icon">➕</div>
                            <div class="action-card-label">Onboarding</div>
                            <h3 class="action-card-title">Create Account</h3>
                            <p class="action-card-text">Register new customers with opening balance and comprehensive validation</p>
                        </a>

                        <a href="deposit" class="action-card">
                            <div class="action-card-icon">💰</div>
                            <div class="action-card-label">Funding</div>
                            <h3 class="action-card-title">Deposit Funds</h3>
                            <p class="action-card-text">Process secure deposits with real-time balance updates</p>
                        </a>

                        <a href="withdraw" class="action-card">
                            <div class="action-card-icon">🏦</div>
                            <div class="action-card-label">Debit</div>
                            <h3 class="action-card-title">Withdraw Money</h3>
                            <p class="action-card-text">Safely withdraw funds with balance validation and overdraft protection</p>
                        </a>

                        <a href="search-account" class="action-card">
                            <div class="action-card-icon">🔍</div>
                            <div class="action-card-label">Lookup</div>
                            <h3 class="action-card-title">Search Account</h3>
                            <p class="action-card-text">Find customer profiles and balance information instantly</p>
                        </a>

                        <a href="accounts" class="action-card">
                            <div class="action-card-icon">📈</div>
                            <div class="action-card-label">Analytics</div>
                            <h3 class="action-card-title">View All Accounts</h3>
                            <p class="action-card-text">See complete account information in organized tabular format</p>
                        </a>

                        <a href="createAccount.jsp" class="action-card">
                            <div class="action-card-icon">🚀</div>
                            <div class="action-card-label">Quick Start</div>
                            <h3 class="action-card-title">Direct Forms</h3>
                            <p class="action-card-text">Access standalone operation pages without navigation</p>
                        </a>
                    </div>
                </section>

                <!-- Information Section -->
                <section class="section mb-2xl">
                    <div class="alert alert-info">
                        <span class="alert-icon">ℹ️</span>
                        <div>
                            <div class="alert-title">Welcome to Atlas Banking System</div>
                            <div class="alert-message">
                                This modern banking management platform provides a comprehensive solution for customer account management, 
                                fund transfers, and transaction tracking. All operations are secured with validation and backed by a robust MySQL database.
                            </div>
                        </div>
                    </div>
                </section>
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

    <script>
        // Simple script to mark active nav link
        document.addEventListener('DOMContentLoaded', function() {
            const currentPath = window.location.pathname;
            document.querySelectorAll('.navbar-nav a').forEach(link => {
                if (link.getAttribute('href') === 'index.jsp' && currentPath.includes('index')) {
                    link.classList.add('active');
                }
            });
        });
    </script>
</body>
</html>