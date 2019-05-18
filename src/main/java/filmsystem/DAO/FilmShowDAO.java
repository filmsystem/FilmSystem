package filmsystem.DAO;

import filmsystem.Mapper.FilmShowMapper;
import filmsystem.Model.FilmShow;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.ArrayList;

public class FilmShowDAO {
    ApplicationContext ac;
    SqlSessionFactory factory;
    SqlSession sqlSession;
    FilmShowMapper filmShowMapper;

    public FilmShowDAO(){
        ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        factory = (SqlSessionFactory) ac.getBean("mySqlSessionFactory");
        sqlSession = factory.openSession();
        filmShowMapper=sqlSession.getMapper(FilmShowMapper.class);
    }

    public boolean insertShow(FilmShow filmShow){
        if(filmShowMapper.insertShow(filmShow)>0)
            return true;
        return false;
    }

    public boolean deleteShow(int id){
        if(filmShowMapper.deleteShow(id)>0)
            return true;
        return false;
    }

    public FilmShow selectShowById(int id){
        return filmShowMapper.selectShowById(id);
    }

    public ArrayList<FilmShow> selectShowByCinemaId(int cinemaId,String time){
        return filmShowMapper.selectShowByCinemaId(cinemaId,time);
    }

    public ArrayList<FilmShow> selectShowByFilmId(int filmId,String time){
        return filmShowMapper.selectShowByFilmId(filmId,time);
    }

    public ArrayList<FilmShow> selectShowByCinemaAndFilmId(int cinemaId,int filmId,String time){
        return filmShowMapper.selectShowByCinemaAndFilmId(cinemaId,filmId,time);
    }

    public boolean updateShow(FilmShow filmShow){
        if(filmShowMapper.updateShow(filmShow)>0)
            return true;
        return false;
    }
}
