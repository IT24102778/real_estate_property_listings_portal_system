package org.example.controller;

import org.example.model.Property;
import org.example.model.User;
import org.example.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    // Dashboard
    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        model.addAttribute("totalUsers", adminService.getTotalUsers());
        model.addAttribute("totalProperties", adminService.getTotalProperties());
        model.addAttribute("pendingProperties", adminService.getPendingPropertiesCount());
        model.addAttribute("recentProperties", adminService.getRecentlyAddedProperties());
        model.addAttribute("recentUsers", adminService.getRecentlyRegisteredUsers());
        return "admin/dashboard";
    }

    // User Management
    @GetMapping("/users")
    public String users(Model model) {
        model.addAttribute("users", adminService.getAllUsers());
        return "admin/users";
    }

    @GetMapping("/users/{id}")
    public String userDetails(@PathVariable String id, Model model) {
        User user = adminService.getUserById(id);
        if (user == null) {
            return "redirect:/admin/users";
        }
        model.addAttribute("user", user);
        return "admin/user-details";
    }

    @PostMapping("/users")
    public String createUser(@RequestParam String username,
                             @RequestParam String email,
                             @RequestParam String password) {
        User user = new User(username, email, password);
        adminService.createUser(user);
        return "redirect:/admin/users";
    }

    @PostMapping("/users/{id}/update")
    public String updateUser(@PathVariable String id, @RequestParam String username, @RequestParam String email) {
        User existingUser = adminService.getUserById(id);
        if (existingUser != null) {
            existingUser.setUsername(username);
            existingUser.setEmail(email);
            adminService.updateUser(existingUser);
        }
        return "redirect:/admin/users/" + id;
    }

    @PostMapping("/users/{id}/delete")
    public String deleteUser(@PathVariable String id) {
        adminService.deleteUser(id);
        return "redirect:/admin/users";
    }

    @PostMapping("/users/{id}/deactivate")
    public String deactivateUser(@PathVariable String id) {
        adminService.deactivateUser(id);
        return "redirect:/admin/users/" + id;
    }

    // Property Management
    @GetMapping("/properties")
    public String properties(Model model) {
        model.addAttribute("properties", adminService.getAllProperties());
        model.addAttribute("users", adminService.getAllUsers());
        return "admin/properties";
    }

    @GetMapping("/properties/pending")
    public String pendingProperties(Model model) {
        model.addAttribute("properties", adminService.getPendingProperties());
        return "admin/pending-properties";
    }

    @GetMapping("/properties/{id}")
    public String propertyDetails(@PathVariable String id, Model model) {
        Property property = adminService.getPropertyById(id);
        if (property == null) {
            return "redirect:/admin/properties";
        }
        model.addAttribute("property", property);
        return "admin/property-details";
    }

    @PostMapping("/properties")
    public String createProperty(@RequestParam String title,
                                 @RequestParam String description,
                                 @RequestParam double price,
                                 @RequestParam String location,
                                 @RequestParam String ownerId) {
        User owner = adminService.getUserById(ownerId);
        if (owner == null) {
            return "redirect:/admin/properties";
        }
        Property property = new Property(title, description, price, location, owner);
        adminService.createProperty(property);
        return "redirect:/admin/properties";
    }

    @PostMapping("/properties/{id}/update")
    public String updateProperty(@PathVariable String id,
                                 @RequestParam String title,
                                 @RequestParam String description,
                                 @RequestParam double price,
                                 @RequestParam String location,
                                 @RequestParam String ownerId) {
        Property existingProperty = adminService.getPropertyById(id);
        if (existingProperty != null) {
            existingProperty.setTitle(title);
            existingProperty.setDescription(description);
            existingProperty.setPrice(price);
            existingProperty.setLocation(location);
            User newOwner = adminService.getUserById(ownerId);
            if (newOwner != null) {
                existingProperty.setOwner(newOwner);
            }
            adminService.updateProperty(existingProperty);
        }
        return "redirect:/admin/properties/" + id;
    }

    @PostMapping("/properties/{id}/approve")
    public String approveProperty(@PathVariable String id) {
        adminService.approveProperty(id);
        return "redirect:/admin/properties/" + id;
    }

    @PostMapping("/properties/{id}/reject")
    public String rejectProperty(@PathVariable String id) {
        adminService.rejectProperty(id);
        return "redirect:/admin/properties/" + id;
    }

    @PostMapping("/properties/{id}/delete")
    public String deleteProperty(@PathVariable String id) {
        adminService.deleteProperty(id);
        return "redirect:/admin/properties";
    }
}