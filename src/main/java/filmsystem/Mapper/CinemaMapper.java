package filmsystem.Mapper;

import filmsystem.Model.Cinema;
import java.util.ArrayList;

public interface CinemaMapper {
    int insertCinema(Cinema cinema);
    int updateCinema(Cinema cinema);
    int deleteCinema(int id);
    Cinema selectCinemaById(int id);
    Cinema selectCinemaByFullName(String name);
    ArrayList<Cinema> selectCinemaByName(String name);
    ArrayList<Cinema> getAllCinema();
    ArrayList<Cinema> selectCinemaByCity(String city);
    ArrayList<Cinema> selectCinemaByNameAndCity(String name, String city);
}
