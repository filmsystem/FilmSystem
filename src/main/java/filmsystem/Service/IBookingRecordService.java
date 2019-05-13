package filmsystem.Service;

import filmsystem.Model.BookingRecord;

import java.util.ArrayList;

public interface IBookingRecordService {
    public ArrayList<BookingRecord> findOrderByUserId(int userId);

    public BookingRecord findOrderById(int id);

    public boolean deleteOrder(int id);

    public boolean deleteOrder(BookingRecord record);
}
