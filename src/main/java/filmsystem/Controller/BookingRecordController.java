package filmsystem.Controller;

import filmsystem.Model.BookingRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import filmsystem.Service.Impi.BookingRecordServiceImpl;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;

@RestController
@RequestMapping("/api")
public class BookingRecordController {
    //public static Logger log = LoggerFactory.getLogger(FilmShowController.class);
    @Autowired
    BookingRecordServiceImpl bookingRecordService;

    @RequestMapping(value = "/bookingrecord/{id}", method = RequestMethod.GET)
    public String getBookingRecord(@PathVariable Integer id, Model model, HttpSession session){
        try{
            BookingRecord record = bookingRecordService.findOrderById(id);
            if(record != null){
                session.setAttribute("bookingRecordFound", record);
                session.setAttribute("bookingRecordMap", bookingRecordService.getRelatedInfo(record));
                return "SUCCESS";
            }
            return "NOT_FOUND";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }
    }

    @RequestMapping(value = "/bookingrecord", method = RequestMethod.GET)
    public String getBookingRecord(@RequestParam(value = "userId", defaultValue = "0") Integer userId,
                                   @RequestParam(value = "showId", defaultValue = "0") Integer showId,
                                   Model model, HttpSession session){
        try{
            ArrayList<BookingRecord> list;
            if(userId != 0){
                list = bookingRecordService.findOrderByUserId(userId);
            }
            else{
                list = bookingRecordService.findOrderByShowId(showId);
            }


            ArrayList<HashMap<String, Object>> mapList = new ArrayList<>();
            for(int i = 0; i < list.size(); i++){
                mapList.add(bookingRecordService.getRelatedInfo(list.get(i)));
            }
            session.setAttribute("bookingRecordList", list);
            session.setAttribute("bookingRecordMapList", mapList);
            return "SUCCESS";
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

    @RequestMapping(value = "/bookingrecord/{id}", method = RequestMethod.DELETE)
    public String deleteBookingRecord(@PathVariable Integer id){
        try{
            return bookingRecordService.deleteOrder(id) ? "SUCCESS" : "NOT_FOUND";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }
    }
}
