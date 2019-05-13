package filmsystem.Service.Impi;

import filmsystem.Model.FilmOffice;
import org.springframework.stereotype.Service;
import filmsystem.Service.IFilmOfficeService;

import java.util.ArrayList;

@Service("filmOfficeService")
public class FilmOfficeServiceImpl implements IFilmOfficeService {
    public boolean createOffice(FilmOffice office){
        // add to database
        return true;
    }

    public boolean updateOffice(FilmOffice office){
        // update to database

        return true;
    }

    public boolean deleteOffice(int id){
        // delete in database

        return true;
    }

    public FilmOffice findOfficeById(int id){
        // find in database
        return null;
    }

    public ArrayList<FilmOffice> findOfficeByCinemaId(int cinemaId){
        // find in database
        return null;
    }

    public FilmOffice findOfficeByOfficeId(int cinemaId, int officeId){
        // find in database
        return null;
    }
}
