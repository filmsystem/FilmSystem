package filmsystem.Service;

import filmsystem.Model.FilmShow;
import java.util.ArrayList;

public interface IFilmShowService {
    boolean createShow (FilmShow show);

    boolean updateShow(FilmShow show);

    boolean updateSeat(FilmShow show, int seatNum, int status);

    int getRemainSeatNum(int filmShowId);

    boolean deleteShow(int id);

    FilmShow findShowById(int id);

    ArrayList<FilmShow> findShowByCinemaId(int cinemaId);

    ArrayList<FilmShow> findShowByFilmId(int filmId);

    ArrayList<FilmShow> findShowByCinemaAndFilmId(int cinemaId, int filmId);
}
