package com.example.controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.model.Room;
import com.example.model.TimeSlot;
import com.example.services.DecorationStyleService;
import com.example.services.RoomService;
import com.example.services.TimeSlotService;

@Controller
public class HomeController {

    private final RoomService roomService;
    private final TimeSlotService timeSlotService;
    private final DecorationStyleService decorationStyleService;
    
    @Autowired
    public HomeController(RoomService roomService, TimeSlotService timeSlotService, 
                          DecorationStyleService decorationStyleService) {
        this.roomService = roomService;
        this.timeSlotService = timeSlotService;
        this.decorationStyleService = decorationStyleService;
    }

    @GetMapping("/")
    public String homePage(
            @RequestParam(required = false) Long timeSlotId,
            @RequestParam(required = false) String bookingDate,
            Model model) {
        
        // Add current date for the date input min attribute
        model.addAttribute("now", java.time.LocalDate.now().toString());
        
        // Get all available time slots
        List<TimeSlot> timeSlots = timeSlotService.getAllActiveTimeSlots();
        model.addAttribute("timeSlots", timeSlots);
        
        // If search parameters are provided, perform search
        if (timeSlotId != null && bookingDate != null && !bookingDate.isEmpty()) {
            return performSearch(timeSlotId, bookingDate, model);
        }
        
        return "index";
    }

    @PostMapping("/")
    public String searchRooms(
            @RequestParam Long timeSlotId,
            @RequestParam String bookingDate,
            Model model) {
        
        return performSearch(timeSlotId, bookingDate, model);
    }
    
    private String performSearch(Long timeSlotId, String bookingDate, Model model) {
        model.addAttribute("timeSlotId", timeSlotId);
        model.addAttribute("bookingDate", bookingDate);
        
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            dateFormat.setLenient(false);
            Date parsedDate = dateFormat.parse(bookingDate);
            
            TimeSlot timeSlot = timeSlotService.getTimeSlotById(timeSlotId);
            
            if (timeSlot != null) {
                List<Room> availableRooms = roomService.getAvailableRooms(timeSlot, bookingDate);
                model.addAttribute("timeSlot", timeSlot);
                model.addAttribute("rooms", availableRooms);
                model.addAttribute("showResults", true);
            }
            
        } catch (ParseException e) {
            System.out.println("ParseException: " + e);
            model.addAttribute("dateError", "Invalid date format. Please use YYYY-MM-DD format.");
        }
        
        // Add current date for the date input min attribute
        model.addAttribute("now", java.time.LocalDate.now().toString());
        
        // Get all available time slots
        List<TimeSlot> timeSlots = timeSlotService.getAllActiveTimeSlots();
        model.addAttribute("timeSlots", timeSlots);
        
        return "index";
    }
    
    @GetMapping("/rooms")
    public String roomsList(Model model) {
        // Display all rooms
        List<Room> rooms = roomService.getAllRooms();
        model.addAttribute("rooms", rooms);
        
        return "rooms-list";
    }
    
    @GetMapping("/decoration-styles")
    public String decorationStyles(Model model) {
        // Display all decoration styles
        model.addAttribute("decorationStyles", decorationStyleService.getAllDecorationStyles());
        return "decoration-styles";
    }

    @GetMapping("/search")
    public String search() {
        return "search";
    }

    @GetMapping("/about")
    public String about() {
        return "about";
    }

    @GetMapping("/contact")
    public String contact() {
        return "contact";
    }
}