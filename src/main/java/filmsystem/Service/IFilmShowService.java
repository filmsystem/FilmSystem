package filmsystem.Service;

import filmsystem.Model.FilmShow;
import java.util.ArrayList;
import java.util.HashMap;

public interface IFilmShowService {
    boolean createShow (FilmShow show);

    boolean updateShow(FilmShow show);

    boolean updateSeat(FilmShow show, int row, int col, int status);

    int getRemainSeatNum(int filmShowId);

    boolean deleteShow(int id);

    FilmShow findShowById(int id);

    ArrayList<FilmShow> findShowByCinemaId(int cinemaId, boolean timeFlag);

    ArrayList<FilmShow> findShowByFilmId(int filmId, boolean timeFlag);

    ArrayList<FilmShow> findShowByCinemaAndFilmId(int cinemaId, int filmId, boolean timeFlag);

    HashMap<String, Object> getRelatedInfo(FilmShow show);
}
