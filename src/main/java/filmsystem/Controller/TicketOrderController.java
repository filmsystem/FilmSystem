package filmsystem.Controller;

import filmsystem.Tools.IDGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import filmsystem.Service.Impi.BookingRecordServiceImpl;
import filmsystem.Service.Impi.TicketOrderServiceImpl;
import filmsystem.Model.BookingRecord;
import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/api")
public class TicketOrderController {
    @Autowired
    TicketOrderServiceImpl ticketOrderService;

    @Autowired
    BookingRecordServiceImpl bookingRecordService;

    @RequestMapping(value = "/ticket/createOrder", method = RequestMethod.POST)
    public String createBookingRecord(@RequestParam("userId") Integer userId,
                                      @RequestParam("showId") Integer showId,
                                      @RequestParam("row") Integer row,
                                      @RequestParam("col") Integer col,
                                      Model model, HttpSession session){
        // log.info("cinemaId = " + cinemaId + ", officeId = " + officeId + ", row = " + row + ", col = " + col);
        try{
            BookingRecord record = new BookingRecord();
            long id = IDGenerator.createID();
            record.setId(id);
            record.setUserId(userId);
            record.setShowId(showId);
            record.setRowNum(row);
            record.setCol(col);
            if(ticketOrderService.createOrder(record)){
                session.setAttribute("currentOrderId", id);
                return "SUCCESS";
            }
            return "FAIL";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }
    }

    @RequestMapping(value = "/ticket/payOrder/{id}", method = RequestMethod.PUT)
    public String payOrder(@PathVariable Long id, Model model, HttpSession session){
        /**
         * @return: collect string or null
         */
        try{
            BookingRecord record = bookingRecordService.findOrderById(id);
            if(record != null){
                if(ticketOrderService.payOrder(record)){
                    String result = ticketOrderService.getCollectString(record);
                    session.setAttribute("collectString", result);
                    return "SUCCESS";
                }
                return "FAIL";
            }
            return "NOT_FOUND";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }
    }

    @RequestMapping(value = "/ticket/collectString/{id}", method = RequestMethod.GET)
    public String getCollectString(@PathVariable Long id, Model model, HttpSession session){
        /**
         * @return: collect string or null
         */
        try{
            BookingRecord record = bookingRecordService.findOrderById(id);
            if(record != null){
                session.setAttribute("collectString", record.getCollectingString());
                return "SUCCESS";
            }
            return "NOT_FOUND";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }

    }

    @RequestMapping(value = "/ticket/cancelOrder/{id}", method = RequestMethod.PUT)
    public String cancelOrder(@PathVariable Long id){
        try{
            BookingRecord record = bookingRecordService.findOrderById(id);
            if(record != null){
                return ticketOrderService.cancelOrder(record) ? "SUCCESS" : "FAIL";
            }
            return "NOT_FOUND";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }

    }
}
