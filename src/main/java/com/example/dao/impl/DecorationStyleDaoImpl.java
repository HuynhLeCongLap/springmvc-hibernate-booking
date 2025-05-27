package com.example.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dao.DecorationStyleDao;
import com.example.model.DecorationStyle;

@Repository
public class DecorationStyleDaoImpl implements DecorationStyleDao {
    
    private final SessionFactory sessionFactory;
    
    @Autowired
    public DecorationStyleDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public List<DecorationStyle> findAll() {
        return getCurrentSession().createQuery("FROM DecorationStyle", DecorationStyle.class).list();
    }

    @Override
    public DecorationStyle findById(Long id) {
        return getCurrentSession().get(DecorationStyle.class, id);
    }

    @Override
    public void save(DecorationStyle decorationStyle) {
        getCurrentSession().saveOrUpdate(decorationStyle);
    }

    @Override
    public void delete(Long id) {
        DecorationStyle decorationStyle = findById(id);
        if (decorationStyle != null) {
            getCurrentSession().delete(decorationStyle);
        }
    }
} 