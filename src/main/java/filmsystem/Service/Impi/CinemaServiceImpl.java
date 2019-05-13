package filmsystem.Service.Impi;

import filmsystem.DAO.CinemaDAO;
import filmsystem.Model.Cinema;
import org.springframework.stereotype.Service;
import filmsystem.Service.ICinemaService;

@Service("cinemaService")
public class CinemaServiceImpl implements ICinemaService{
    public boolean insertCinema(Cinema cinema){
        return new CinemaDAO().insertCinema(cinema);
    }

    public boolean updateCinema(Cinema cinema){
        return new CinemaDAO().updateCinema(cinema);
    }

    public boolean deleteCinema(int id){
        return new CinemaDAO().deleteCinema(id);
    }

    public Cinema findCinemaById(int id){
        // find in database
        return null;
    }

    public Cinema findCinemaByName(String name){
        // find in database
        return null;
    }

    public boolean checkCinema(String username, String password){
        // TODO
        //Cinema cinema = new CinemaDAO().getCinemaName();
        Cinema cinema = null;
        if(cinema != null){
            if(password.equals(cinema.getPassword())){
                return true;
            }
            else{   // password error
                return false;
            }
        }
        else{   // cinema not found
            return false;
        }
    }
}
