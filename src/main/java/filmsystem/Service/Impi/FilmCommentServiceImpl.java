package filmsystem.Service.Impi;

import filmsystem.Model.FilmComment;
import org.springframework.stereotype.Service;
import filmsystem.Service.IFilmCommentService;

import java.util.ArrayList;

@Service("filmCommentService")
public class FilmCommentServiceImpl implements IFilmCommentService{
    public boolean insertComment(FilmComment comment){
        // add to database
        return true;
    }

    public boolean deleteComment(int id){
        // delete in database
        return true;
    }

    public boolean updateComment(FilmComment comment){
        // update in database
        return true;
    }

    public FilmComment findFilmCommentById(int id){
        // find in database
        return null;
    }

    public ArrayList<FilmComment> findFilmCommentByUserId(int userId){
        // find in database
        return null;
    }

    public ArrayList<FilmComment> findFilmCommentByFilmId(int filmId){
        // find in database
        return null;
    }
}
