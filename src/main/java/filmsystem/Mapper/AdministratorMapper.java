package filmsystem.Mapper;

import filmsystem.Model.Administrator;

import java.util.ArrayList;

public interface AdministratorMapper {
    public Administrator selectAdminById(int id);
    public ArrayList<Administrator> getAllAdmin();
    public Administrator selectAdminByName(String username);
    public int insertAdmin(Administrator admin);
    public int deleteAdmin(int id);
    public int updateAdmin(Administrator admin);
}
