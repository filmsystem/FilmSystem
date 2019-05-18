package filmsystem.Mapper;

import filmsystem.Model.FilmShow;

import java.util.ArrayList;

public interface FilmShowMapper {
    int insertShow (FilmShow show);
    int updateShow(FilmShow show);
    int deleteShow(int id);
    FilmShow selectShowById(int id);
    ArrayList<FilmShow> selectShowByCinemaId(int cinemaId,String time);
    ArrayList<FilmShow> selectShowByFilmId(int filmId,String time);
    ArrayList<FilmShow> selectShowByCinemaAndFilmId(int cinemaId, int filmId,String time);
}
