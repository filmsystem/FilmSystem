package filmsystem.Service;

import filmsystem.Model.BookingRecord;
import filmsystem.Tools.RandomString;

import java.sql.Timestamp;

public interface ITicketOrderService {
    boolean createOrder(BookingRecord record);

    boolean payOrder(BookingRecord record);

    String getCollectString(BookingRecord record);

    boolean cancelOrder(BookingRecord record);
}
