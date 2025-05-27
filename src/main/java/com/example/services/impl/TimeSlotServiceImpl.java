package com.example.services.impl;

import java.util.List;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.dao.TimeSlotDao;
import com.example.dao.RoomTimeSlotDao;
import com.example.dao.RoomDao;
import com.example.model.TimeSlot;
import com.example.model.Room;
import com.example.model.RoomTimeSlot;
import com.example.services.TimeSlotService;

@Service
@Transactional
public class TimeSlotServiceImpl implements TimeSlotService {
    
    private final TimeSlotDao timeSlotDao;
    private final RoomDao roomDao;
    private final RoomTimeSlotDao roomTimeSlotDao;
    
    @Autowired
    public TimeSlotServiceImpl(TimeSlotDao timeSlotDao, RoomDao roomDao, RoomTimeSlotDao roomTimeSlotDao) {
        this.timeSlotDao = timeSlotDao;
        this.roomDao = roomDao;
        this.roomTimeSlotDao = roomTimeSlotDao;
    }

    @Override
    public List<TimeSlot> getAllTimeSlots() {
        return timeSlotDao.findAll();
    }

    @Override
    public List<TimeSlot> getAllActiveTimeSlots() {
        return timeSlotDao.findAllActive();
    }

    @Override
    public TimeSlot getTimeSlotById(Long id) {
        return timeSlotDao.findById(id);
    }

    @Override
    public void saveTimeSlot(TimeSlot timeSlot) {
        timeSlotDao.save(timeSlot);
    }

    @Override
    public void deleteTimeSlot(Long id) {
        timeSlotDao.delete(id);
    }

    @Override
    public void toggleTimeSlotActive(Long id) {
        TimeSlot timeSlot = timeSlotDao.findById(id);
        if (timeSlot != null) {
            timeSlot.setActive(!timeSlot.isActive());
            timeSlotDao.save(timeSlot);
        }
    }
    
    @Override
    public boolean hasOverlappingTimeSlots(TimeSlot timeSlot) {
        List<TimeSlot> existingSlots = timeSlotDao.findAll();
        return existingSlots.stream()
            .anyMatch(slot -> slot.getId() != timeSlot.getId() && isOverlapping(slot, timeSlot));
    }
    
    @Override
    public boolean hasOverlappingTimeSlotsExcluding(TimeSlot timeSlot, Long excludeId) {
        List<TimeSlot> existingSlots = timeSlotDao.findAll();
        return existingSlots.stream()
            .filter(slot -> !slot.getId().equals(excludeId))
            .anyMatch(slot -> isOverlapping(slot, timeSlot));
    }
    
    private boolean isOverlapping(TimeSlot slot1, TimeSlot slot2) {
        // Simple string comparison assuming format like "10:00" for time
        String start1 = slot1.getStartTime();
        String end1 = slot1.getEndTime();
        String start2 = slot2.getStartTime();
        String end2 = slot2.getEndTime();
        
        return (start1.compareTo(start2) <= 0 && end1.compareTo(start2) > 0) ||
               (start1.compareTo(end2) < 0 && end1.compareTo(end2) >= 0) ||
               (start1.compareTo(start2) >= 0 && end1.compareTo(end2) <= 0);
    }
    
    @Override
    public void assignRoomToTimeSlot(Room room, TimeSlot timeSlot) {
        RoomTimeSlot roomTimeSlot = new RoomTimeSlot();
        roomTimeSlot.setRoom(room);
        roomTimeSlot.setTimeSlot(timeSlot);
        roomTimeSlotDao.save(roomTimeSlot);
    }
    
    @Override
    public void clearRoomAssignments(Long timeSlotId) {
        roomTimeSlotDao.deleteByTimeSlotId(timeSlotId);
    }
    
    @Override
    public List<Room> getAvailableRoomsForTimeSlot(Long timeSlotId) {
        List<Room> allRooms = roomDao.findAll();
        List<Room> assignedRooms = roomTimeSlotDao.findRoomsByTimeSlotId(timeSlotId);
        
        List<Room> availableRooms = new ArrayList<>(allRooms);
        availableRooms.removeAll(assignedRooms);
        
        return availableRooms;
    }
} 