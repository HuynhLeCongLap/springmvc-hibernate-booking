package com.example.dao;

import java.util.Date;
import java.util.List;

import com.example.model.Booking;
import com.example.model.Room;
import com.example.model.TimeSlot;
import com.example.model.User;

public interface BookingDao {
    
    List<Booking> findAll();
    
    Booking findById(Long id);
    
    List<Booking> findByUser(User user);
    
    List<Booking> findByUserAndStatus(User user, String status);
    
    List<Booking> findByStatus(String status);
    
    List<Booking> findByRoom(Room room);
    
    List<Booking> findByRoomAndTimeSlotAndDate(Room room, TimeSlot timeSlot, Date bookingDate);
    
    void save(Booking booking);
    
    void delete(Long id);
} 