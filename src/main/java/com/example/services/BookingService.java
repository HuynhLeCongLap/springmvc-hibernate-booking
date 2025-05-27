package com.example.services;

import java.util.Date;
import java.util.List;

import com.example.model.Booking;
import com.example.model.DecorationStyle;
import com.example.model.Room;
import com.example.model.TimeSlot;
import com.example.model.User;

public interface BookingService {
    
    List<Booking> getAllBookings();
    
    Booking getBookingById(Long id);
    
    List<Booking> getBookingsByUser(User user);
    
    List<Booking> getBookingsByUserAndStatus(User user, String status);
    
    List<Booking> getBookingsByStatus(String status);
    
    List<Booking> getBookingsByDateScheduled(Date date);
    
    List<Booking> getBookingsByDateRange(Date startDate, Date endDate);
    
    List<Booking> getBookingsByRoom(Room room);
    
    boolean hasBookingsForRoom(Long roomId);
    
    boolean hasBookingsForTimeSlot(Long timeSlotId);
    
    boolean hasBookingsForDecorationStyle(Long decorationStyleId);
    
    Booking createBooking(User user, Room room, TimeSlot timeSlot, DecorationStyle decorationStyle, String bookingDate);
    
    void updateBookingStatus(Long bookingId, String status);
    
    void updateBookingPaymentInfo(Long bookingId, String paymentInfo);
    
    boolean isRoomAvailable(Room room, TimeSlot timeSlot, String bookingDate);
    
    boolean isValidBookingTime(TimeSlot timeSlot, String bookingDateStr);
    
    void deleteBooking(Long id);
} 