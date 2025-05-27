package com.example.dao;

import java.util.List;

import com.example.model.TimeSlot;

public interface TimeSlotDao {
    
    List<TimeSlot> findAll();
    
    List<TimeSlot> findAllActive();
    
    TimeSlot findById(Long id);
    
    void save(TimeSlot timeSlot);
    
    void delete(Long id);
} 