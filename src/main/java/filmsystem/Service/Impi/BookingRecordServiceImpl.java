package filmsystem.Service.Impi;

import filmsystem.Model.BookingRecord;
import org.springframework.stereotype.Service;
import filmsystem.Service.IBookingRecordService;

import java.util.ArrayList;

@Service("bookingRecordService")
public class BookingRecordServiceImpl implements IBookingRecordService{
    public ArrayList<BookingRecord> findOrderByUserId(int userId){
        ArrayList<BookingRecord> list = new ArrayList<>();
        // find in database
        return list;
    }

    public BookingRecord findOrderById(int id){
        // find in database
        return null;
    }

    public boolean deleteOrder(int id){
        BookingRecord record = new BookingRecord(); // find in database
        return deleteOrder(record);
    }

    public boolean deleteOrder(BookingRecord record){
        if(record.getStatus() == 1 || record.getStatus() == 2){    // 鍙湁鍙栨秷鎴栧凡鍑虹エ鐨勮鍗曟墠鍙垹闄�
            return false;
        }
        record.setStatus(-1);           // 淇敼璁㈠崟鐘舵�佷负宸插彇娑�
        // delete in database
        return true;
    }
}
