package org.example.model;

import java.time.LocalDateTime;

public class Admin extends User {
    private String role;
    private boolean canManageUsers;
    private boolean canManageProperties;
    private boolean canViewReports;
    private LocalDateTime lastLogin;

    public Admin(String username, String email, String password) {
        super(username, email, password);
        this.role = "ADMIN";
        this.canManageUsers = true;
        this.canManageProperties = true;
        this.canViewReports = true;
        this.lastLogin = LocalDateTime.now();
    }

    public Admin() {
        super();
    }

    // Getters and Setters
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public boolean isCanManageUsers() {
        return canManageUsers;
    }

    public void setCanManageUsers(boolean canManageUsers) {
        this.canManageUsers = canManageUsers;
    }

    public boolean isCanManageProperties() {
        return canManageProperties;
    }

    public void setCanManageProperties(boolean canManageProperties) {
        this.canManageProperties = canManageProperties;
    }

    public boolean isCanViewReports() {
        return canViewReports;
    }

    public void setCanViewReports(boolean canViewReports) {
        this.canViewReports = canViewReports;
    }

    public LocalDateTime getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(LocalDateTime lastLogin) {
        this.lastLogin = lastLogin;
    }
} 