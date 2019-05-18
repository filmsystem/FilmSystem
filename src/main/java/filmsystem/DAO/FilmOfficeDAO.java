package filmsystem.DAO;

import filmsystem.Mapper.FilmOfficeMapper;
import filmsystem.Model.FilmOffice;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.sql.*;
import java.util.ArrayList;

public class FilmOfficeDAO {
    PreparedStatement pstmt;
    ApplicationContext ac;
    SqlSessionFactory factory;
    SqlSession sqlSession;
    FilmOfficeMapper filmOfficeMapper;

    public FilmOfficeDAO(){
        ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        factory = (SqlSessionFactory) ac.getBean("mySqlSessionFactory");
        sqlSession = factory.openSession();
        filmOfficeMapper=sqlSession.getMapper(FilmOfficeMapper.class);
    }

    public boolean insertFilmOffice(FilmOffice filmOffice) {
        if(filmOfficeMapper.insertOffice(filmOffice)>0)
            return true;
        return false;
    }

    public boolean deleteFilmOffice(int id) {
        if(filmOfficeMapper.deleteOffice(id)>0)
            return true;
        return false;
    }

    public FilmOffice searchFilmOfficeById(int id) {
        return filmOfficeMapper.selectOfficeById(id);
    }

    public ArrayList<FilmOffice> searchFilmOfficeByCinemaId(int cinemaId) {
        return filmOfficeMapper.selectOfficeByCinemaId(cinemaId);
    }

    public FilmOffice searchFilmOfficeByOfficeId(int cinemaId,int officeId) {
        return filmOfficeMapper.selectOfficeByOfficeId(cinemaId,officeId);
    }

    public boolean updateFilmOffice(FilmOffice filmOffice) {
        if(filmOfficeMapper.updateOffice(filmOffice)>0)
            return true;
        return false;
    }
}
