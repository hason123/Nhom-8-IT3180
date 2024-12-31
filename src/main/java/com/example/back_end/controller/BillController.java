package com.example.back_end.controller;

import com.example.back_end.domain.Bill;
import com.example.back_end.domain.Fee;
import com.example.back_end.domain.PaymentMethod;
import com.example.back_end.domain.Room;
import com.example.back_end.repository.BillRepository;
import com.example.back_end.repository.FeeRepository;
import com.example.back_end.repository.PaymentMethodRepository;
import com.example.back_end.repository.RoomRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("/bills")
public class BillController {

    private final BillRepository billRepository;
    private final FeeRepository feeRepository;
    private final RoomRepository roomRepository;
    private final PaymentMethodRepository paymentMethodRepository;
    @Autowired
    public BillController(BillRepository billRepository, FeeRepository feeRepository, RoomRepository roomRepository, PaymentMethodRepository paymentMethodRepository) {
        this.billRepository = billRepository;
        this.feeRepository = feeRepository;
        this.roomRepository = roomRepository;
        this.paymentMethodRepository = paymentMethodRepository;
    }

    // Hiển thị danh sách các hóa đơn
    @GetMapping
    public String listBills(
            @RequestParam(value = "searchType", required = false) String searchType,
            @RequestParam(value = "keyword", required = false) String keyword,
            Model model) {

        List<Bill> bills;

        if (keyword != null && !keyword.trim().isEmpty() && !keyword.isEmpty()) {
            switch (searchType) {
                case "maCanHo":
                    bills = billRepository.findByMaCanHo(keyword.trim());
                    break;
                case "trangThai":
                    bills = billRepository.findByTrangThai(keyword.trim());
                    break;
                case "tieuDe":
                    bills = billRepository.findByTieuDe(keyword.trim());
                    break;
                case "kiThanhToan":
                    bills = billRepository.findBykiThanhToan(keyword.trim());
                    break;
                case "loaiThanhToan":
                    bills = billRepository.findByLoaiThanhToan(keyword.trim());
                    break;
                case "idCacKhoanPhi":
                    bills = billRepository.findByidCacKhoanPhi(keyword.trim());
                    break;
                default:
                    bills = (List<Bill>) billRepository.findAll();
                    break;
            }

        } else {
            bills = (List<Bill>) billRepository.findAll();
        }

        List<PaymentMethod> paymentMethods = (List<PaymentMethod>) paymentMethodRepository.findAll();

        // Ánh xạ tên phương thức thanh toán (loai) vào từng hóa đơn
        for (Bill bill : bills) {
            for (PaymentMethod method : paymentMethods) {
                if (bill.getIdThanhToan() == method.getIdThanhToan()) {
                    bill.setLoaiThanhToan(method.getLoai()); // Thêm thông tin tên loại thanh toán
                    break;
                }
            }
        }

        model.addAttribute("bills", bills);
        model.addAttribute("searchType", searchType);
        model.addAttribute("keyword", keyword);
        model.addAttribute("totalBills", bills.size());
        return "bill/list";
    }

    // Hiển thị form thêm hóa đơn mới
    @GetMapping("/add")
    public String showAddBillForm(Model model) {
        model.addAttribute("bill", new Bill());
        List<PaymentMethod> paymentMethods = (List<PaymentMethod>) paymentMethodRepository.findAll();
        model.addAttribute("paymentMethods", paymentMethods);
        List<Room> rooms = (List<Room>) roomRepository.findAll(); // Lấy danh sách phòng từ cơ sở dữ liệu
        model.addAttribute("rooms", rooms);
        List<Fee> list= (List<Fee>) feeRepository.findAll();
        List<Fee> fees = list.subList(4, list.size()); //cần thêm ngoại lệ ko cút
        model.addAttribute("fees", fees);
        return "bill/add"; // Chuyển đến form thêm hóa đơn
    }

