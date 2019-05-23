package filmsystem.Service.Impi;

import filmsystem.DAO.FilmOfficeDAO;
import filmsystem.Model.FilmOffice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import filmsystem.Service.IFilmOfficeService;

import java.util.ArrayList;
import java.util.HashMap;

@Service("filmOfficeService")
public class FilmOfficeServiceImpl implements IFilmOfficeService {
    @Autowired
    CinemaServiceImpl cinemaService;

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

    @Override
    public HashMap<String, Object> getRelatedInfo(FilmOffice office) {
        if(office == null)
            return null;

        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("cinema", cinemaService.findCinemaById(office.getCinemaId()));
        resultMap.put("office", office);
        return resultMap;
    }
}
