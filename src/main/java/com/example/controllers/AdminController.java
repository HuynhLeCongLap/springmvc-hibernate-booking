package com.example.controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.transaction.annotation.Transactional;

import com.example.model.Booking;
import com.example.model.DecorationStyle;
import com.example.model.Room;
import com.example.model.TimeSlot;
import com.example.model.User;
import com.example.services.BookingService;
import com.example.services.DecorationStyleService;
import com.example.services.FileUploadService;
import com.example.services.RoomService;
import com.example.services.TimeSlotService;
import com.example.services.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final UserService userService;
    private final BookingService bookingService;
    private final RoomService roomService;
    private final TimeSlotService timeSlotService;
    private final DecorationStyleService decorationStyleService;

    @Autowired
    private FileUploadService fileUploadService;

    @Autowired
    public AdminController(UserService userService, BookingService bookingService,
                           RoomService roomService, TimeSlotService timeSlotService,
                           DecorationStyleService decorationStyleService) {
        this.userService = userService;
        this.bookingService = bookingService;
        this.roomService = roomService;
        this.timeSlotService = timeSlotService;
        this.decorationStyleService = decorationStyleService;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        // Date format for datetime-local (yyyy-MM-dd'T'HH:mm)
        SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        dateTimeFormat.setLenient(false);

        // Date format for date (yyyy-MM-dd)
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);

        // Use CustomDateEditor for multiple formats
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateTimeFormat, true) {
            @Override
            public void setAsText(String text) {
                if (text == null || text.isEmpty()) {
                    setValue(null);
                    return;
                }

                try {
                    // Try with datetime-local format
                    setValue(dateTimeFormat.parse(text));
                } catch (ParseException e1) {
                    try {
                        // Try with date format
                        setValue(dateFormat.parse(text));
                    } catch (ParseException e2) {
                        throw new IllegalArgumentException("Cannot convert date format: " + text);
                    }
                }
            }
        });
    }

    @GetMapping("/")
    public String adminDashboard(HttpSession session, Model model) {
        // Add statistics data for the UI
        Date today = new Date();
        List<Booking> todayBookings = bookingService.getBookingsByDateScheduled(today);
        List<Room> rooms = roomService.getAllRooms();
        List<TimeSlot> timeSlots = timeSlotService.getAllTimeSlots();
        List<DecorationStyle> decorationStyles = decorationStyleService.getAllDecorationStyles();

        model.addAttribute("bookingsToday", todayBookings.size());
        model.addAttribute("todayBookings", todayBookings);
        model.addAttribute("roomsCount", rooms.size());
        model.addAttribute("timeSlotsCount", timeSlots.size());
        model.addAttribute("stylesCount", decorationStyles.size());

        return "admin/index";
    }

    @GetMapping("/users")
    public String manageUsers(Model model) {
        List<User> users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/users";
    }

    @GetMapping("/reports")
    public String viewReports(
            @RequestParam(required = false) @DateTimeFormat(pattern="yyyy-MM-dd") Date startDate,
            @RequestParam(required = false) @DateTimeFormat(pattern="yyyy-MM-dd") Date endDate,
            Model model) {

        // Set default date range if not provided
        if (startDate == null) {
            Calendar cal = Calendar.getInstance();
            cal.add(Calendar.DAY_OF_MONTH, -30); // Default to 30 days ago
            startDate = cal.getTime();
        }

        if (endDate == null) {
            endDate = new Date(); // Default to current date
        }

        // Get all bookings in the date range
        List<Booking> bookings = bookingService.getBookingsByDateRange(startDate, endDate);

        // Calculate statistics
        long totalBookings = bookings.size();
        long confirmedBookings = bookings.stream()
                .filter(booking -> "CONFIRMED".equals(booking.getStatus()))
                .count();
        long pendingBookings = bookings.stream()
                .filter(booking -> "PENDING".equals(booking.getStatus()))
                .count();
        long cancelledBookings = bookings.stream()
                .filter(booking -> "CANCELLED_BY_ADMIN".equals(booking.getStatus()))
                .count();

        // Decoration style statistics
        List<DecorationStyle> styles = decorationStyleService.getAllDecorationStyles();
        model.addAttribute("decorationStyles", styles);

        // Add data to model
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        model.addAttribute("totalBookings", totalBookings);
        model.addAttribute("confirmedBookings", confirmedBookings);
        model.addAttribute("pendingBookings", pendingBookings);
        model.addAttribute("cancelledBookings", cancelledBookings);
        model.addAttribute("bookings", bookings);

        return "admin/reports";
    }

    @GetMapping("/bookings")
    public String manageBookings(
            @RequestParam(required = false) @DateTimeFormat(pattern="yyyy-MM-dd") Date date,
            @RequestParam(required = false) String status,
            @RequestParam(required = false) Long roomId,
            @RequestParam(required = false, defaultValue = "1") int page,
            @RequestParam(required = false, defaultValue = "10") int size,
            Model model) {

        List<Booking> bookings;

        // Apply filters if provided
        if (date != null) {
            bookings = bookingService.getBookingsByDateScheduled(date);
            if (status != null && !status.isEmpty()) {
                bookings = bookings.stream()
                        .filter(b -> status.equals(b.getStatus()))
                        .collect(Collectors.toList());
            }
            if (roomId != null) {
                bookings = bookings.stream()
                        .filter(b -> roomId.equals(b.getRoom().getId()))
                        .collect(Collectors.toList());
            }
        } else if (status != null && !status.isEmpty()) {
            bookings = bookingService.getBookingsByStatus(status);
            if (roomId != null) {
                bookings = bookings.stream()
                        .filter(b -> roomId.equals(b.getRoom().getId()))
                        .collect(Collectors.toList());
            }
        } else if (roomId != null) {
            Room room = roomService.getRoomById(roomId);
            bookings = bookingService.getBookingsByRoom(room);
        } else {
            bookings = bookingService.getAllBookings();
        }

        // Calculate pagination
        int totalItems = bookings.size();
        int totalPages = (int) Math.ceil((double) totalItems / size);

        // Adjust page if out of bounds
        if (page < 1) page = 1;
        if (page > totalPages && totalPages > 0) page = totalPages;

        // Get sublist for current page
        int fromIndex = (page - 1) * size;
        int toIndex = Math.min(fromIndex + size, totalItems);

        List<Booking> pagedBookings = fromIndex < toIndex
                ? bookings.subList(fromIndex, toIndex)
                : Collections.emptyList();

        // Add all necessary attributes to the model
        model.addAttribute("bookings", pagedBookings);
        model.addAttribute("rooms", roomService.getAllRooms());
        model.addAttribute("dateFilter", date);
        model.addAttribute("statusFilter", status);
        model.addAttribute("roomFilter", roomId);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);

        return "admin/bookings";
    }

    @GetMapping("/bookings/confirm/{id}")
    public String confirmBooking(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            bookingService.updateBookingStatus(id, "CONFIRMED");
            redirectAttributes.addFlashAttribute("successMessage", "Đơn đặt phòng đã được xác nhận thành công.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Không thể xác nhận đơn đặt phòng: " + e.getMessage());
        }
        return "redirect:/admin/bookings";
    }

    @GetMapping("/bookings/reject/{id}")
    public String rejectBooking(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            bookingService.updateBookingStatus(id, "CANCELLED_BY_ADMIN");
            redirectAttributes.addFlashAttribute("successMessage", "Đơn đặt phòng đã bị từ chối.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Không thể từ chối đơn đặt phòng: " + e.getMessage());
        }
        return "redirect:/admin/bookings";
    }

    @GetMapping("/rooms")
    public String manageRooms(Model model) {
        List<Room> rooms = roomService.getAllRooms();
        List<TimeSlot> timeSlots = timeSlotService.getAllTimeSlots();
        model.addAttribute("rooms", rooms);
        model.addAttribute("timeSlots", timeSlots);
        return "admin/rooms";
    }

    @PostMapping("/rooms/add")
    public String addRoom(
            @ModelAttribute Room room,
            @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
            RedirectAttributes redirectAttributes) {
        try {
            // Đặt giá trị mặc định cho imageUrl nếu chưa có
            if (room.getImageUrl() == null || room.getImageUrl().isEmpty()) {
                room.setImageUrl("/resources/images/default-room.jpg");
            }

            // Handle file upload if provided
            if (imageFile != null && !imageFile.isEmpty()) {
                String imageUrl = fileUploadService.uploadFile(imageFile, "rooms");
                room.setImageUrl(imageUrl);
            }

            roomService.saveRoom(room);
            redirectAttributes.addFlashAttribute("successMessage", "Phòng đã được thêm thành công.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Không thể thêm phòng: " + e.getMessage());
        }
        return "redirect:/admin/rooms";
    }

    @PostMapping("/rooms/update")
    public String updateRoom(
            @ModelAttribute Room room,
            @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
            RedirectAttributes redirectAttributes) {
        try {
            Room existingRoom = roomService.getRoomById(room.getId());
            if (existingRoom == null) {
                redirectAttributes.addFlashAttribute("errorMessage", "Không tìm thấy phòng với ID: " + room.getId());
                return "redirect:/admin/rooms";
            }

            // Update properties
            existingRoom.setRoomName(room.getRoomName());
            existingRoom.setDescription(room.getDescription());
            existingRoom.setCapacity(room.getCapacity());
            existingRoom.setPrice(room.getPrice());

            // Handle file upload if provided
            if (imageFile != null && !imageFile.isEmpty()) {
                String imageUrl = fileUploadService.uploadFile(imageFile, "rooms");
                existingRoom.setImageUrl(imageUrl);
            }

            roomService.saveRoom(existingRoom);
            redirectAttributes.addFlashAttribute("successMessage", "Phòng đã được cập nhật thành công.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Không thể cập nhật phòng: " + e.getMessage());
        }
        return "redirect:/admin/rooms";
    }

    @GetMapping("/rooms/delete/{id}")
    public String deleteRoom(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            // Check if room has bookings
            if (bookingService.hasBookingsForRoom(id)) {
                redirectAttributes.addFlashAttribute("errorMessage",
                        "Không thể xóa phòng vì có đơn đặt phòng liên quan. Hãy hủy các đơn đặt phòng trước.");
                return "redirect:/admin/rooms";
            }

            roomService.deleteRoom(id);
            redirectAttributes.addFlashAttribute("successMessage", "Phòng đã được xóa thành công.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Không thể xóa phòng: " + e.getMessage());
        }
        return "redirect:/admin/rooms";
    }

    @PostMapping("/rooms/assign-timeslots")
    public String assignRoomToTimeSlots(
            @RequestParam("timeSlotId") Long timeSlotId,
            @RequestParam(value = "roomIds", required = false) List<Long> roomIds,
            RedirectAttributes redirectAttributes) {
        try {
            TimeSlot timeSlot = timeSlotService.getTimeSlotById(timeSlotId);

            if (timeSlot == null) {
                redirectAttributes.addFlashAttribute("errorMessage", "Không tìm thấy khung giờ với ID: " + timeSlotId);
                return "redirect:/admin/rooms";
            }

            // Clear existing room assignments for this time slot
            timeSlotService.clearRoomAssignments(timeSlotId);

            // Add new room assignments if any rooms were selected
            if (roomIds != null && !roomIds.isEmpty()) {
                for (Long roomId : roomIds) {
                    Room room = roomService.getRoomById(roomId);
                    if (room != null) {
                        timeSlotService.assignRoomToTimeSlot(room, timeSlot);
                    }
                }
                redirectAttributes.addFlashAttribute("successMessage",
                        "Đã gán " + roomIds.size() + " phòng cho khung giờ " + timeSlot.getStartTime() + " - " + timeSlot.getEndTime());
            } else {
                redirectAttributes.addFlashAttribute("successMessage",
                        "Đã xóa tất cả các phòng khỏi khung giờ " + timeSlot.getStartTime() + " - " + timeSlot.getEndTime());
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Không thể gán phòng cho khung giờ: " + e.getMessage());
        }

        return "redirect:/admin/rooms";
    }

    @GetMapping("/timeslots")
    public String manageTimeSlots(Model model) {
        List<TimeSlot> timeSlots = timeSlotService.getAllTimeSlots();
        model.addAttribute("timeSlots", timeSlots);
        return "admin/timeslots";
    }

    @PostMapping("/timeslots/add")
    public String addTimeSlot(@ModelAttribute TimeSlot timeSlot, RedirectAttributes redirectAttributes) {
        try {
            // Validate time slot
            if (timeSlot.getStartTime() == null || timeSlot.getEndTime() == null) {
                redirectAttributes.addFlashAttribute("errorMessage", "Thời gian bắt đầu và kết thúc không được để trống.");
                return "redirect:/admin/timeslots";
            }

            // Check for overlapping time slots
            if (timeSlotService.hasOverlappingTimeSlots(timeSlot)) {
                redirectAttributes.addFlashAttribute("errorMessage", "Khung giờ này chồng chéo với khung giờ khác đã tồn tại.");
                return "redirect:/admin/timeslots";
            }

            timeSlotService.saveTimeSlot(timeSlot);
            redirectAttributes.addFlashAttribute("successMessage", "Khung giờ mới đã được thêm thành công.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Không thể thêm khung giờ: " + e.getMessage());
        }
        return "redirect:/admin/timeslots";
    }

    @PostMapping("/timeslots/update")
    public String updateTimeSlot(@ModelAttribute TimeSlot timeSlot, RedirectAttributes redirectAttributes) {
        try {
            TimeSlot existingTimeSlot = timeSlotService.getTimeSlotById(timeSlot.getId());
            if (existingTimeSlot == null) {
                redirectAttributes.addFlashAttribute("errorMessage", "Không tìm thấy khung giờ với ID: " + timeSlot.getId());
                return "redirect:/admin/timeslots";
            }

            // Update properties
            existingTimeSlot.setStartTime(timeSlot.getStartTime());
            existingTimeSlot.setEndTime(timeSlot.getEndTime());
            existingTimeSlot.setActive(timeSlot.isActive());

            // Check for overlapping time slots (excluding this one)
            if (timeSlotService.hasOverlappingTimeSlotsExcluding(existingTimeSlot, timeSlot.getId())) {
                redirectAttributes.addFlashAttribute("errorMessage", "Khung giờ này chồng chéo với khung giờ khác đã tồn tại.");
                return "redirect:/admin/timeslots";
            }

            timeSlotService.saveTimeSlot(existingTimeSlot);
            redirectAttributes.addFlashAttribute("successMessage", "Khung giờ đã được cập nhật thành công.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Không thể cập nhật khung giờ: " + e.getMessage());
        }
        return "redirect:/admin/timeslots";
    }

    @GetMapping("/timeslots/delete/{id}")
    public String deleteTimeSlot(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            // Check if time slot has bookings
            if (bookingService.hasBookingsForTimeSlot(id)) {
                redirectAttributes.addFlashAttribute("errorMessage",
                        "Không thể xóa khung giờ vì có đơn đặt phòng liên quan. Hãy hủy các đơn đặt phòng trước.");
                return "redirect:/admin/timeslots";
            }

            timeSlotService.deleteTimeSlot(id);
            redirectAttributes.addFlashAttribute("successMessage", "Khung giờ đã được xóa thành công.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Không thể xóa khung giờ: " + e.getMessage());
        }
        return "redirect:/admin/timeslots";
    }

    @GetMapping("/timeslots/toggle/{id}")
    public String toggleTimeSlotActive(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            TimeSlot timeSlot = timeSlotService.getTimeSlotById(id);
            if (timeSlot == null) {
                redirectAttributes.addFlashAttribute("errorMessage", "Không tìm thấy khung giờ với ID: " + id);
                return "redirect:/admin/timeslots";
            }

            timeSlot.setActive(!timeSlot.isActive());
            timeSlotService.saveTimeSlot(timeSlot);

            String status = timeSlot.isActive() ? "kích hoạt" : "vô hiệu hóa";
            redirectAttributes.addFlashAttribute("successMessage", "Khung giờ đã được " + status + " thành công.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Không thể thay đổi trạng thái khung giờ: " + e.getMessage());
        }
        return "redirect:/admin/timeslots";
    }

    @GetMapping("/decorations")
    public String showDecorations(Model model) {
        List<DecorationStyle> decorations = decorationStyleService.getAllDecorationStyles();
        model.addAttribute("decorations", decorations);
        return "admin/decorations";
    }

    @PostMapping("/decorations/add")
    public String addDecorationStyle(
            @ModelAttribute DecorationStyle decorationStyle,
            @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
            RedirectAttributes redirectAttributes) {
        try {
            // Đặt giá trị mặc định cho imageUrl nếu chưa có
            if (decorationStyle.getImageUrl() == null || decorationStyle.getImageUrl().isEmpty()) {
                decorationStyle.setImageUrl("/resources/images/default-decoration.jpg");
            }

            // Upload and set the image URL if a file is provided
            if (imageFile != null && !imageFile.isEmpty()) {
                String imageUrl = fileUploadService.uploadFile(imageFile, "decorations");
                decorationStyle.setImageUrl(imageUrl);
            }

            decorationStyleService.saveDecorationStyle(decorationStyle);
            redirectAttributes.addFlashAttribute("successMessage", "Phong cách trang trí mới đã được thêm thành công.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Không thể thêm phong cách trang trí: " + e.getMessage());
        }
        return "redirect:/admin/decorations";
    }

    @PostMapping("/decorations/update")
    public String updateDecorationStyle(
            @ModelAttribute DecorationStyle decorationStyle,
            @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
            RedirectAttributes redirectAttributes) {
        try {
            DecorationStyle existingStyle = decorationStyleService.getDecorationStyleById(decorationStyle.getId());
            if (existingStyle == null) {
                redirectAttributes.addFlashAttribute("errorMessage", "Không tìm thấy phong cách trang trí với ID: " + decorationStyle.getId());
                return "redirect:/admin/decorations";
            }

            // Update properties
            existingStyle.setName(decorationStyle.getName());
            existingStyle.setDescription(decorationStyle.getDescription());

            // Upload and set the image URL if a file is provided
            if (imageFile != null && !imageFile.isEmpty()) {
                String imageUrl = fileUploadService.uploadFile(imageFile, "decorations");
                existingStyle.setImageUrl(imageUrl);
            }

            decorationStyleService.saveDecorationStyle(existingStyle);
            redirectAttributes.addFlashAttribute("successMessage", "Phong cách trang trí đã được cập nhật thành công.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Không thể cập nhật phong cách trang trí: " + e.getMessage());
        }
        return "redirect:/admin/decorations";
    }

    @GetMapping("/decorations/delete/{id}")
    public String deleteDecorationStyle(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            // Check if decoration style has bookings
            if (bookingService.hasBookingsForDecorationStyle(id)) {
                redirectAttributes.addFlashAttribute("errorMessage",
                        "Không thể xóa phong cách trang trí vì có đơn đặt phòng liên quan. Hãy hủy các đơn đặt phòng trước.");
                return "redirect:/admin/decorations";
            }

            decorationStyleService.deleteDecorationStyle(id);
            redirectAttributes.addFlashAttribute("successMessage", "Phong cách trang trí đã được xóa thành công.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Không thể xóa phong cách trang trí: " + e.getMessage());
        }
        return "redirect:/admin/decorations";
    }

    @GetMapping("/create-booking")
    public String showCreateBookingForm(Model model) {
        model.addAttribute("users", userService.getAllUsers());
        model.addAttribute("rooms", roomService.getAllRooms());
        model.addAttribute("timeSlots", timeSlotService.getAllTimeSlots());
        model.addAttribute("decorationStyles", decorationStyleService.getAllDecorationStyles());
        model.addAttribute("now", java.time.LocalDate.now().toString());
        return "admin/create-booking";
    }

    @PostMapping("/create-booking")
    public String createBookingAdmin(
            @RequestParam Long userId,
            @RequestParam Long roomId,
            @RequestParam Long timeSlotId,
            @RequestParam Long decorationStyleId,
            @RequestParam String bookingDate,
            RedirectAttributes redirectAttributes) {
        User user = userService.getUserById(userId);
        Room room = roomService.getRoomById(roomId);
        TimeSlot timeSlot = timeSlotService.getTimeSlotById(timeSlotId);
        DecorationStyle decorationStyle = decorationStyleService.getDecorationStyleById(decorationStyleId);
        if (user == null || room == null || timeSlot == null || decorationStyle == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "Thông tin không hợp lệ. Vui lòng kiểm tra lại.");
            return "redirect:/admin/create-booking";
        }
        // Kiểm tra hợp lệ thời gian đặt phòng
        if (!bookingService.isValidBookingTime(timeSlot, bookingDate)) {
            redirectAttributes.addFlashAttribute("errorMessage", "Không thể đặt phòng cho thời gian trong quá khứ hoặc không hợp lệ.");
            return "redirect:/admin/create-booking";
        }
        // Kiểm tra phòng trống
        if (!bookingService.isRoomAvailable(room, timeSlot, bookingDate)) {
            redirectAttributes.addFlashAttribute("errorMessage", "Phòng đã có người đặt ở khung giờ này. Vui lòng chọn phòng hoặc khung giờ khác.");
            return "redirect:/admin/create-booking";
        }
        // Tạo booking
        Booking booking = bookingService.createBooking(user, room, timeSlot, decorationStyle, bookingDate);
        if (booking != null) {
            bookingService.updateBookingStatus(booking.getId(), "CONFIRMED");
            redirectAttributes.addFlashAttribute("successMessage", "Tạo đơn đặt phòng thành công!");
            return "redirect:/admin/bookings";
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "Đã xảy ra lỗi khi tạo đơn đặt phòng.");
            return "redirect:/admin/create-booking";
        }
    }
}