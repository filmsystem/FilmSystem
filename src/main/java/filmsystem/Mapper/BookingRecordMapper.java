package filmsystem.Mapper;

import filmsystem.Model.BookingRecord;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface BookingRecordMapper {
    int insertRecord(BookingRecord bookingRecord);
    int deleteRecord(int id);
    int updateRecord(BookingRecord bookingRecord);
    BookingRecord selectRecordById(int id);
    ArrayList<BookingRecord> selectRecordByUserId(int userId);
    ArrayList<BookingRecord> selectRecordByShowId(int showId);
    List<Map<String,Object>> countTypeByUserId(int userId);
}
