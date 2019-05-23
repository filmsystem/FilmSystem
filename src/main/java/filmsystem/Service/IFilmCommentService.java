package filmsystem.Service;

import filmsystem.Model.FilmComment;

import java.util.ArrayList;
import java.util.HashMap;

public interface IFilmCommentService {
    boolean insertComment(FilmComment comment);

    boolean deleteComment(int id);

    boolean updateComment(FilmComment comment);

    FilmComment findFilmCommentById(int id);

    ArrayList<FilmComment> findFilmCommentByUserId(int userId);

    ArrayList<FilmComment> findFilmCommentByFilmId(int filmId);

    HashMap<String, Object> getRelatedInfo(FilmComment comment);
}
