package filmsystem.Service;

import filmsystem.Model.Film;

import java.util.ArrayList;
import java.util.HashMap;

public interface IDoubanService {
    HashMap<String,Integer> getName_IDMap(String JSONString, boolean flag);

    // ArrayList<Film> FilmArray(String JSONString);

    Film getOneFilm(String JSONString);

    int getTotal(String JSONString);

}
