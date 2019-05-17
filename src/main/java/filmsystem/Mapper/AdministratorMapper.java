package filmsystem.Mapper;

import filmsystem.Model.Administrator;

import java.util.ArrayList;

public interface AdministratorMapper {
    public Administrator selectAdminById(int id);
    public ArrayList<Administrator> getAllAdmin();
}
