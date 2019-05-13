package filmsystem.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import filmsystem.Model.Administrator;
import filmsystem.Service.Impi.AdministratorServiceImpl;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;


@Controller
@RequestMapping("/api")
//@SessionAttributes("currentUser")
public class AdministratorController {
    //public static Logger log = LoggerFactory.getLogger(AdministratorController.class);
    @Autowired
    AdministratorServiceImpl administratorService;

//    @RequestMapping(value = "/administrator", method = RequestMethod.POST)
//    public String insertAdministrator(@RequestParam("name") String name,
//                                    @RequestParam(value = "img", defaultValue = "") String img,
//                                    @RequestParam("password") String password){
//        // log.info("name = " + name + ", password = " + password;
//        try{
//            Administrator administrator = new Administrator();
//            administrator.setUsername(name);
//            administrator.setPassword(password);
//            administrator.setImg(img);
//            return administratorService.insertAdministrator(administrator) ? "SUCCESS" : "FAIL";
//        }
//        catch (Exception e){
//            e.printStackTrace();
//            return "DB_ERROR";
//        }
//    }

    @RequestMapping(value = "/administrator", method = RequestMethod.GET)
    public String getAllAdministrator(Model model, HttpSession session){
        // find all administrator by id in database
        try{
            ArrayList<Administrator> list = null;
            //TODO
            session.setAttribute("administratorList", list);
            return "SUCCESS";
        }
        catch (Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }
    }

    @RequestMapping(value = "/administrator/{id}", method = RequestMethod.GET)
    public String getAdministrator(@PathVariable Integer id, Model model, HttpSession session){
        // find administrator by id in database
        try{
            Administrator administrator = administratorService.findAdministratorById(id);
            if(administrator != null){
                session.setAttribute("administratorFound", administrator);
                return "SUCCESS";
            }
            else {
                return "NOT_FOUND";
            }
        }
        catch (Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }
    }

//    @RequestMapping(value = "/administrator", method = RequestMethod.GET)
//    public String getAdministrator(@RequestParam String name){
//        // find administrator by id in database
//        return new AdministratorServiceImpl().findAdministratorByName(name);
//    }

    @RequestMapping(value = "/administrator", method = RequestMethod.PUT)
    public String updateAdministrator(@RequestParam("id") Integer id,
                                       @RequestParam(value = "img", defaultValue = "") String img,
                                       @RequestParam(value = "password", defaultValue = "") String password){
        try{
            Administrator administrator = administratorService.findAdministratorById(id);
            if(administrator != null){
                if(!img.equals(""))
                    administrator.setImg(img);
                if(!password.equals(""))
                    administrator.setPassword(password);
                return administratorService.updateAdministrator(administrator) ? "SUCCESS" : "FAIL";
            }
            return "NOT_FOUND";
        }
        catch (Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }

    }

    @RequestMapping(value = "/administrator", method = RequestMethod.DELETE)
    public String deleteAdministrator(@RequestParam Integer id){
        try{
            return administratorService.deleteAdministrator(id) ? "SUCCESS" : "NOT_FOUND";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }
    }
}
