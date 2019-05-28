package filmsystem.Service.Impi;

import filmsystem.DAO.BookingRecordDAO;
import filmsystem.Service.IStatisticsService;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service("statisticsService")
public class StatisticsServiceImpl implements IStatisticsService {
    private BookingRecordDAO bookingRecordDAO = new BookingRecordDAO();

    @Override
    public HashMap<String, Integer> countTypeByUserId(int userId) {
        return (HashMap<String, Integer>)bookingRecordDAO.countTypeByUserId(userId);
    }

    @Override
    public HashMap<String, Integer> countTimesByMonth(int userId) {
        return (HashMap<String,Integer>)bookingRecordDAO.countTimesByMonth(userId);
    }

    @Override
    public HashMap<String, Float> countTurnoverByDayInAWeek(int cinemaId) {
        return (HashMap<String,Float>)bookingRecordDAO.countTurnoverByDayInAWeek(cinemaId);
    }
}