    // Thêm hóa đơn mới
    @PostMapping("/add")
    public String addBill(@ModelAttribute("bill") Bill bill, Model model) {
        // Kiểm tra nếu mã hóa đơn đã tồn tại
        if (billRepository.existsById((long) bill.getIdHoaDon())) {
            model.addAttribute("error", "Mã hóa đơn đã tồn tại. Vui lòng nhập mã khác.");
            setModelAttributes(model);
            return "bill/add"; // Trả về form thêm với thông báo lỗi
        }

        // Lưu hóa đơn mới
        billRepository.save(bill);
        return "redirect:/bills"; // Chuyển hướng về danh sách hóa đơn
    }

    private void setModelAttributes(Model model) {
        List<PaymentMethod> paymentMethods = (List<PaymentMethod>) paymentMethodRepository.findAll();
        model.addAttribute("paymentMethods", paymentMethods);
        List<Room> rooms = (List<Room>) roomRepository.findAll();
        model.addAttribute("rooms", rooms);
        List<Fee> list= (List<Fee>) feeRepository.findAll();
        List<Fee> fees = list.subList(4, list.size()); //cần thêm ngoại lệ ko cút
        model.addAttribute("fees", fees);
    }


    // Hiển thị form chỉnh sửa hóa đơn
    @GetMapping("/edit/{id}")
    public String showEditBillForm(@PathVariable("id") Long id, Model model) {
        Optional<Bill> bill = billRepository.findById(id);
        List<PaymentMethod> paymentMethods = (List<PaymentMethod>) paymentMethodRepository.findAll();
        model.addAttribute("paymentMethods", paymentMethods);
        List<Room> rooms = (List<Room>) roomRepository.findAll(); // Lấy danh sách phòng từ cơ sở dữ liệu
        model.addAttribute("rooms", rooms);
        if (bill.isPresent()) {
            model.addAttribute("bill", bill.get());
            return "bill/edit"; // Chuyển đến form chỉnh sửa hóa đơn
        }
        return "redirect:/bills"; // Nếu không tìm thấy hóa đơn, chuyển hướng về trang danh sách
    }

    // Cập nhật hóa đơn
    @PostMapping("/edit")
    public String updateBill(@ModelAttribute("bill") Bill bill) {
        billRepository.save(bill); // Lưu hóa đơn đã chỉnh sửa
        return "redirect:/bills"; // Chuyển hướng về trang danh sách hóa đơn
    }

    // Xóa hóa đơn
    @GetMapping("/delete/{id}")
    public String deleteBill(@PathVariable("id") Long id) {
        billRepository.deleteById(id); // Xóa hóa đơn theo id
        return "redirect:/bills"; // Chuyển hướng về trang danh sách hóa đơn
    }

    @RequestMapping(value = "/calculate", method = RequestMethod.POST)
    @ResponseBody
    public double calculateAmount(@RequestBody Map<String, String> requestData) {
        int  feeIds = Integer.parseInt(requestData.get("feeIds"));
        Long idRoom = Long.parseLong(requestData.get("idRoom"));
        double amount=0;
        Fee fee= feeRepository.findByIdPhi(feeIds);
        List<Room> ls=roomRepository.findByIdRoom(String.valueOf(idRoom));
        Room room= ls.get(0);
        if(feeIds==1){
            amount=Double.parseDouble(fee.getMoTaPhi())*room.getDientich();
        }
        else if(feeIds==2){
            amount=Double.parseDouble(fee.getMoTaPhi())*room.getDientich();
        }
        else if(feeIds==3 || feeIds==4){
            int cnt1=0,cnt2=0;
            for(int i=0;i<room.getPhuongTien().size();i++){
                if(room.getPhuongTien().get(i).getLoaiXe().equals("Xe máy")) cnt1+=1;
                else if(room.getPhuongTien().get(i).getLoaiXe().equals("Ô tô")) cnt2+=1;
            }
            Fee feeXeMay = feeRepository.findByIdPhi(3); // Phí cho xe máy
            Fee feeOto = feeRepository.findByIdPhi(4); // Phí cho ô tô
            amount = cnt1 * Double.parseDouble(feeXeMay.getMoTaPhi()) + cnt2 * Double.parseDouble(feeOto.getMoTaPhi());
        }
        else {
            amount=Double.parseDouble(fee.getMoTaPhi());
        }
        return amount;
    }
}
