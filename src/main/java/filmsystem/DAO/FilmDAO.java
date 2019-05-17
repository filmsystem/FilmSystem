package filmsystem.DAO;

import java.sql.*;
import java.util.ArrayList;

import filmsystem.DAO.BaseDAO;
import filmsystem.Mapper.FilmMapper;
import filmsystem.Model.Film;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class FilmDAO {
    PreparedStatement pstmt;
    ApplicationContext ac;
    SqlSessionFactory factory;
    SqlSession sqlSession;
    FilmMapper filmMapper;

    public FilmDAO(){
        ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        factory = (SqlSessionFactory) ac.getBean("mySqlSessionFactory");
        sqlSession = factory.openSession();
        filmMapper=sqlSession.getMapper(FilmMapper.class);
    }

    public boolean insertFilm(Film film) {
        if(filmMapper.insertFilm(film)>0)
            return true;
        return false;
    }

    public boolean deleteFilm(int id) {
        if(filmMapper.deleteFilm(id)>0)
            return true;
        return false;
    }

    public Film searchFilmById(int id) {
        return filmMapper.selectFilmById(id);
    }

    public ArrayList<Film> searchFilmByName(String name) {
        name="%"+name+"%";
        return filmMapper.selectFilmByName(name);
    }

    public ArrayList<Film> checkFilmByDirectors(String directors) {
        directors="%"+directors+"%";
        return filmMapper.selectFilmByDirectors(directors);
    }

    public ArrayList<Film> checkFilmByCasts(String casts) {
        casts="%"+casts+"%";
        return filmMapper.selectFilmByCasts(casts);
    }

    public ArrayList<Film> checkFilmByYear(int year) {
        return filmMapper.selectFilmByYear(year);
    }

    public ArrayList<Film> checkFilmByCountries(String countries) {
        countries="%"+countries+"%";
        return filmMapper.selectFilmByCountries(countries);
    }

    public ArrayList<Film> checkFilmByType(String type) {
        type="%"+type+"%";
        return filmMapper.selectFilmByType(type);
    }

    public boolean updateFilm(Film film) {
        if(filmMapper.updateFilm(film)>0)
            return true;
        return false;
    }
}
