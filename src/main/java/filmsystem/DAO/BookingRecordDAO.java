package filmsystem.DAO;

import filmsystem.Mapper.BookingRecordMapper;
import filmsystem.Model.BookingRecord;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.ArrayList;

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
}
