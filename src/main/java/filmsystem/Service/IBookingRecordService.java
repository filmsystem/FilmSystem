package filmsystem.Service;

import filmsystem.Model.BookingRecord;

import java.util.ArrayList;
import java.util.HashMap;

public interface IBookingRecordService {
    ArrayList<BookingRecord> findOrderByUserId(int userId);

    ArrayList<BookingRecord> findOrderByShowId(int showId);

    BookingRecord findOrderById(long id);

    boolean deleteOrder(long id);

    boolean deleteOrder(BookingRecord record);

    HashMap<String, Object> getRelatedInfo(BookingRecord record);
}
