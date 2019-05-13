package filmsystem.Service.Impi;

import filmsystem.Model.Film;
import org.springframework.stereotype.Service;
import filmsystem.Service.IFilmService;

import java.util.ArrayList;

@Service("filmService")
public class FilmServiceImpl implements IFilmService {
    public boolean insertFilm(Film film){
        // insert into database
        film.setStar(0);
        return true;
    }

    public boolean updateFilm(Film film){
        // update film
        return true;
    }

    public boolean deleteFilm(int id){
        //delete film
        return true;
    }

    public Film findFilmById(int id){
        // find in database
        return null;
    }

    public ArrayList<Film> findFilmByName(String name){
        // find in database
        return null;
    }

    public ArrayList<Film> findFilmByCast(String cast){
        // find in database
        return null;
    }

    public ArrayList<Film> findFilmByDirector(String director){
        // find in database
        return null;
    }
}
