package filmsystem.Service;

import filmsystem.Model.Cinema;

public interface ICinemaService {
    public boolean insertCinema(Cinema cinema);

    public boolean updateCinema(Cinema cinema);

    public boolean deleteCinema(int id);

    public Cinema findCinemaById(int id);

    public Cinema findCinemaByName(String name);

    public boolean checkCinema(String username, String password);
}
