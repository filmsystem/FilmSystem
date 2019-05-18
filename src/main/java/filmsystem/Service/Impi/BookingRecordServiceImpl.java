package filmsystem.Service.Impi;

import filmsystem.DAO.BookingRecordDAO;
import filmsystem.Model.BookingRecord;
import org.springframework.stereotype.Service;
import filmsystem.Service.IBookingRecordService;

import java.util.ArrayList;

@Service("bookingRecordService")
public class BookingRecordServiceImpl implements IBookingRecordService{
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
        if(record.getStatus() == 1 || record.getStatus() == 2){    // 不可取消
            return false;
        }
        record.setStatus(-1);           // 取消订单
        return deleteOrder(record.getId());
    }
}
