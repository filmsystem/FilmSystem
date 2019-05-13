package filmsystem.Service;

import filmsystem.Model.FilmOffice;

import java.util.ArrayList;

public interface IFilmOfficeService {
    public boolean createOffice(FilmOffice office);

    public boolean updateOffice(FilmOffice office);

    public boolean deleteOffice(int id);

    public FilmOffice findOfficeById(int id);

    public ArrayList<FilmOffice> findOfficeByCinemaId(int cinemaId);

    public FilmOffice findOfficeByOfficeId(int cinemaId, int officeId);
}
