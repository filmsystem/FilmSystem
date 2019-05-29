package filmsystem.Mapper;

import filmsystem.Model.BookingRecord;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface BookingRecordMapper {
    int insertRecord(BookingRecord bookingRecord);
    int deleteRecord(long id);
    int updateRecord(BookingRecord bookingRecord);
    BookingRecord selectRecordById(long id);
    ArrayList<BookingRecord> selectRecordByUserId(int userId);
    ArrayList<BookingRecord> selectRecordByShowId(int showId);
    List<Map<String,Object>> countTimesByFilm(int cinemaId);
    List<Map<String,Object>> countTimesByMonth(int userId);
    List<Map<String,Object>> countTurnoverByDayInAWeek(int cinemaId);
}
