package filmsystem.Service.Impi;

import filmsystem.DAO.AdministratorDAO;
import filmsystem.DAO.CinemaDAO;
import filmsystem.DAO.CustomerDAO;
import filmsystem.Model.Administrator;
import filmsystem.Model.Cinema;
import filmsystem.Model.Customer;
import filmsystem.Service.IRegisterService;
import org.springframework.stereotype.Service;

@Service("registerService")
public class RegisterServiceImpl implements IRegisterService {

    @Override
    public boolean customerRegister(Customer customer) {
        if(isNameUsed(customer.getUsername()))
            return false;
        return new CustomerDAO().insertCustomer(customer);
    }

    @Override
    public boolean cinemaRegister(Cinema cinema) {
        if(isNameUsed(cinema.getUsername()))
            return false;
        return new CinemaDAO().insertCinema(cinema);
    }

    @Override
    public boolean administratorRegister(Administrator administrator) {
        if(isNameUsed(administrator.getUsername()))
            return false;
        return new AdministratorDAO().insertAdministrator(administrator);
    }

    private boolean isNameUsed(String name){
        if(new AdministratorDAO().selectAdminByName(name) != null)
            return false;
        else if(new CinemaDAO().searchCinemaByName(name) != null)
            return false;
        else if(new CustomerDAO().searchCustomerByName(name) != null)
            return false;
        return true;
    }
}
