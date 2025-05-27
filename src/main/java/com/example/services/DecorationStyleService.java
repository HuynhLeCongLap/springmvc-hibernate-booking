package com.example.services;

import java.util.List;

import com.example.model.DecorationStyle;

public interface DecorationStyleService {
    
    List<DecorationStyle> getAllDecorationStyles();
    
    DecorationStyle getDecorationStyleById(Long id);
    
    void saveDecorationStyle(DecorationStyle decorationStyle);
    
    void deleteDecorationStyle(Long id);
} 