package filmsystem.Test;

import filmsystem.Mapper.AdministratorMapper;
import filmsystem.Model.Administrator;
import filmsystem.DAO.AdministratorDAO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.ArrayList;
import java.util.Iterator;

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

        AdministratorDAO administratorDAO=new AdministratorDAO();
        administratorDAO.deleteAdministrator(1);
    }
}
