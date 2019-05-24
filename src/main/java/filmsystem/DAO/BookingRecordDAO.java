package filmsystem.DAO;

import filmsystem.Mapper.BookingRecordMapper;
import filmsystem.Model.BookingRecord;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BookingRecordDAO {
    ApplicationContext ac;
    SqlSessionFactory factory;
    SqlSession sqlSession;
    BookingRecordMapper bookingRecordMapper;

    public BookingRecordDAO(){
        ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        factory = (SqlSessionFactory) ac.getBean("mySqlSessionFactory");
        sqlSession = factory.openSession();
        bookingRecordMapper=sqlSession.getMapper(BookingRecordMapper.class);
    }

    public boolean insertRecord(BookingRecord bookingRecord){
        if(bookingRecordMapper.insertRecord(bookingRecord)>0)
            return true;
        return false;
    }

    public boolean deleteRecord(int id){
        if(bookingRecordMapper.deleteRecord(id)>0)
            return true;
        return false;
    }

    public BookingRecord selectRecordById(int id){
        return bookingRecordMapper.selectRecordById(id);
    }

    public ArrayList<BookingRecord> selectRecordByUserId(int userId){
        return bookingRecordMapper.selectRecordByUserId(userId);
    }

    public ArrayList<BookingRecord> selectRecordByShowId(int showId){
        return bookingRecordMapper.selectRecordByShowId(showId);
    }

    public boolean updateRecord(BookingRecord bookingRecord){
        if(bookingRecordMapper.updateRecord(bookingRecord)>0)
            return true;
        return false;
    }

    public Map<String, Integer> countTypeByUserId(int userId){
        List<Map<String, Object>> baseList = bookingRecordMapper.countTypeByUserId(userId);
        Map<String, Integer> resultMap = new HashMap<String, Integer>();
        for (Map<String, Object> map : baseList) {
            String type = null;
            int count1 = 0;
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                if ("type".equals(entry.getKey())) {
                    type = (String) entry.getValue();
                } else if ("count1".equals(entry.getKey())) {
                    count1 = ((Number)entry.getValue()).intValue();
                }
            }
            resultMap.put(type, count1);
        }
        return resultMap;
    }
}
