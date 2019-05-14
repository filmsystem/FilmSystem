package filmsystem.Service;

import filmsystem.Model.Film;

import java.util.ArrayList;
import java.util.HashMap;

public interface IDoubanService {
    HashMap<String,Integer> getName_IDMap(String JSONString);

    ArrayList<Film> FilmArray(String JSONString);

    Film getOneFilm(String JSONString);

}
