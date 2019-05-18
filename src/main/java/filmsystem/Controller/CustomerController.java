package filmsystem.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import filmsystem.Model.Customer;
import filmsystem.Service.Impi.CustomerServiceImpl;
import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/api")
public class CustomerController {
    //public static Logger log = LoggerFactory.getLogger(CustomerController.class);
    @Autowired
    CustomerServiceImpl customerService;

//    @RequestMapping(value = "/customer", method = RequestMethod.POST)
//    public String insertCustomer(@RequestParam("name") String name,
//                                 @RequestParam("password") String password,
//                                 @RequestParam(value = "img", defaultValue = "") String img,
//                                 @RequestParam("gender") String gender,
//                                 @RequestParam("phonenum") String phonenum,
//                                 @RequestParam("city") String city){
//        // log.info("name = " + name + ", password = " + password + ", gender = " + gender + ", phonenum = " + phonenum);
//        try{
//            Customer customer = new Customer();
//            customer.setUsername(name);
//            customer.setPassword(password);
//            customer.setImg(img);
//            customer.setGender(gender);
//            customer.setPhoneNum(phonenum);
//            customer.setCity(city);
//            return customerService.insertCustomer(customer) ? "SUCCESS" : "FAIL";
//        }
//        catch(Exception e){
//            e.printStackTrace();
//            return "DB_ERROR";
//        }
//    }

    @RequestMapping(value = "/customer/{id}", method = RequestMethod.GET)
    public String getCustomer(@PathVariable Integer id, Model model, HttpSession session){
        try{
            Customer customer = customerService.findCustomerById(id);
            if(customer != null){
                session.setAttribute("customerFound", customer);
                return "SUCCESS";
            }
            return "FAIL";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }
    }

    @RequestMapping(value = "/customer", method = RequestMethod.GET)
    public String getCustomer(@RequestParam("name") String name, Model model, HttpSession session){
        try{
            Customer customer = customerService.findCustomerByName(name);
            if(customer != null){
                session.setAttribute("customerFound", customer);
                return "SUCCESS";
            }
            return "FAIL";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }
    }

    @RequestMapping(value = "/customer", method = RequestMethod.PUT)
    public String updateCustomer(@RequestParam("id") Integer id,
                                  @RequestParam("password") String password,
                                  @RequestParam(value = "img", defaultValue = "") String img,
                                  @RequestParam("gender") String gender,
                                  @RequestParam("phonenum") String phonenum,
                                  @RequestParam("city") String city){
        try{
            Customer customer = customerService.findCustomerById(id);
            if(customer != null){
                if(!password.equals(""))
                    customer.setPassword(password);
                if(!img.equals(""))
                    customer.setImg(img);
                customer.setGender(gender);
                customer.setPhonenum(phonenum);
                customer.setCity(city);
                return customerService.updateCustomer(customer) ? "SUCCESS" : "FAIL";
            }
            return "NOT_FOUND";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }

    }

    @RequestMapping(value = "/customer/{id}", method = RequestMethod.DELETE)
    public String deleteCustomer(@PathVariable Integer id){
        try{
            return customerService.deleteCustomer(id) ? "SUCCESS" : "NOT_FOUND";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }
    }
}
