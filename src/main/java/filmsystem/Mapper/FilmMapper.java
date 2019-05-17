package filmsystem.Mapper;

import filmsystem.Model.Film;

import java.util.ArrayList;

public interface FilmMapper {
    int insertFilm(Film film);
    int updateFilm(Film film);
    int deleteFilm(int id);
    Film selectFilmById(int id);
    ArrayList<Film> selectFilmByName(String name);
    ArrayList<Film> selectFilmByCasts(String cast);
    ArrayList<Film> selectFilmByDirectors(String director);
    ArrayList<Film> selectFilmByYear(int year);
    ArrayList<Film> selectFilmByCountries(String countries);
    ArrayList<Film> selectFilmByType(String type);
}
