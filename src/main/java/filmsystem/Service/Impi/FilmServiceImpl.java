package filmsystem.Service.Impi;

import filmsystem.DAO.FilmDAO;
import filmsystem.Model.Film;
import org.springframework.stereotype.Service;
import filmsystem.Service.IFilmService;

import java.util.ArrayList;

@Service("filmService")
public class FilmServiceImpl implements IFilmService {
    private FilmDAO filmDAO = new FilmDAO();
    public boolean insertFilm(Film film){
        film.setStar(0);
        return filmDAO.insertFilm(film);
    }

    public boolean updateFilm(Film film){
        return filmDAO.updateFilm(film);
    }

    public boolean deleteFilm(int id){
        return filmDAO.deleteFilm(id);
    }

    public Film findFilmById(int id){
        return filmDAO.searchFilmById(id);
    }

    public ArrayList<Film> findFilmByName(String name){
        return filmDAO.searchFilmByName(name);
    }

    public ArrayList<Film> findFilmByCast(String cast){
        return filmDAO.checkFilmByCasts(cast);
    }

    public ArrayList<Film> findFilmByDirector(String director){
        return filmDAO.checkFilmByDirectors(director);
    }

    @Override
    public ArrayList<Film> findFilmByCountry(String country) {
        return filmDAO.checkFilmByCountries(country);

    }

    @Override
    public ArrayList<Film> findFilmByType(String type) {
        return filmDAO.checkFilmByType(type);
    }

    @Override
    public ArrayList<Film> findFilmByYear(int year) {
        return filmDAO.checkFilmByYear(year);
    }
}
