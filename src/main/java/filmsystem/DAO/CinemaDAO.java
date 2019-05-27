package filmsystem.DAO;

import java.util.ArrayList;
import filmsystem.Mapper.CinemaMapper;
import filmsystem.Model.Cinema;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class CinemaDAO {
    ApplicationContext ac;
    SqlSessionFactory factory;
    SqlSession sqlSession;
    CinemaMapper cinemaMapper;

    public CinemaDAO(){
        ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        factory = (SqlSessionFactory) ac.getBean("mySqlSessionFactory");
        sqlSession = factory.openSession();
        cinemaMapper = sqlSession.getMapper(CinemaMapper.class);
    }

    public boolean insertCinema(Cinema cinema) {
        if(cinemaMapper.insertCinema(cinema)>0)
            return true;
        return false;
    }

    public boolean deleteCinema(int id) {
        if(cinemaMapper.deleteCinema(id)>0)
            return true;
        return false;
    }

    public Cinema searchCinemaById(int id) {
        return cinemaMapper.selectCinemaById(id);
    }

    public ArrayList<Cinema> searchCinemaByCity(String city) {
        return cinemaMapper.selectCinemaByCity(city);
    }

    public Cinema searchCinemaByFullName(String name) {
        return cinemaMapper.selectCinemaByFullName(name);
    }

    public ArrayList<Cinema> searchCinemaByName(String name) {
        name="%"+name+"%";
        return cinemaMapper.selectCinemaByName(name);
    }

    public ArrayList<Cinema> searchCinemaByNameAndCity(String name,String city){
        name="%"+name+"%";
        return cinemaMapper.selectCinemaByNameAndCity(name,city);
    }

    public ArrayList<Cinema> listAllCinema() {
        return cinemaMapper.getAllCinema();
    }

    public boolean updateCinema(Cinema cinema) {
        if(cinemaMapper.updateCinema(cinema)>0)
            return true;
        return false;
    }

    public ArrayList<Cinema> selectCinemaInFilmShowByFilmId(int filmId){
        return cinemaMapper.selectCinemaInFilmShowByFilmId(filmId);
    }
}
