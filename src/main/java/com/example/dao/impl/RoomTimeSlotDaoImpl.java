package com.example.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dao.RoomTimeSlotDao;
import com.example.model.Room;
import com.example.model.RoomTimeSlot;
import com.example.model.TimeSlot;

@Repository
public class RoomTimeSlotDaoImpl implements RoomTimeSlotDao {
    
    private final SessionFactory sessionFactory;
    
    @Autowired
    public RoomTimeSlotDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }
    
    @Override
    public void save(RoomTimeSlot roomTimeSlot) {
        getCurrentSession().saveOrUpdate(roomTimeSlot);
    }
    
    @Override
    public void deleteByTimeSlotId(Long timeSlotId) {
        Query<?> query = getCurrentSession().createQuery("delete from RoomTimeSlot where timeSlot.id = :timeSlotId");
        query.setParameter("timeSlotId", timeSlotId);
        query.executeUpdate();
    }
    
    @Override
    public void deleteByRoomId(Long roomId) {
        Query<?> query = getCurrentSession().createQuery("delete from RoomTimeSlot where room.id = :roomId");
        query.setParameter("roomId", roomId);
        query.executeUpdate();
    }
    
    @Override
    public List<Room> findRoomsByTimeSlotId(Long timeSlotId) {
        Query<Room> query = getCurrentSession().createQuery(
                "select rts.room from RoomTimeSlot rts where rts.timeSlot.id = :timeSlotId", Room.class);
        query.setParameter("timeSlotId", timeSlotId);
        return query.getResultList();
    }
    
    @Override
    public List<TimeSlot> findTimeSlotsByRoomId(Long roomId) {
        Query<TimeSlot> query = getCurrentSession().createQuery(
                "select rts.timeSlot from RoomTimeSlot rts where rts.room.id = :roomId", TimeSlot.class);
        query.setParameter("roomId", roomId);
        return query.getResultList();
    }
    
    @Override
    public boolean existsByRoomAndTimeSlot(Room room, TimeSlot timeSlot) {
        Query<Long> query = getCurrentSession().createQuery(
                "select count(rts) from RoomTimeSlot rts where rts.room.id = :roomId and rts.timeSlot.id = :timeSlotId",
                Long.class);
        query.setParameter("roomId", room.getId());
        query.setParameter("timeSlotId", timeSlot.getId());
        return query.uniqueResult() > 0;
    }
} 