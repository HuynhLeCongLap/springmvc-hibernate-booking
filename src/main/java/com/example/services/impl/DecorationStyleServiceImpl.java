package com.example.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.dao.DecorationStyleDao;
import com.example.model.DecorationStyle;
import com.example.services.DecorationStyleService;

@Service
@Transactional
public class DecorationStyleServiceImpl implements DecorationStyleService {
    
    private final DecorationStyleDao decorationStyleDao;
    
    @Autowired
    public DecorationStyleServiceImpl(DecorationStyleDao decorationStyleDao) {
        this.decorationStyleDao = decorationStyleDao;
    }

    @Override
    public List<DecorationStyle> getAllDecorationStyles() {
        return decorationStyleDao.findAll();
    }

    @Override
    public DecorationStyle getDecorationStyleById(Long id) {
        return decorationStyleDao.findById(id);
    }

    @Override
    public void saveDecorationStyle(DecorationStyle decorationStyle) {
        decorationStyleDao.save(decorationStyle);
    }

    @Override
    public void deleteDecorationStyle(Long id) {
        decorationStyleDao.delete(id);
    }
} 