package com.example.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "bookings")
public class Booking implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "booking_date", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date bookingDate;
    
    @Column(name = "booking_date_scheduled", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date bookingDateScheduled;
    
    @Column
    private String status = "PENDING"; // PENDING, CONFIRMED, CANCELLED
    
    @Column(name = "total_price", nullable = false)
    private Double totalPrice;
    
    @Column(name = "payment_info")
    private String paymentInfo;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "room_id")
    private Room room;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "time_slot_id")
    private TimeSlot timeSlot;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "decoration_style_id")
    private DecorationStyle decorationStyle;
    
    // Constructors
    public Booking() {}
    
    public Booking(Date bookingDate, Date bookingDateScheduled, String status, Double totalPrice, 
                  String paymentInfo, User user, Room room, TimeSlot timeSlot, DecorationStyle decorationStyle) {
        this.bookingDate = bookingDate;
        this.bookingDateScheduled = bookingDateScheduled;
        this.status = status;
        this.totalPrice = totalPrice;
        this.paymentInfo = paymentInfo;
        this.user = user;
        this.room = room;
        this.timeSlot = timeSlot;
        this.decorationStyle = decorationStyle;
    }
    
    // Getters and Setters
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public Date getBookingDate() {
        return bookingDate;
    }
    
    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }
    
    public Date getBookingDateScheduled() {
        return bookingDateScheduled;
    }
    
    public void setBookingDateScheduled(Date bookingDateScheduled) {
        this.bookingDateScheduled = bookingDateScheduled;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public Double getTotalPrice() {
        return totalPrice;
    }
    
    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }
    
    public String getPaymentInfo() {
        return paymentInfo;
    }
    
    public void setPaymentInfo(String paymentInfo) {
        this.paymentInfo = paymentInfo;
    }
    
    public User getUser() {
        return user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    
    public Room getRoom() {
        return room;
    }
    
    public void setRoom(Room room) {
        this.room = room;
    }
    
    public TimeSlot getTimeSlot() {
        return timeSlot;
    }
    
    public void setTimeSlot(TimeSlot timeSlot) {
        this.timeSlot = timeSlot;
    }
    
    public DecorationStyle getDecorationStyle() {
        return decorationStyle;
    }
    
    public void setDecorationStyle(DecorationStyle decorationStyle) {
        this.decorationStyle = decorationStyle;
    }
} 