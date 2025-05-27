package com.example.config;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class AppInitializer implements ServletContextListener {
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();
        
        // Create uploads directory if it doesn't exist
        String uploadsDir = context.getRealPath("/uploads");
        File uploadsDirFile = new File(uploadsDir);
        if (!uploadsDirFile.exists()) {
            uploadsDirFile.mkdirs();
        }
        
        // Create subdirectories
        new File(uploadsDir + "/rooms").mkdirs();
        new File(uploadsDir + "/decorations").mkdirs();
        
        System.out.println("Application initialized. Uploads directory: " + uploadsDir);
    }
    
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Cleanup if needed
    }
} 