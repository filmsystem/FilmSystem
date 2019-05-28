package filmsystem.Controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;

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
                session.setAttribute("filmShowMap", filmShowService.getRelatedInfo(show));
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
                              @RequestParam(value="flag", defaultValue = "true") String flag,
                              Model model, HttpSession session){
        /**
         * @param: flag: 需不需要将已过期的过滤掉。
         *               默认会过滤过期信息，如果不需要过滤（例如电影院方需要查询）则输入除了“true”外的字符串。
         */
        try{
            ArrayList<FilmShow> list = null;
            ArrayList<HashMap<String, Object>> mapList = new ArrayList<>();

            if(filmId != 0 && cinemaId != 0) {
                list = filmShowService.findShowByCinemaAndFilmId(cinemaId, filmId, flag.equals("true"));
            }
            else if(cinemaId != 0){
                list = filmShowService.findShowByCinemaId(cinemaId, flag.equals("true"));
            }
            else if(filmId != 0){
                list = filmShowService.findShowByFilmId(filmId, flag.equals("true"));
            }

            for(int i = 0; i < list.size(); i++){
                mapList.add(filmShowService.getRelatedInfo(list.get(i)));
            }
            session.setAttribute("filmShowList", list);
            session.setAttribute("filmShowMapList", mapList);
            return "SUCCESS";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }

    }

    @RequestMapping(value = "/filmshow", method = RequestMethod.PUT)
    public String updateFilmShow(@RequestParam("id") Integer id,
                                  @RequestParam(value = "beginTime") Timestamp beginTime,
                                 @RequestParam(value = "price") Double price){
        try{
            FilmShow show = filmShowService.findShowById(id);
            show.setBeginTime(beginTime);
            show.setPrice(price);
            return filmShowService.updateShow(show) ? "SUCCESS" : "FAIL";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }

    }

    @RequestMapping(value = "/filmshow/{id}", method = RequestMethod.DELETE)
    public String deleteFilmShow(@PathVariable Integer id){
        try{
            return filmShowService.deleteShow(id) ? "SUCCESS" : "NOT_FOUND";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }
    }
}
