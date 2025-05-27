// src/main/java/com/example/service/UserService.java
package com.example.services;

import com.example.model.User;

import java.util.List;

public interface UserService {
    
    // Authentication
    User authenticate(String numberPhone, String password);
    
    // Registration
    boolean registerUser(User user);
    
    // User retrieval
    User getUserById(Long id);
    List<User> getAllUsers();
    List<User> getUsersByRole(User.Role role);
    
    // User update
    boolean saveUser(User user);
}