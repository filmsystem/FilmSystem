package filmsystem.Service.Impi;

import filmsystem.DAO.FilmCommentDAO;
import filmsystem.Model.FilmComment;
import org.springframework.stereotype.Service;
import filmsystem.Service.IFilmCommentService;

import java.util.ArrayList;

@Service("filmCommentService")
public class FilmCommentServiceImpl implements IFilmCommentService{
    private FilmCommentDAO filmCommentDAO = new FilmCommentDAO();
    public boolean insertComment(FilmComment comment){
        return filmCommentDAO.insertComment(comment);
    }

    public boolean deleteComment(int id){
        return filmCommentDAO.deleteComment(id);
    }

    public boolean updateComment(FilmComment comment){
        return filmCommentDAO.updateComment(comment);
    }

    public FilmComment findFilmCommentById(int id){
        return filmCommentDAO.searchCommentById(id);
    }

    public ArrayList<FilmComment> findFilmCommentByUserId(int userId){
        return filmCommentDAO.searchCommentByUserId(userId);
    }

    public ArrayList<FilmComment> findFilmCommentByFilmId(int filmId){
        return filmCommentDAO.searchCommentByFilmId(filmId);
    }
}
