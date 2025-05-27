package com.example.services;

import java.util.List;

import com.example.model.Room;
import com.example.model.TimeSlot;

public interface TimeSlotService {
    
    List<TimeSlot> getAllTimeSlots();
    
    List<TimeSlot> getAllActiveTimeSlots();
    
    TimeSlot getTimeSlotById(Long id);
    
    void saveTimeSlot(TimeSlot timeSlot);
    
    void deleteTimeSlot(Long id);
    
    void toggleTimeSlotActive(Long id);
    
    boolean hasOverlappingTimeSlots(TimeSlot timeSlot);
    
    boolean hasOverlappingTimeSlotsExcluding(TimeSlot timeSlot, Long excludeId);
    
    void assignRoomToTimeSlot(Room room, TimeSlot timeSlot);
    
    void clearRoomAssignments(Long timeSlotId);
    
    List<Room> getAvailableRoomsForTimeSlot(Long timeSlotId);
} 