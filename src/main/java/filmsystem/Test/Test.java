package filmsystem.Test;

import filmsystem.DAO.BookingRecordDAO;
import filmsystem.DAO.FilmDAO;
import filmsystem.DAO.FilmOfficeDAO;
import filmsystem.Mapper.AdministratorMapper;
import filmsystem.Model.Administrator;
import filmsystem.DAO.AdministratorDAO;
import filmsystem.Model.BookingRecord;
import filmsystem.Model.FilmOffice;
import filmsystem.Tools.IDGenerator;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

public class Test {
    public static void main(String args[]){
        //实例化一个ClassPathXmlApplicationContext通过文件名查找方式找到
        //ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        //通过getBean方法找到applicationContext中的mySqlSessionFactory
        //SqlSessionFactory factory = (SqlSessionFactory) ac.getBean("mySqlSessionFactory");
        //SqlSession sqlSession = factory.openSession();
        //AdministratorMapper administratorMapper = sqlSession.getMapper(AdministratorMapper.class);
        //通过findAllStudent()方法查询数据库打印出数据的长度
        //System.out.println("获得管理员用户名："+administratorMapper.selectAdminById(1).getImg());

        BookingRecordDAO bookingRecordDAO=new BookingRecordDAO();
        Map<String,ArrayList<Float>> resultMap=bookingRecordDAO.countTimesByFilm2(20000000);
        for(Map.Entry<String,ArrayList<Float>> entry:resultMap.entrySet()){
            System.out.print(entry.getKey()+":");
            ArrayList<Float> al=entry.getValue();
            System.out.print(al.get(0)+","+al.get(1)+"\n");
        }
//        StringBuilder buffer = new StringBuilder("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
//        int seatNum = (3 - 1) * 10 + (3 - 1);
//        System.out.println("test:"+buffer.substring(seatNum, seatNum+1));
//        System.out.println(buffer);
//        buffer.replace(seatNum, seatNum+1, "1");
//        System.out.println(buffer);
        /*for(int i = 0; i < 100000; i++){
            System.out.println(IDGenerator.createID());
        }*/
    }
}
