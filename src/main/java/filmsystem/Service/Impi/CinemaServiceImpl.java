package filmsystem.Service.Impi;

import filmsystem.DAO.CinemaDAO;
import filmsystem.Model.Cinema;
import org.springframework.stereotype.Service;
import filmsystem.Service.ICinemaService;

import java.util.ArrayList;

@Service("cinemaService")
public class CinemaServiceImpl implements ICinemaService{
    public boolean insertCinema(Cinema cinema){
        return new CinemaDAO().insertCinema(cinema);
    }

    public boolean updateCinema(Cinema cinema){
        return new CinemaDAO().updateCinema(cinema);
    }

    public boolean deleteCinema(int id){
        return new CinemaDAO().deleteCinema(id);
    }

    public Cinema findCinemaById(int id){
        // find in database
        return null;
    }

    public ArrayList<Cinema> findCinemaByName(String name){
        // find in database
        return null;
    }

    @Override
    public ArrayList<Cinema> findAllCinemas() {
        return null;
    }

    @Override
    public ArrayList<Cinema> findCinemaByCity(String city) {
        return null;
    }

    @Override
    public ArrayList<Cinema> findCinemaByNameAndCity(String name, String city) {
        return null;
    }
}
