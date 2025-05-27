package com.example.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dao.TimeSlotDao;
import com.example.model.TimeSlot;

@Repository
public class TimeSlotDaoImpl implements TimeSlotDao {
    
    private final SessionFactory sessionFactory;
    
    @Autowired
    public TimeSlotDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public List<TimeSlot> findAll() {
        return getCurrentSession().createQuery("FROM TimeSlot", TimeSlot.class).list();
    }

    @Override
    public List<TimeSlot> findAllActive() {
        return getCurrentSession()
                .createQuery("FROM TimeSlot t WHERE t.isActive = true", TimeSlot.class)
                .list();
    }

    @Override
    public TimeSlot findById(Long id) {
        return getCurrentSession().get(TimeSlot.class, id);
    }

    @Override
    public void save(TimeSlot timeSlot) {
        getCurrentSession().saveOrUpdate(timeSlot);
    }

    @Override
    public void delete(Long id) {
        TimeSlot timeSlot = findById(id);
        if (timeSlot != null) {
            getCurrentSession().delete(timeSlot);
        }
    }
} 