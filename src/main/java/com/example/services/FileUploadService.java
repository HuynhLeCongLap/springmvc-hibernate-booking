package com.example.services;

import org.springframework.web.multipart.MultipartFile;

public interface FileUploadService {
    /**
     * Upload a file and return the URL to access it
     * 
     * @param file The file to upload
     * @param folder The folder to upload to (e.g., "rooms", "decorations")
     * @return The URL to access the uploaded file
     */
    String uploadFile(MultipartFile file, String folder);
} 