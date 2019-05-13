package filmsystem.Controller;

import filmsystem.Model.BookingRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


import filmsystem.Service.Impi.BookingRecordServiceImpl;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/api")
public class BookingRecordController {
    //public static Logger log = LoggerFactory.getLogger(FilmShowController.class);
    @Autowired
    BookingRecordServiceImpl bookingRecordService;

    @RequestMapping(value = "/bookingrecord", method = RequestMethod.GET)
    public String getBookingRecord(@RequestParam("id") Integer id, Model model, HttpSession session){
        try{
            BookingRecord record = bookingRecordService.findOrderById(id);
            if(record != null){
                session.setAttribute("bookingRecordFound", record);
                return "SUCCESS";
            }
            return "NOT_FOUND";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }
    }

//    @RequestMapping(value = "/bookingrecord", method = RequestMethod.PUT)
//    public boolean updateBookingRecord(@RequestParam("id") Integer id,
//                                       @RequestParam(value = "status", defaultValue ="-1") Integer status){
//        // update booking record by id in database
//        return true;
//    }

    @RequestMapping(value = "/bookingrecord", method = RequestMethod.DELETE)
    public String deleteBookingRecord(@RequestParam("id") Integer id){
        try{
            return bookingRecordService.deleteOrder(id) ? "SUCCESS" : "NOT_FOUND";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }
    }
}
