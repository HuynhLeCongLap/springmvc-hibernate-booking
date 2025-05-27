package com.example.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "rooms")
public class Room implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "room_name", nullable = false)
    private String roomName;
    
    @Column
    private String description;
    
    @Column(nullable = false)
    private int capacity;
    
    @Column(nullable = false)
    private double price;
    
    @Column(name = "image_url")
    private String imageUrl;
    
    // Constructors
    public Room() {}
    
    public Room(String roomName, String description, int capacity, double price, String imageUrl) {
        this.roomName = roomName;
        this.description = description;
        this.capacity = capacity;
        this.price = price;
        this.imageUrl = imageUrl;
    }
    
    // Getters and Setters
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public String getRoomName() {
        return roomName;
    }
    
    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public int getCapacity() {
        return capacity;
    }
    
    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }
    
    public double getPrice() {
        return price;
    }
    
    public void setPrice(double price) {
        this.price = price;
    }
    
    public String getImageUrl() {
        return imageUrl;
    }
    
    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
} 