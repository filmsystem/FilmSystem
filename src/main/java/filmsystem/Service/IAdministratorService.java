package filmsystem.Service;

import filmsystem.Model.Administrator;

public interface IAdministratorService {
    public boolean insertAdministrator(Administrator administrator);

    public boolean updateAdministrator(Administrator administrator);

    public boolean deleteAdministrator(int id);

    public Administrator findAdministratorById(int id);

    public Administrator findAdministratorByName(String name);

    public boolean checkAdministrator(String username, String password);
}
