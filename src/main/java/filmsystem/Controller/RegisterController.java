package filmsystem.Controller;

import filmsystem.Model.Administrator;
import filmsystem.Model.Cinema;
import filmsystem.Model.Customer;
import filmsystem.Service.Impi.RegisterServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class RegisterController {
    @Autowired
    RegisterServiceImpl registerService;

    @RequestMapping(value = "/registerCustomer", method = RequestMethod.POST)
    public String registerCustomer(@RequestParam("name") String name,
                                   @RequestParam("password") String password,
                                   @RequestParam(value = "img", defaultValue = "") String img,
                                   @RequestParam("gender") String gender,
                                   @RequestParam("phonenum") String phonenum,
                                   @RequestParam("city") String city){
        try{
            Customer customer = new Customer();
            customer.setUsername(name);
            customer.setPassword(password);
            customer.setImg(img);
            customer.setGender(gender);
            customer.setPhonenum(phonenum);
            customer.setCity(city);
            return registerService.customerRegister(customer) ? "SUCCESS" : "FAIL";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }
    }

    @RequestMapping(value = "/registerCinema", method = RequestMethod.POST)
    public String registerCinema(@RequestParam("name") String name,
                                 @RequestParam("password") String password,
                                 @RequestParam(value = "img", defaultValue = "") String img,
                                 @RequestParam("city") String city,
                                 @RequestParam("address") String address){
        // log.info("name = " + name + ", password = " + password + ", city = " + city + ", address = " + address);
        try{
            Cinema cinema = new Cinema();
            cinema.setUsername(name);
            cinema.setPassword(password);
            cinema.setImg(img);
            cinema.setCity(city);
            cinema.setAddress(address);
            return registerService.cinemaRegister(cinema) ? "SUCCESS" : "FAIL";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }
    }

    @RequestMapping(value = "/registerAdministrator", method = RequestMethod.POST)
    public String registerAdministrator(@RequestParam("name") String name,
                                        @RequestParam(value = "img", defaultValue = "") String img,
                                        @RequestParam("password") String password){
        // log.info("name = " + name + ", password = " + password;
        try{
            Administrator administrator = new Administrator();
            administrator.setUsername(name);
            administrator.setPassword(password);
            administrator.setImg(img);
            return registerService.administratorRegister(administrator) ? "SUCCESS" : "FAIL";
        }
        catch (Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }
    }
}
