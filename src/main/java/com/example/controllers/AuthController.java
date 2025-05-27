// src/main/java/com/example/controller/AuthController.java
package com.example.controllers;

import com.example.model.User;
import com.example.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
public class AuthController {
    
    private final UserService userService;
    
    @Autowired
    public AuthController(UserService userService) {
        this.userService = userService;
    }
    
    @GetMapping("/login")
    public String loginPage(@RequestParam(required = false) String redirectUrl, Model model, HttpSession session) {
        // Check if user is already logged in
        if (session.getAttribute("user") != null) {
            return "redirect:/";
        }
        model.addAttribute("redirectUrl", redirectUrl);
        return "auth/login";
    }
    
    @PostMapping("/login")
    public String login(
            @RequestParam String numberPhone,
            @RequestParam String password,
            @RequestParam(required = false) String redirectUrl,
            HttpSession session,
            RedirectAttributes redirectAttributes) {
        
        User user = userService.authenticate(numberPhone, password);
        
        if (user == null) {
            redirectAttributes.addFlashAttribute("error", "Số điện thoại hoặc mật khẩu không chính xác");
            return "redirect:/login";
        }
        
        session.setAttribute("user", user);
        
        // Redirect based on role
        if (redirectUrl != null && !redirectUrl.isEmpty()) {
            return "redirect:" + redirectUrl;
        } else {
            switch (user.getRole()) {
                case ADMIN:
                    return "redirect:/admin/";
                case USER:
                    return "redirect:/user/bookings";
                default:
                    return "redirect:/";
            }
        }
    }
    
    @GetMapping("/register")
    public String registerPage(Model model, HttpSession session) {
        // Check if user is already logged in
        if (session.getAttribute("user") != null) {
            return "redirect:/";
        }
        model.addAttribute("user", new User());
        return "auth/register";
    }
    
    @PostMapping("/register")
    public String register(
            @RequestParam String numberPhone,
            @RequestParam String password,
            @RequestParam String confirmPassword,
            @RequestParam String fullName,
            RedirectAttributes redirectAttributes) {
        
        if (!password.equals(confirmPassword)) {
            redirectAttributes.addFlashAttribute("error", "Mật khẩu không khớp");
            return "redirect:/register";
        }
        
        User user = new User();
        user.setNumberPhone(numberPhone);
        user.setPassword(password);
        user.setFullName(fullName);
        user.setRole(User.Role.USER); 
        
        boolean success = userService.registerUser(user);
        
        if (!success) {
            redirectAttributes.addFlashAttribute("error", "Số điện thoại đã tồn tại");
            return "redirect:/register";
        }
        
        redirectAttributes.addFlashAttribute("success", "Đăng ký thành công! Vui lòng đăng nhập");
        return "redirect:/login";
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
    
    @GetMapping("/access-denied")
    public String accessDenied() {
        return "access-denied";
    }
}