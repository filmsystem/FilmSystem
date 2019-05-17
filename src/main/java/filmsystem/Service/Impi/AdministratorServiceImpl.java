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
        if(administratorDAO.selectAdminByName(administrator.getUsername()) != null)
            return false;
        return administratorDAO.insertAdministrator(administrator);
    }

    public boolean updateAdministrator(Administrator administrator){
        return administratorDAO.updateAdministrator(administrator);
    }

    public boolean deleteAdministrator(int id){
        return administratorDAO.deleteAdministrator(id);
    }

    public Administrator findAdministratorById(int id){
        return administratorDAO.selectAdminById(id);
    }

    public Administrator findAdministratorByName(String name){
        return administratorDAO.selectAdminByName(name);
    }

    public ArrayList<Administrator> findAllAdministrator(){
        return administratorDAO.getAllAdmin();
    }
}
