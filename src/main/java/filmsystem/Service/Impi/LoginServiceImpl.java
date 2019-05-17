package filmsystem.Service.Impi;

import filmsystem.Model.Administrator;
import filmsystem.Model.Cinema;
import filmsystem.Model.Customer;
import filmsystem.Service.ILoginService;
import org.springframework.stereotype.Service;

@Service("loginService")
public class LoginServiceImpl implements ILoginService{
    public boolean checkAdministrator(String username, String password){
        Administrator administrator = new AdministratorServiceImpl().findAdministratorByName(username);
        if(administrator != null){
            return password.equals(administrator.getPassword());
        }
        else{   // administrator not found
            return false;
        }
    }

    public boolean checkCinema(String username, String password){
        Cinema cinema = new CinemaServiceImpl().findCinemaByFullName(username);
        if(cinema != null){
            return password.equals(cinema.getPassword());
        }
        else{   // cinema not found
            return false;
        }
    }

    public boolean checkCustomer(String username, String password) {
        // check
        Customer customer = new CustomerServiceImpl().findCustomerByName(username);
        if (customer != null) {
            return password.equals(customer.getPassword());
        } else {   // customer not found
            return false;
        }
    }
}
