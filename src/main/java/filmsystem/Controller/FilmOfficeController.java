package filmsystem.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import filmsystem.Model.FilmOffice;
import filmsystem.Service.Impi.FilmOfficeServiceImpl;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;

@RestController
@RequestMapping("/api")
public class FilmOfficeController {
    //public static Logger log = LoggerFactory.getLogger(FilmOfficeController.class);
    @Autowired
    FilmOfficeServiceImpl filmOfficeService;

    @RequestMapping(value = "/filmoffice", method = RequestMethod.POST)
    public String addFilmOffice(@RequestParam("cinemaId") Integer cinemaId,
                                 @RequestParam("officeId") Integer officeId,
                                 @RequestParam("row") Integer rowNum,
                                 @RequestParam("col") Integer col){
        // log.info("cinemaId = " + cinemaId + ", officeId = " + officeId + ", row = " + row + ", col = " + col);
        try{
            FilmOffice office = new FilmOffice();
            office.setCinemaId(cinemaId);
            office.setOfficeId(officeId);
            office.setRowNum(rowNum);
            office.setCol(col);
            return filmOfficeService.createOffice(office) ? "SUCCESS" : "FAIL";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }
    }

    @RequestMapping(value = "/filmoffice/{id}", method = RequestMethod.GET)
    public String getFilmOffice(@PathVariable Integer id, Model model, HttpSession session){
        try{
            FilmOffice office = filmOfficeService.findOfficeById(id);
            if(office != null){
                session.setAttribute("filmOfficeFound", office);
                return "SUCCESS";
            }
            return "NOT_FOUND";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }
    }

    @RequestMapping(value = "/filmoffice", method = RequestMethod.GET)
    public String getFilmOffice(@RequestParam("cinemaId") Integer cinemaId,
                                @RequestParam(value = "officeId", defaultValue = "-1") Integer officeId,
                                Model model, HttpSession session){
        try{
            if(officeId == -1){
                ArrayList<FilmOffice> list = filmOfficeService.findOfficeByCinemaId(cinemaId);
                ArrayList<HashMap<String, Object>> mapList = new ArrayList<>();

                for(int i = 0; i < list.size(); i++){
                    mapList.add(filmOfficeService.getRelatedInfo(list.get(i)));
                }
                session.setAttribute("filmOfficeList", list);
                session.setAttribute("filmOfficeMapList", mapList);
                return "SUCCESS";
            }
            else{
                FilmOffice office = filmOfficeService.findOfficeByOfficeId(cinemaId, officeId);
                if(office != null){
                    session.setAttribute("filmOfficeFound", office);
                    session.setAttribute("filmOfficeMap", filmOfficeService.getRelatedInfo(office));
                    return "SUCCESS";
                }
                return "NOT_FOUND";
            }
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }
    }

    @RequestMapping(value = "/filmoffice", method = RequestMethod.PUT)
    public String updateFilmOffice(@RequestParam("id") Integer id,
                                    @RequestParam("row") Integer rowNum,
                                    @RequestParam("col") Integer col){
        try{
            FilmOffice office = filmOfficeService.findOfficeById(id);
            if(office != null){
                office.setRowNum(rowNum);
                office.setCol(col);
                return filmOfficeService.updateOffice(office) ? "SUCCESS" : "FAIL";
            }
            return "NOT_FOUND";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }

    }

    @RequestMapping(value = "/filmoffice/{id}", method = RequestMethod.DELETE)
    public String deleteFilmOffice(@PathVariable Integer id){
        try{
            return filmOfficeService.deleteOffice(id) ? "SUCCESS" : "NOT_FOUND";
        }
        catch(Exception e) {
            e.printStackTrace();
            return "DB_ERROR";
        }
    }
}
