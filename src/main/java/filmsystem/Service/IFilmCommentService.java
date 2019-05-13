package filmsystem.Service;

import filmsystem.Model.FilmComment;

public interface IFilmCommentService {
    public boolean insertComment(FilmComment comment);

    public boolean deleteComment(int id);

    public boolean updateComment(FilmComment comment);

    public FilmComment findFilmCommentById(int id);

    public FilmComment findFilmCommentByUserId(int userId);

    public FilmComment findFilmCommentByFilmId(int filmId);
}
