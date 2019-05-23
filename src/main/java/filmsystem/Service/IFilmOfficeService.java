package filmsystem.Service;

import filmsystem.Model.FilmOffice;

import java.util.ArrayList;
import java.util.HashMap;

public interface IFilmOfficeService {
    boolean createOffice(FilmOffice office);

    boolean updateOffice(FilmOffice office);

    boolean deleteOffice(int id);

    FilmOffice findOfficeById(int id);

    ArrayList<FilmOffice> findOfficeByCinemaId(int cinemaId);

    FilmOffice findOfficeByOfficeId(int cinemaId, int officeId);

    HashMap<String, Object> getRelatedInfo(FilmOffice office);
}
