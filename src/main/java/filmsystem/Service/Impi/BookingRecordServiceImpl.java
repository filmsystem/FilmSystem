package filmsystem.Service.Impi;

import filmsystem.DAO.BookingRecordDAO;
import filmsystem.Model.BookingRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import filmsystem.Service.IBookingRecordService;

import java.util.ArrayList;
import java.util.HashMap;

@Service("bookingRecordService")
public class BookingRecordServiceImpl implements IBookingRecordService{
    @Autowired
    FilmShowServiceImpl filmShowService;

    private BookingRecordDAO bookingRecordDAO = new BookingRecordDAO();
    public ArrayList<BookingRecord> findOrderByUserId(int userId){
        return bookingRecordDAO.selectRecordByUserId(userId);
    }

    @Override
    public ArrayList<BookingRecord> findOrderByShowId(int showId) {
        return bookingRecordDAO.selectRecordByShowId(showId);
    }

    public BookingRecord findOrderById(int id){
        return bookingRecordDAO.selectRecordById(id);
    }

    public boolean deleteOrder(int id){
        return bookingRecordDAO.deleteRecord(id);
    }

    public boolean deleteOrder(BookingRecord record){
        if(record.getStatus() == 1 || record.getStatus() == 2){    // 不可删除
            return false;
        }
//        record.setStatus(-1);
        return deleteOrder(record.getId());
    }

    public HashMap<String, Object> getRelatedInfo(BookingRecord bookingRecord){
        if(bookingRecord == null)
            return null;

        HashMap<String, Object> resultMap = filmShowService.getRelatedInfo(filmShowService.findShowById(bookingRecord.getShowId()));
        resultMap.put("customer", bookingRecord.getUserId());
        resultMap.put("bookingRecord", bookingRecord);
        return resultMap;
    }
}
