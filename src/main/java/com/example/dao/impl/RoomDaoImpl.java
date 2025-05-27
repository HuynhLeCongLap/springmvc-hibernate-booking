package com.example.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dao.RoomDao;
import com.example.model.Room;

@Repository
public class RoomDaoImpl implements RoomDao {
    
    private final SessionFactory sessionFactory;
    
    @Autowired
    public RoomDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public List<Room> findAll() {
        return getCurrentSession().createQuery("FROM Room", Room.class).list();
    }

    @Override
    public Room findById(Long id) {
        return getCurrentSession().get(Room.class, id);
    }

    @Override
    public void save(Room room) {
        getCurrentSession().saveOrUpdate(room);
    }

    @Override
    public void delete(Long id) {
        Room room = findById(id);
        if (room != null) {
            getCurrentSession().delete(room);
        }
    }
} 