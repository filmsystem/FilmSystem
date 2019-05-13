package filmsystem.Service;

import filmsystem.Model.Administrator;
import filmsystem.Model.Cinema;
import filmsystem.Model.Customer;

public interface IRegisterService {
    boolean customerRegister(Customer customer);

    boolean cinemaRegister(Cinema cinema);

    boolean administratorRegister(Administrator administrator);
}
