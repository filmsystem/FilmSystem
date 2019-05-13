package filmsystem.Controller;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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

    @RequestMapping(value = "/filmshow", method = RequestMethod.GET)
    public String getFilmShow(@RequestParam Integer id, Model model, HttpSession session){
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
