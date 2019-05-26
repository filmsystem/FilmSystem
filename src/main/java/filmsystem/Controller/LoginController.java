package filmsystem.Controller;

import filmsystem.Service.Impi.LoginServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import filmsystem.Service.Impi.AdministratorServiceImpl;
import filmsystem.Service.Impi.CinemaServiceImpl;
import filmsystem.Service.Impi.CustomerServiceImpl;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/api")
public class LoginController {
    @Autowired
    LoginServiceImpl loginService;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String checkUser(@RequestParam("username") String username,
                            @RequestParam("password") String password,
                            @RequestParam("identity") Integer identity,
                            Model model, HttpSession session){
        /**
         * @param: username，password: user input; indntity: 1:customer, 2:cinema, 3:administrator
         * @return: result
         */
        switch(identity){
            case 1:     // customer
                if(loginService.checkCustomer(username, password)){
                    session.setAttribute("currentUser", new CustomerServiceImpl().findCustomerByName(username));
                    return "SUCCESS";
                }
                else{
                    return "FAIL";
                }
            case 2:     // cinema
                if(loginService.checkCinema(username, password)){
                    session.setAttribute("currentUser", new CinemaServiceImpl().findCinemaByFullName(username));
                    return "SUCCESS";
                }
                else{
                    return "FAIL";
                }
            case 3:     // administrator
                if(loginService.checkAdministrator(username, password)){
                    session.setAttribute("currentUser", new AdministratorServiceImpl().findAdministratorByName(username));
                    return "SUCCESS";
                }
                else{
                    return "FAIL";
                }
        }
        return "OUT_OF_RANGE";  // identity index out of range
    }
}
