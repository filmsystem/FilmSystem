package filmsystem.DAO;

import filmsystem.Mapper.FilmCommentMapper;
import filmsystem.Model.FilmComment;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.ArrayList;

public class FilmCommentDAO {
    ApplicationContext ac;
    SqlSessionFactory factory;
    SqlSession sqlSession;
    FilmCommentMapper filmCommentMapper;

    public FilmCommentDAO(){
        ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        factory = (SqlSessionFactory) ac.getBean("mySqlSessionFactory");
        sqlSession = factory.openSession();
        filmCommentMapper=sqlSession.getMapper(FilmCommentMapper.class);
    }

    public boolean insertComment(FilmComment filmComment) {
        if(filmCommentMapper.insertComment(filmComment)>0)
            return true;
        return false;
    }

    public boolean deleteComment(int id) {
        if(filmCommentMapper.deleteComment(id)>0)
            return true;
        return false;
    }

    public FilmComment searchCommentById(int id){
        return filmCommentMapper.selectFilmCommentById(id);
    }

    public ArrayList<FilmComment> searchCommentByUserId(int id) {
        return filmCommentMapper.selectFilmCommentByUserId(id);
    }

    public ArrayList<FilmComment> searchCommentByFilmId(int filmId) {
        return filmCommentMapper.selectFilmCommentByFilmId(filmId);
    }

    public boolean updateComment(FilmComment filmComment) {
        if (filmCommentMapper.updateComment(filmComment) > 0)
            return true;
        return false;
    }
}
