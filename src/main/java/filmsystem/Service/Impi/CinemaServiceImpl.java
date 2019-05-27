package filmsystem.Service.Impi;

import filmsystem.DAO.CinemaDAO;
import filmsystem.DAO.FilmShowDAO;
import filmsystem.Model.Cinema;
import filmsystem.Model.FilmShow;
import org.springframework.stereotype.Service;
import filmsystem.Service.ICinemaService;

import java.util.ArrayList;

@Service("cinemaService")
public class CinemaServiceImpl implements ICinemaService{
    private CinemaDAO cinemaDAO = new CinemaDAO();

    public boolean insertCinema(Cinema cinema){
        return cinemaDAO.insertCinema(cinema);
    }

    public boolean updateCinema(Cinema cinema){
        return cinemaDAO.updateCinema(cinema);
    }

    public boolean deleteCinema(int id){
        return cinemaDAO.deleteCinema(id);
    }

    public Cinema findCinemaById(int id){
        return cinemaDAO.searchCinemaById(id);
    }

    @Override
    public Cinema findCinemaByFullName(String name) {
        return cinemaDAO.searchCinemaByFullName(name);
    }

    public ArrayList<Cinema> findCinemaByName(String name){
        return cinemaDAO.searchCinemaByName(name);
    }

    @Override
    public ArrayList<Cinema> findAllCinemas() {
        return cinemaDAO.listAllCinema();
    }

    @Override
    public ArrayList<Cinema> findCinemaByCity(String city) {
        return cinemaDAO.searchCinemaByCity(city);
    }

    @Override
    public ArrayList<Cinema> findCinemaByNameAndCity(String name, String city) {
        return cinemaDAO.searchCinemaByNameAndCity(name, city);
    }

    @Override
    public ArrayList<Cinema> findCinemaByFilmId(int id) {
        return null;
    }
}
