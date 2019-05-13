package filmsystem.Service;

import filmsystem.Model.Film;

import java.util.ArrayList;

public interface IFilmService {
    public boolean insertFilm(Film film);

    public boolean updateFilm(Film film);

    public boolean deleteFilm(int id);

    public Film findFilmById(int id);

    public ArrayList<Film> findFilmByName(String name);

    public ArrayList<Film> findFilmByCast(String cast);

    public ArrayList<Film> findFilmByDirector(String director);
}
