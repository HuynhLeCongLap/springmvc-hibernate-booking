package com.example.services.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.dao.BookingDao;
import com.example.dao.RoomDao;
import com.example.model.Booking;
import com.example.model.Room;
import com.example.model.TimeSlot;
import com.example.services.RoomService;

@Service
@Transactional
public class RoomServiceImpl implements RoomService {
    
    private final RoomDao roomDao;
    private final BookingDao bookingDao;
    
    @Autowired
    public RoomServiceImpl(RoomDao roomDao, BookingDao bookingDao) {
        this.roomDao = roomDao;
        this.bookingDao = bookingDao;
    }

    @Override
    public List<Room> getAllRooms() {
        return roomDao.findAll();
    }

    @Override
    public Room getRoomById(Long id) {
        return roomDao.findById(id);
    }

    @Override
    public void saveRoom(Room room) {
        roomDao.save(room);
    }

    @Override
    public void deleteRoom(Long id) {
        roomDao.delete(id);
    }

    @Override
    public List<Room> getAvailableRooms(TimeSlot timeSlot, String bookingDateStr) {
        List<Room> allRooms = roomDao.findAll();
        List<Room> availableRooms = new ArrayList<>();
        
        // Parse the booking date
        Date bookingDate;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            bookingDate = dateFormat.parse(bookingDateStr);
        } catch (ParseException e) {
            // If date parsing fails, return empty list
            return availableRooms;
        }
        
        for (Room room : allRooms) {
            // Check if the room is already booked for this time slot and date
            List<Booking> bookings = bookingDao.findByRoomAndTimeSlotAndDate(room, timeSlot, bookingDate);
            if (bookings.isEmpty()) {
                // If no bookings found, the room is available
                availableRooms.add(room);
            }
        }
        
        return availableRooms;
    }
} 