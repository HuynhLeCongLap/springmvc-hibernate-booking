package com.example.services;

import java.util.List;

import com.example.model.Room;
import com.example.model.TimeSlot;

public interface RoomService {
    
    List<Room> getAllRooms();
    
    Room getRoomById(Long id);
    
    void saveRoom(Room room);
    
    void deleteRoom(Long id);
    
    List<Room> getAvailableRooms(TimeSlot timeSlot, String bookingDate);
} 