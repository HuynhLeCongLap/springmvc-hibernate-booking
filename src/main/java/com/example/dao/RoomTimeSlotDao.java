package com.example.dao;

import java.util.List;

import com.example.model.Room;
import com.example.model.RoomTimeSlot;
import com.example.model.TimeSlot;

public interface RoomTimeSlotDao {
    
    void save(RoomTimeSlot roomTimeSlot);
    
    void deleteByTimeSlotId(Long timeSlotId);
    
    void deleteByRoomId(Long roomId);
    
    List<Room> findRoomsByTimeSlotId(Long timeSlotId);
    
    List<TimeSlot> findTimeSlotsByRoomId(Long roomId);
    
    boolean existsByRoomAndTimeSlot(Room room, TimeSlot timeSlot);
} 