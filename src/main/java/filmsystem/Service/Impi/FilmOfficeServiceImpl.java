package filmsystem.Service.Impi;

import filmsystem.DAO.FilmOfficeDAO;
import filmsystem.Model.FilmOffice;
import org.springframework.stereotype.Service;
import filmsystem.Service.IFilmOfficeService;

import java.util.ArrayList;

@Service("filmOfficeService")
public class FilmOfficeServiceImpl implements IFilmOfficeService {
    private FilmOfficeDAO filmOfficeDAO = new FilmOfficeDAO();
    public boolean createOffice(FilmOffice office){
        return filmOfficeDAO.insertFilmOffice(office);
    }

    public boolean updateOffice(FilmOffice office){
        return filmOfficeDAO.equals(office);
    }

    public boolean deleteOffice(int id){
        return filmOfficeDAO.deleteFilmOffice(id);
    }

    public FilmOffice findOfficeById(int id){
        return filmOfficeDAO.searchFilmOfficeById(id);
    }

    public ArrayList<FilmOffice> findOfficeByCinemaId(int cinemaId){
        return filmOfficeDAO.searchFilmOfficeByCinemaId(cinemaId);
    }

    public FilmOffice findOfficeByOfficeId(int cinemaId, int officeId){
        return filmOfficeDAO.searchFilmOfficeByOfficeId(cinemaId, officeId);
    }
}
