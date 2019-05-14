package filmsystem.Service;

import filmsystem.Model.Film;

import java.util.ArrayList;

public interface IFilmService {
    boolean insertFilm(Film film);

    boolean updateFilm(Film film);

    boolean deleteFilm(int id);

    Film findFilmById(int id);

    ArrayList<Film> findFilmByName(String name);

    ArrayList<Film> findFilmByCast(String cast);

    ArrayList<Film> findFilmByDirector(String director);
}
