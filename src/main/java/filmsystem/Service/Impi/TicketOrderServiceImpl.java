package filmsystem.Service.Impi;

import filmsystem.Model.BookingRecord;
import filmsystem.Tools.RandomString;
import org.springframework.stereotype.Service;
import filmsystem.Service.ITicketOrderService;

import java.sql.Timestamp;

@Service("tickerOrderService")
public class TicketOrderServiceImpl implements ITicketOrderService {
    public boolean createOrder(BookingRecord record){
        record.setStatus(1);
        record.setCreateTime(new Timestamp(System.currentTimeMillis()));
        // insert in database
        // update seat
        return true;
    }

    public boolean payOrder(BookingRecord record){
        if(record.getStatus() != 1){    // 待支付
            return false;
        }
        record.setStatus(2);            // 已支付
        record.setPayTime(new Timestamp(System.currentTimeMillis()));
        // update in database
        return true;
    }

    public String getCollectString(BookingRecord record){
        if(record.getStatus() != 2){    // 已支付
            return null;
        }
        record.setStatus(3);            // 已出票
        String randomStr = randomString();
        record.setCollectingString(randomStr);

        // update in database
        return randomStr;
    }

    public boolean cancelOrder(BookingRecord record){
        if(record.getStatus() == 3){    // 已出票则不可退票
            return false;
        }
        record.setStatus(-1);           // 已取消
        // update in database
        return true;
    }

    private String randomString(){
        return RandomString.getRandomString(16);
    }
}
