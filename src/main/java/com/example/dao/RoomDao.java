package com.example.dao;

import java.util.List;

import com.example.model.Room;

public interface RoomDao {
    
    List<Room> findAll();
    
    Room findById(Long id);
    
    void save(Room room);
    
    void delete(Long id);
} 