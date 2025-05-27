package com.example.services.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.dao.BookingDao;
import com.example.model.Booking;
import com.example.model.DecorationStyle;
import com.example.model.Room;
import com.example.model.TimeSlot;
import com.example.model.User;
import com.example.services.BookingService;

@Service
@Transactional
public class BookingServiceImpl implements BookingService {
    
    private final BookingDao bookingDao;
    
    @Autowired
    public BookingServiceImpl(BookingDao bookingDao) {
        this.bookingDao = bookingDao;
    }

    @Override
    public List<Booking> getAllBookings() {
        return bookingDao.findAll();
    }

    @Override
    public Booking getBookingById(Long id) {
        return bookingDao.findById(id);
    }

    @Override
    public List<Booking> getBookingsByUser(User user) {
        return bookingDao.findByUser(user);
    }

    @Override
    public List<Booking> getBookingsByUserAndStatus(User user, String status) {
        return bookingDao.findByUserAndStatus(user, status);
    }

    @Override
    public List<Booking> getBookingsByStatus(String status) {
        return bookingDao.findByStatus(status);
    }
    
    @Override
    public List<Booking> getBookingsByDateScheduled(Date date) {
        // Get all bookings
        List<Booking> allBookings = bookingDao.findAll();
        
        // Filter bookings by scheduled date
        return allBookings.stream()
                .filter(booking -> isSameDay(booking.getBookingDateScheduled(), date))
                .collect(Collectors.toList());
    }
    
    @Override
    public List<Booking> getBookingsByDateRange(Date startDate, Date endDate) {
        // Get all bookings
        List<Booking> allBookings = bookingDao.findAll();
        
        // Filter bookings within date range
        return allBookings.stream()
                .filter(booking -> {
                    Date bookingDate = booking.getBookingDateScheduled();
                    return bookingDate != null && 
                           (bookingDate.equals(startDate) || bookingDate.after(startDate)) && 
                           (bookingDate.equals(endDate) || bookingDate.before(endDate));
                })
                .collect(Collectors.toList());
    }

    @Override
    public Booking createBooking(User user, Room room, TimeSlot timeSlot, DecorationStyle decorationStyle, String bookingDateStr) {
        // Check if the room is available
        if (!isRoomAvailable(room, timeSlot, bookingDateStr)) {
            return null;
        }
        
        // Parse the booking date
        Date bookingDateScheduled;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            bookingDateScheduled = dateFormat.parse(bookingDateStr);
        } catch (ParseException e) {
            return null;
        }
        
        // Calculate total price (using room price instead of decoration style price)
        Double totalPrice = room.getPrice();
        
        // Create new booking
        Booking booking = new Booking();
        booking.setUser(user);
        booking.setRoom(room);
        booking.setTimeSlot(timeSlot);
        booking.setDecorationStyle(decorationStyle);
        booking.setBookingDate(new Date()); // Current time
        booking.setBookingDateScheduled(bookingDateScheduled);
        booking.setStatus("PENDING");
        booking.setTotalPrice(totalPrice);
        
        // Save booking
        bookingDao.save(booking);
        
        return booking;
    }

    @Override
    public void updateBookingStatus(Long bookingId, String status) {
        Booking booking = bookingDao.findById(bookingId);
        if (booking != null) {
            booking.setStatus(status);
            bookingDao.save(booking);
        }
    }

    @Override
    public void updateBookingPaymentInfo(Long bookingId, String paymentInfo) {
        Booking booking = bookingDao.findById(bookingId);
        if (booking != null) {
            booking.setPaymentInfo(paymentInfo);
            bookingDao.save(booking);
        }
    }

    @Override
    public boolean isRoomAvailable(Room room, TimeSlot timeSlot, String bookingDateStr) {
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date bookingDate = dateFormat.parse(bookingDateStr);
            
            // Check if booking date is valid
            if (!isValidBookingTime(timeSlot, bookingDateStr)) {
                return false;
            }
            
            // Check if there are any bookings for this room, time slot, and date
            List<Booking> bookings = bookingDao.findByRoomAndTimeSlotAndDate(room, timeSlot, bookingDate);
            
            // If no bookings found or all bookings are cancelled, the room is available
            for (Booking booking : bookings) {
                if (!booking.getStatus().startsWith("CANCELLED")) {
                    return false;
                }
            }
            
            return true;
        } catch (ParseException e) {
            return false;
        }
    }

    @Override
    public boolean isValidBookingTime(TimeSlot timeSlot, String bookingDateStr) {
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date bookingDate = dateFormat.parse(bookingDateStr);
            
            // Get current date and time
            Calendar currentCalendar = Calendar.getInstance();
            Date currentDate = currentCalendar.getTime();
            
            // Set booking date calendar with the time from timeSlot
            Calendar bookingCalendar = Calendar.getInstance();
            bookingCalendar.setTime(bookingDate);
            
            // Parse the start time (assuming format like "09:00")
            String[] timeParts = timeSlot.getStartTime().split(":");
            int hour = Integer.parseInt(timeParts[0]);
            int minute = Integer.parseInt(timeParts[1]);
            
            bookingCalendar.set(Calendar.HOUR_OF_DAY, hour);
            bookingCalendar.set(Calendar.MINUTE, minute);
            
            // Compare dates
            if (bookingCalendar.getTime().before(currentDate)) {
                return false; // Booking time is in the past
            }
            
            return true;
        } catch (ParseException | NumberFormatException e) {
            return false;
        }
    }

    @Override
    public void deleteBooking(Long id) {
        bookingDao.delete(id);
    }
    
    @Override
    public List<Booking> getBookingsByRoom(Room room) {
        return bookingDao.findByRoom(room);
    }
    
    @Override
    public boolean hasBookingsForRoom(Long roomId) {
        List<Booking> bookings = bookingDao.findAll();
        return bookings.stream()
                .anyMatch(b -> b.getRoom().getId().equals(roomId) && 
                        !b.getStatus().startsWith("CANCELLED"));
    }
    
    @Override
    public boolean hasBookingsForTimeSlot(Long timeSlotId) {
        List<Booking> bookings = bookingDao.findAll();
        return bookings.stream()
                .anyMatch(b -> b.getTimeSlot().getId().equals(timeSlotId) && 
                        !b.getStatus().startsWith("CANCELLED"));
    }
    
    @Override
    public boolean hasBookingsForDecorationStyle(Long decorationStyleId) {
        List<Booking> bookings = bookingDao.findAll();
        return bookings.stream()
                .anyMatch(b -> b.getDecorationStyle().getId().equals(decorationStyleId) && 
                        !b.getStatus().startsWith("CANCELLED"));
    }
    
    // Helper method to check if two dates are the same day
    private boolean isSameDay(Date date1, Date date2) {
        if (date1 == null || date2 == null) {
            return false;
        }
        Calendar cal1 = Calendar.getInstance();
        cal1.setTime(date1);
        Calendar cal2 = Calendar.getInstance();
        cal2.setTime(date2);
        return cal1.get(Calendar.YEAR) == cal2.get(Calendar.YEAR) &&
                cal1.get(Calendar.MONTH) == cal2.get(Calendar.MONTH) &&
                cal1.get(Calendar.DAY_OF_MONTH) == cal2.get(Calendar.DAY_OF_MONTH);
    }
} 