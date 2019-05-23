package filmsystem.Service.Impi;

import filmsystem.DAO.FilmCommentDAO;
import filmsystem.Model.FilmComment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import filmsystem.Service.IFilmCommentService;

import java.util.ArrayList;
import java.util.HashMap;

@Service("filmCommentService")
public class FilmCommentServiceImpl implements IFilmCommentService{
    @Autowired
    CustomerServiceImpl customerService;

    @Autowired
    FilmServiceImpl filmService;

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

    @Override
    public HashMap<String, Object> getRelatedInfo(FilmComment comment) {
        if(comment == null)
            return null;

        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("customer", customerService.findCustomerById(comment.getUserId()));
        resultMap.put("film", filmService.findFilmById(comment.getFilmId()));
        resultMap.put("filmComment", comment);
        return resultMap;
    }
}
