package filmsystem.Service;

import filmsystem.Model.BookingRecord;
import filmsystem.Tools.RandomString;

import java.sql.Timestamp;

public interface ITicketOrderService {
    public boolean createOrder(BookingRecord record);

    public boolean payOrder(BookingRecord record);

    public String getCollectString(BookingRecord record);

    public boolean cancelOrder(BookingRecord record);
}
