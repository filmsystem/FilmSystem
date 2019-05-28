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

    public boolean deleteRecord(long id){
        if(bookingRecordMapper.deleteRecord(id)>0)
            return true;
        return false;
    }

    public BookingRecord selectRecordById(long id){
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

    public Map<String,Integer> countTimesByMonth(int userId){
        List<Map<String, Object>> baseList = bookingRecordMapper.countTimesByMonth(userId);
        Map<String,Integer> resultMap=new HashMap<String, Integer>();
        for (Map<String, Object> map : baseList) {
            String month1=null;
            int count1=0;
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                if("month1".equals(entry.getKey())){
                    month1=(String)entry.getValue();
                }else if("count1".equals(entry.getKey())){
                    count1 = ((Number)entry.getValue()).intValue();
                }
            }
            resultMap.put(month1,count1);
        }
        return resultMap;
    }

    public Map<String,Float> countTurnoverByDayInAWeek(int cinemaId){
        List<Map<String, Object>> baseList = bookingRecordMapper.countTurnoverByDayInAWeek(cinemaId);
        Map<String,Float> resultMap=new HashMap<String,Float>();
        for (Map<String, Object> map : baseList) {
            String day1=null;
            float turnover=0;
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                if("day1".equals(entry.getKey())){
                    day1=(String)entry.getValue();
                }else if("turnover".equals(entry.getKey())){
                    turnover = ((Number)entry.getValue()).floatValue();
                }
            }
            resultMap.put(day1,turnover);
        }
        return resultMap;
    }
}
