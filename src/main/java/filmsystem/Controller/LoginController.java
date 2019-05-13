package filmsystem.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import filmsystem.Service.Impi.AdministratorServiceImpl;
import filmsystem.Service.Impi.CinemaServiceImpl;
import filmsystem.Service.Impi.CustomerServiceImpl;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class LoginController {
    @Autowired
    CustomerServiceImpl customerService;

    @Autowired
    CinemaServiceImpl cinemaService;

    @Autowired
    AdministratorServiceImpl administratorService;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String checkUser(@RequestParam("username") String username,
                         @RequestParam("password") String password,
                         @RequestParam("identity") Integer identity){
        /**
         * @param: username，password: user input; indntity: 1:customer, 2:cinema, 3:administrator
         * @return:
         */
        switch(identity){
            case 1:     // customer
                return customerService.checkCustomer(username, password) ? "SUCCESS" : "FAIL";
            case 2:     // cinema
                return cinemaService.checkCinema(username, password) ? "SUCCESS" : "FAIL";
            case 3:     // administrator
                return administratorService.checkAdministrator(username, password) ? "SUCCESS" : "FAIL";
        }
        return "OUT_OF_RANGE";  // identity index out of range
    }
}
