package filmsystem.Service;

import filmsystem.Model.Administrator;
import java.util.ArrayList;

public interface IAdministratorService {
    boolean insertAdministrator(Administrator administrator);

    boolean updateAdministrator(Administrator administrator);

    boolean deleteAdministrator(int id);

    Administrator findAdministratorById(int id);

    Administrator findAdministratorByName(String name);

    ArrayList<Administrator> findAllAdministrator();
}
