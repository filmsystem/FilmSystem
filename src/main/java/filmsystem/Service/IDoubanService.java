package filmsystem.Service;

import filmsystem.Model.Film;

import java.util.ArrayList;
import java.util.HashMap;

public interface IDoubanService {
    public HashMap<String,Integer> getName_IDMap(String JSONString);

    public ArrayList<Film> FilmArray(String JSONString);

    public Film getOneFilm(String JSONString);

}
