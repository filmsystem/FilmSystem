package filmsystem.Service;

import filmsystem.Model.Cinema;

import java.util.ArrayList;

public interface ICinemaService {
    boolean insertCinema(Cinema cinema);

    boolean updateCinema(Cinema cinema);

    boolean deleteCinema(int id);

    Cinema findCinemaById(int id);

    ArrayList<Cinema> findCinemaByName(String name);

    ArrayList<Cinema> findAllCinemas();

    ArrayList<Cinema> findCinemaByCity(String city);

    ArrayList<Cinema> findCinemaByNameAndCity(String name, String city);
}
