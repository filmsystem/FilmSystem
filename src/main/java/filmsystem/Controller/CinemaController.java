package filmsystem.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import filmsystem.Model.Cinema;
import filmsystem.Service.Impi.CinemaServiceImpl;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@RestController
@RequestMapping("/api")
public class CinemaController {
    //public static Logger log = LoggerFactory.getLogger(CinemaController.class);
    @Autowired
    CinemaServiceImpl cinemaService;

//    @RequestMapping(value = "/cinema", method = RequestMethod.POST)
//    public String insertCustomer(@RequestParam("name") String name,
//                               @RequestParam("password") String password,
//                               @RequestParam(value = "img", defaultValue = "") String img,
//                               @RequestParam("city") String city,
//                               @RequestParam("address") String address){
//        // log.info("name = " + name + ", password = " + password + ", city = " + city + ", address = " + address);
//        try{
//            Cinema cinema = new Cinema();
//            cinema.setUsername(name);
//            cinema.setPassword(password);
//            cinema.setImg(img);
//            cinema.setCity(city);
//            cinema.setAddress(address);
//            return cinemaService.insertCinema(cinema) ? "SUCCESS" : "FAIL";
//        }
//        catch(Exception e){
//            e.printStackTrace();
//            return "DB_ERROR";
//        }
//    }

    @RequestMapping(value = "/cinema/{id}", method = RequestMethod.GET)
    public String getCinema(@PathVariable Integer id, Model model, HttpSession session){
        try{
            Cinema cinema = cinemaService.findCinemaById(id);
            if(cinema != null){
                session.setAttribute("cinemaFound", cinema);
                return "SUCCESS";
            }
            return "NOT_FOUND";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }
    }

    @RequestMapping(value = "/cinema", method = RequestMethod.GET)
    public String findCinema(@RequestParam(value = "name", defaultValue = "") String name,
                            @RequestParam(value = "city", defaultValue = "") String city,
                            Model model, HttpSession session){
        try{
            ArrayList<Cinema> list;
            if(name.equals("") && city.equals("")){
                list = cinemaService.findAllCinemas();
            }
            else if(name.equals("")){
                list = cinemaService.findCinemaByCity(city);
            }
            else if(city.equals("")){
                list = cinemaService.findCinemaByName(name);
            }
            else{
                list = cinemaService.findCinemaByNameAndCity(name, city);
            }
            session.setAttribute("cinemaList", list);
            return "SUCCESS";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }
    }

    @RequestMapping(value = "/cinema", method = RequestMethod.PUT)
    public String updateCinema(@RequestParam("id") Integer id,
                                @RequestParam(value = "password", defaultValue = "") String password,
                                @RequestParam(value = "img", defaultValue = "") String img,
                                @RequestParam("city") String city,
                                @RequestParam("address") String address){
        try{
            Cinema cinema = cinemaService.findCinemaById(id);
            if(cinema != null){
                if(!password.equals(""))
                    cinema.setPassword(password);
                if(!img.equals(""))
                    cinema.setImg(img);

                cinema.setCity(city);
                cinema.setAddress(address);
                return cinemaService.updateCinema(cinema) ? "SUCCESS" : "FAIL";
            }
            return "NOT_FOUND";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }

    }

    @RequestMapping(value = "/cinema/{id}", method = RequestMethod.DELETE)
    public String deleteCinema(@PathVariable Integer id){
        try{
            return cinemaService.deleteCinema(id) ? "SUCCESS" : "NOT_FOUND";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }

    }
}
