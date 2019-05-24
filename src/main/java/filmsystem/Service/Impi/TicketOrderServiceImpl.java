package filmsystem.Service.Impi;

import filmsystem.DAO.BookingRecordDAO;
import filmsystem.Model.BookingRecord;
import filmsystem.Model.FilmShow;
import filmsystem.Tools.RandomString;
import org.springframework.stereotype.Service;
import filmsystem.Service.ITicketOrderService;

import java.sql.Timestamp;

@Service("tickerOrderService")
public class TicketOrderServiceImpl implements ITicketOrderService {
    public boolean createOrder(BookingRecord record){
        record.setStatus(1);
        record.setCreateTime(new Timestamp(System.currentTimeMillis()));
        if(new BookingRecordDAO().insertRecord(record)){
            FilmShow filmShow = new FilmShowServiceImpl().findShowById(record.getShowId());
            return new FilmShowServiceImpl().updateSeat(filmShow, record.getRowNum(), record.getCol(), 1);
        }
        return false;
    }

    public boolean payOrder(BookingRecord record){
        if(record.getStatus() != 1){    // 待支付
            return false;
        }
        record.setStatus(2);            // 已支付
        record.setPayTime(new Timestamp(System.currentTimeMillis()));
        return new BookingRecordDAO().updateRecord(record);
    }

    public String getCollectString(BookingRecord record){
        if(record.getStatus() != 2){    // 已支付
            return null;
        }
        record.setStatus(3);            // 已出票
        String randomStr = randomString();
        record.setCollectingString(randomStr);
        new BookingRecordDAO().updateRecord(record);
        return randomStr;
    }

    public boolean cancelOrder(BookingRecord record){
        if(record.getStatus() == 3){    // 已出票则不可退票
            return false;
        }
        record.setStatus(-1);           // 已取消
        if(new BookingRecordDAO().updateRecord(record)){
            FilmShow filmShow = new FilmShowServiceImpl().findShowById(record.getShowId());
            return new FilmShowServiceImpl().updateSeat(filmShow, record.getRowNum(), record.getCol(), 0);
        }
        return false;
    }

    private String randomString(){
        return RandomString.getRandomString(16);
    }
}
