package filmsystem.Controller;

import java.sql.Timestamp;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import filmsystem.Model.FilmShow;
import filmsystem.Service.Impi.FilmShowServiceImpl;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/api")
public class FilmShowController {
    //public static Logger log = LoggerFactory.getLogger(FilmShowController.class);
    @Autowired
    FilmShowServiceImpl filmShowService;

    @RequestMapping(value = "/filmshow", method = RequestMethod.POST)
    public String addFilmShow(@RequestParam("filmId") Integer filmId,
                               @RequestParam("cinemaId") Integer cinemaId,
                               @RequestParam("officeId") Integer officeId,
                               @RequestParam("beginTime") Timestamp beginTime,
                               @RequestParam("duration") Integer duration,
                               @RequestParam("price") double price){
        // log.info("cinemaId = " + cinemaId + ", officeId = " + officeId + ", row = " + row + ", col = " + col);
        try{
            FilmShow show = new FilmShow();
            show.setFilmId(filmId);
            show.setCinemaId(cinemaId);
            show.setOfficeId(officeId);
            show.setBeginTime(beginTime);
            show.setDuration(duration);
            show.setPrice(price);
            return filmShowService.createShow(show) ? "SUCCESS" : "FAIL";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }
    }

    @RequestMapping(value = "/filmshow/{id}", method = RequestMethod.GET)
    public String getFilmShow(@PathVariable Integer id, Model model, HttpSession session){
        try{
            FilmShow show =  filmShowService.findShowById(id);
            if(show != null){
                session.setAttribute("filmShowFound", show);
                return "SUCCESS";
            }
            return "NOT_FOUND";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }

    }

    @RequestMapping(value = "/filmshow", method = RequestMethod.GET)
    public String getFilmShow(@RequestParam(value = "cinemaId", defaultValue = "0") Integer cinemaId,
                              @RequestParam(value = "filmId", defaultValue = "0") Integer filmId,
                              Model model, HttpSession session){
        try{
            ArrayList<FilmShow> list = null;
            if(filmId != 0 && cinemaId != 0) {
                list = filmShowService.findShowByCinemaAndFilmId(cinemaId, filmId);
            }
            else if(cinemaId != 0){
                list = filmShowService.findShowByCinemaId(cinemaId);
            }
            else if(filmId != 0){
                list = filmShowService.findShowByFilmId(filmId);
            }
            session.setAttribute("filmShowList", list);
            return "SUCCESS";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }

    }

    @RequestMapping(value = "/filmshow", method = RequestMethod.PUT)
    public String updateFilmShow(@RequestParam("id") Integer id,
                                  @RequestParam(value = "officeId") Integer officeId,
                                  @RequestParam(value = "beginTime") Timestamp beginTime,
                                  @RequestParam(value = "seat") String seat){
        try{
            FilmShow show = filmShowService.findShowById(id);
            show.setOfficeId(officeId);
            show.setBeginTime(beginTime);
            show.setSeat(seat);
            return filmShowService.updateShow(show) ? "SUCCESS" : "FAIL";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }

    }

    @RequestMapping(value = "/filmshow", method = RequestMethod.DELETE)
    public String deleteFilmShow(@RequestParam Integer id){
        try{
            return filmShowService.deleteShow(id) ? "SUCCESS" : "NOT_FOUND";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }
    }
}
