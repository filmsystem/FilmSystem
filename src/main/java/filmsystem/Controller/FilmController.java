package filmsystem.Controller;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import filmsystem.Model.Film;
import filmsystem.Service.Impi.FilmServiceImpl;
import filmsystem.Tools.ListToString;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/api")
public class FilmController {
    //public static Logger log = LoggerFactory.getLogger(FilmController.class);
    @Autowired
    FilmServiceImpl filmService;

//    @RequestMapping(value = "/film", method = RequestMethod.POST)
//    public String insertFilm(@RequestParam("name") String name,
//                           @RequestParam(value = "img" , defaultValue = "") String img,
//                           @RequestParam("dircetors") Collection<String> directors,
//                           @RequestParam("casts") Collection<String> casts,
//                           @RequestParam("type") Collection<String> type,
//                           @RequestParam("year") Integer year,
//                           @RequestParam("countries") Collection<String> countries,
//                           @RequestParam("summary") String summary){
//        // log.info("cinemaId = " + cinemaId + ", officeId = " + officeId + ", row = " + row + ", col = " + col);
//        try{
//            Film film = new Film();
//            film.setName(name);
//            film.setImg(img);
//            film.setDirectors(ListToString.collectionToString(directors, ", "));
//            film.setCasts(ListToString.collectionToString(casts, ", "));
//            film.setType(ListToString.collectionToString(type, ", "));
//            film.setYear(year);
//            film.setCountries(ListToString.collectionToString(countries, ", "));
//            film.setSummary(summary);
//            return filmService.insertFilm(film) ? "SUCCESS" : "FAIL";
//        }
//        catch(Exception e){
//            e.printStackTrace();
//            return "DB_ERROR";
//        }
//    }

    @RequestMapping(value = "/film/{id}", method = RequestMethod.GET)
    public String getFilm(@PathVariable Integer id, Model model, HttpSession session){
        try{
            Film film = filmService.findFilmById(id);
            if(film != null){
                session.setAttribute("filmFound", film);
                return "SUCCESS";
            }
            return "NOT_FOUND";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }
    }

    @RequestMapping(value = "/film", method = RequestMethod.GET)
    public String getFilm(@RequestParam(value = "type") String type,
                          @RequestParam(value = "info") String info,
                          Model model, HttpSession session){
        try{
            ArrayList<Film> list;
            if(type == null || info == null || type.equals("") || info.equals("") || type.equals("null") || info.equals("null")){
                session.removeAttribute("filmList");
                return "EMPTY";
            }

            if(type.equals("name")){
                list = filmService.findFilmByName(info);
            }
            else if(type.equals("cast")){
                list = filmService.findFilmByCast(info);
            }
            else if(type.equals("director")){
                list = filmService.findFilmByDirector(info);
            }
            else if(type.equals("year")){
                list = filmService.findFilmByYear(Integer.parseInt(info));
            }
            else if(type.equals("country")){
                list = filmService.findFilmByCountry(info);
            }
            else if(type.equals("type")){
                list = filmService.findFilmByType(info);
            }
            else{
                list = null;
            }
            if(list != null){
                session.setAttribute("filmList", list);
                return "SUCCESS";
            }
            session.removeAttribute("filmList");
            return "FAIL";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }
    }

//    @RequestMapping(value = "/film", method = RequestMethod.PUT)
//    public String updateFilm(@RequestParam("id") Integer id,
//                              @RequestParam(value = "img", defaultValue = "") String img){
//        try{
//            FilmService filmBO = new FilmService();
//            Film film = filmBO.findFilmById(id);
//            if(film != null){
//                return false;
//            }
//            film.setImg(img);
//            return true;
//        }
//        catch(Exception e){
//            e.printStackTrace();
//            return "DB_ERROR";
//        }
//    }

    @RequestMapping(value = "/film/{id}", method = RequestMethod.DELETE)
    public String deleteFilm(@PathVariable Integer id){
        try{
            return filmService.deleteFilm(id) ? "SUCCESS" : "NOT_FOUND";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }
    }
}
