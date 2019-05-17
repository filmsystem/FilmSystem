package filmsystem.Service.Impi;

import filmsystem.DAO.AdministratorDAO;
import filmsystem.Model.Administrator;
import org.springframework.stereotype.Service;
import filmsystem.Service.IAdministratorService;

import java.util.ArrayList;

@Service("administratorService")
public class AdministratorServiceImpl implements IAdministratorService {
    private AdministratorDAO administratorDAO = new AdministratorDAO();
    public boolean insertAdministrator(Administrator administrator){
        if(new AdministratorDAO().selectAdminByName(administrator.getUsername()) != null)
            return false;
        return new AdministratorDAO().insertAdministrator(administrator);
    }

    public boolean updateAdministrator(Administrator administrator){
        return new AdministratorDAO().updateAdministrator(administrator);
    }

    public boolean deleteAdministrator(int id){
        return new AdministratorDAO().deleteAdministrator(id);
    }

    public Administrator findAdministratorById(int id){
        // TODO: Fix bugs.
        //return new AdministratorDAO().searchAdministrator(id);
        return null;
    }

    public Administrator findAdministratorByName(String name){
        // find in database
        return null;
    }

    public ArrayList<Administrator> findAllAdministrator(){
        return administratorDAO.getAllAdmin();
    }
}
