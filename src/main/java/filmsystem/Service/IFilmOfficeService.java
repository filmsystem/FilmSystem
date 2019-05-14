package filmsystem.Service;

import filmsystem.Model.FilmOffice;

import java.util.ArrayList;

public interface IFilmOfficeService {
    boolean createOffice(FilmOffice office);

    boolean updateOffice(FilmOffice office);

    boolean deleteOffice(int id);

    FilmOffice findOfficeById(int id);

    ArrayList<FilmOffice> findOfficeByCinemaId(int cinemaId);

    FilmOffice findOfficeByOfficeId(int cinemaId, int officeId);
}
