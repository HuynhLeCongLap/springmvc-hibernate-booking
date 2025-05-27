package com.example.services.impl;

import com.example.dao.UserDAO;
import com.example.model.User;
import com.example.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    
    private final UserDAO userDAO;
    
    @Autowired
    public UserServiceImpl(UserDAO userDAO) {
        this.userDAO = userDAO;
    }
    
    @Override
    public User authenticate(String numberPhone, String password) {
        User user = userDAO.findByNumberPhone(numberPhone);
        if (user != null && verifyPassword(password, user.getPassword())) {
            return user;
        }
        return null;
    }
    
    @Override
    public boolean registerUser(User user) {
        // Check if phone number already exists
        if (userDAO.findByNumberPhone(user.getNumberPhone()) != null) {
            return false;
        }
        // Hash the password
        user.setPassword(hashPassword(user.getPassword()));
        
        // Default to USER role if not specified
        if (user.getRole() == null) {
            user.setRole(User.Role.USER);
        }
        
        return userDAO.save(user);
    }
    
    // Password hashing
    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(password.getBytes());
            StringBuilder hexString = new StringBuilder();
            
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    // Password verification
    private boolean verifyPassword(String inputPassword, String storedPassword) {
        return hashPassword(inputPassword).equals(storedPassword);
    }
    
    @Override
    public User getUserById(Long id) {
        return userDAO.findById(id);
    }
    
    @Override
    public List<User> getAllUsers() {
        return userDAO.findAll();
    }
    
    @Override
    public List<User> getUsersByRole(User.Role role) {
        return userDAO.findByRole(role);
    }
    
    @Override
    public boolean saveUser(User user) {
        if (user.getId() == null) {
            // For new users, hash the password
            user.setPassword(hashPassword(user.getPassword()));
            return userDAO.save(user);
        } else {
            // For existing users, check if password needs to be updated
            User existingUser = userDAO.findById(user.getId());
            
            // If password is empty, keep the old password
            if (user.getPassword() == null || user.getPassword().trim().isEmpty()) {
                user.setPassword(existingUser.getPassword());
            } else if (!user.getPassword().equals(existingUser.getPassword())) {
                // If password has changed, hash the new password
                user.setPassword(hashPassword(user.getPassword()));
            }
            
            return userDAO.update(user);
        }
    }
} 