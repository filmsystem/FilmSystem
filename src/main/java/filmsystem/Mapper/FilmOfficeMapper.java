package filmsystem.Mapper;

import filmsystem.Model.FilmOffice;

import java.util.ArrayList;

public interface FilmOfficeMapper {
    int insertOffice(FilmOffice office);
    int updateOffice(FilmOffice office);
    int deleteOffice(int id);
    FilmOffice selectOfficeById(int id);
    ArrayList<FilmOffice> selectOfficeByCinemaId(int cinemaId);
    FilmOffice selectOfficeByOfficeId(int cinemaId, int officeId);
}
