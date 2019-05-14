package filmsystem.Service;

import filmsystem.Model.BookingRecord;

import java.util.ArrayList;

public interface IBookingRecordService {
    ArrayList<BookingRecord> findOrderByUserId(int userId);

    ArrayList<BookingRecord> findOrderByShowId(int showId);

    BookingRecord findOrderById(int id);

    boolean deleteOrder(int id);

    boolean deleteOrder(BookingRecord record);
}
