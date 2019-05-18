package filmsystem.Mapper;

import filmsystem.Model.FilmComment;

import java.util.ArrayList;

public interface FilmCommentMapper {
    int insertComment(FilmComment comment);
    int deleteComment(int id);
    int updateComment(FilmComment comment);
    FilmComment selectFilmCommentById(int id);
    ArrayList<FilmComment> selectFilmCommentByUserId(int userId);
    ArrayList<FilmComment> selectFilmCommentByFilmId(int filmId);
}
