package filmsystem.Service.Impi;

import filmsystem.Model.FilmOffice;
import filmsystem.Model.FilmShow;
import org.springframework.stereotype.Service;
import filmsystem.Service.IFilmShowService;

import java.util.ArrayList;

@Service("filmShowService")
public class FilmShowServiceImpl implements IFilmShowService {
    public boolean createShow (FilmShow show){

        StringBuffer buffer = new StringBuffer();
        FilmOffice office = new FilmOfficeServiceImpl().findOfficeById(show.getOfficeId());
        int len = office.getRow() * office.getCol();
        for (int i = 0; i < len; i++) {
            buffer.append("0");
        }
        show.setSeat(buffer.toString());
        // add to database
        return true;
    }

    public boolean updateShow(FilmShow show){
        // update to database

        return true;
    }

    public boolean updateSeat(FilmShow show, int seatNum, int status){
        if(status == 0){
            StringBuilder buffer = new StringBuilder(show.getSeat());
            buffer.replace(seatNum, seatNum, "0");
            show.setSeat(buffer.toString());
            // update
            return true;
        }
        else{
            StringBuilder buffer = new StringBuilder(show.getSeat());
            if(buffer.substring(seatNum, seatNum).equals("0")){
                buffer.replace(seatNum, seatNum, "1");
                show.setSeat(buffer.toString());
                // update
                return true;
            }
            else{
                return false;
            }
        }
    }

    public int getRemainSeatNum(int filmShowId){
        FilmShow show = findShowById(filmShowId);
        if(show != null){
            String seat = show.getSeat();
            int count = 0;
            for(int i = 0; i < seat.length(); i++){
                if(String.valueOf(seat.charAt(i)).equals("0"))
                    count++;
            }
            return count;
        }
        else{
            return -1;      // not found
        }
    }

    public boolean deleteShow(int id){
        // delete in database

        return true;
    }

    public FilmShow findShowById(int id){
        // find in database
        return null;
    }

    public ArrayList<FilmShow> findShowByCinemaId(int cinemaId){
        // find in database
        return null;
    }

    public ArrayList<FilmShow> findShowByFilmeId(int filmId){
        // find in database
        return null;
    }
}
