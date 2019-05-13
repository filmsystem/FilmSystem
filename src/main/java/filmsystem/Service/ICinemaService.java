package filmsystem.Service;

import filmsystem.Model.Cinema;

public interface ICinemaService {
    boolean insertCinema(Cinema cinema);

    boolean updateCinema(Cinema cinema);

    boolean deleteCinema(int id);

    Cinema findCinemaById(int id);

    Cinema findCinemaByName(String name);
}
