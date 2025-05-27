package com.example.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dao.BookingDao;
import com.example.model.Booking;
import com.example.model.Room;
import com.example.model.TimeSlot;
import com.example.model.User;

@Repository
public class BookingDaoImpl implements BookingDao {
    
    private final SessionFactory sessionFactory;
    
    @Autowired
    public BookingDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public List<Booking> findAll() {
        return getCurrentSession().createQuery("FROM Booking", Booking.class).list();
    }

    @Override
    public Booking findById(Long id) {
        return getCurrentSession().get(Booking.class, id);
    }

    @Override
    public List<Booking> findByUser(User user) {
        Query<Booking> query = getCurrentSession().createQuery(
                "FROM Booking b WHERE b.user = :user ORDER BY b.bookingDate DESC", 
                Booking.class);
        query.setParameter("user", user);
        return query.list();
    }

    @Override
    public List<Booking> findByUserAndStatus(User user, String status) {
        Query<Booking> query = getCurrentSession().createQuery(
                "FROM Booking b WHERE b.user = :user AND b.status = :status ORDER BY b.bookingDate DESC", 
                Booking.class);
        query.setParameter("user", user);
        query.setParameter("status", status);
        return query.list();
    }

    @Override
    public List<Booking> findByStatus(String status) {
        Query<Booking> query = getCurrentSession().createQuery(
                "FROM Booking b WHERE b.status = :status ORDER BY b.bookingDate DESC", 
                Booking.class);
        query.setParameter("status", status);
        return query.list();
    }

    @Override
    public List<Booking> findByRoom(Room room) {
        Query<Booking> query = getCurrentSession().createQuery(
                "FROM Booking b WHERE b.room = :room ORDER BY b.bookingDate DESC", 
                Booking.class);
        query.setParameter("room", room);
        return query.list();
    }

    @Override
    public List<Booking> findByRoomAndTimeSlotAndDate(Room room, TimeSlot timeSlot, Date bookingDate) {
        Query<Booking> query = getCurrentSession().createQuery(
                "FROM Booking b WHERE b.room = :room AND b.timeSlot = :timeSlot AND DATE(b.bookingDateScheduled) = DATE(:bookingDate) " +
                "AND b.status != 'CANCELLED_BY_USER' AND b.status != 'CANCELLED_BY_ADMIN'", 
                Booking.class);
        query.setParameter("room", room);
        query.setParameter("timeSlot", timeSlot);
        query.setParameter("bookingDate", bookingDate);
        return query.list();
    }

    @Override
    public void save(Booking booking) {
        getCurrentSession().saveOrUpdate(booking);
    }

    @Override
    public void delete(Long id) {
        Booking booking = findById(id);
        if (booking != null) {
            getCurrentSession().delete(booking);
        }
    }
} 