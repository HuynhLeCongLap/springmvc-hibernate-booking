package com.example.dao;

import java.util.List;

import com.example.model.DecorationStyle;

public interface DecorationStyleDao {
    
    List<DecorationStyle> findAll();
    
    DecorationStyle findById(Long id);
    
    void save(DecorationStyle decorationStyle);
    
    void delete(Long id);
} 