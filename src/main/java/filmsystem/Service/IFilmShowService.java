package filmsystem.Service;

import filmsystem.Model.FilmShow;
import java.util.ArrayList;

public interface IFilmShowService {
    public boolean createShow (FilmShow show);

    public boolean updateShow(FilmShow show);

    public boolean updateSeat(FilmShow show, int seatNum, int status);

    public int getRemainSeatNum(int filmShowId);

    public boolean deleteShow(int id);

    public FilmShow findShowById(int id);

    public ArrayList<FilmShow> findShowByCinemaId(int cinemaId);

    public ArrayList<FilmShow> findShowByFilmeId(int filmId);
}
