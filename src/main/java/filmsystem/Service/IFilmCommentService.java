package filmsystem.Service;

import filmsystem.Model.FilmComment;

import java.util.ArrayList;

public interface IFilmCommentService {
    public boolean insertComment(FilmComment comment);

    public boolean deleteComment(int id);

    public boolean updateComment(FilmComment comment);

    public FilmComment findFilmCommentById(int id);

    public ArrayList<FilmComment> findFilmCommentByUserId(int userId);

    public ArrayList<FilmComment> findFilmCommentByFilmId(int filmId);
}
