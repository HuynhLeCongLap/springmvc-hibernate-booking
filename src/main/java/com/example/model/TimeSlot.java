package com.example.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "time_slots")
public class TimeSlot implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "start_time", nullable = false)
    private String startTime;
    
    @Column(name = "end_time", nullable = false)
    private String endTime;
    
    @Column
    private String description;
    
    @Column(name = "is_active")
    private boolean isActive = true;
    
    // Constructors
    public TimeSlot() {}
    
    public TimeSlot(String startTime, String endTime, String description, boolean isActive) {
        this.startTime = startTime;
        this.endTime = endTime;
        this.description = description;
        this.isActive = isActive;
    }
    
    // Getters and Setters
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public String getStartTime() {
        return startTime;
    }
    
    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }
    
    public String getEndTime() {
        return endTime;
    }
    
    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public boolean isActive() {
        return isActive;
    }
    
    public void setActive(boolean active) {
        isActive = active;
    }
    
    @Override
    public String toString() {
        return startTime + " - " + endTime + (description != null ? " (" + description + ")" : "");
    }
}
