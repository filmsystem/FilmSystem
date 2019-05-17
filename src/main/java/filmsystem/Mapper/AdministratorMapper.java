package filmsystem.Mapper;

import filmsystem.Model.Administrator;

import java.util.ArrayList;

public interface AdministratorMapper {
    Administrator selectAdminById(int id);
    ArrayList<Administrator> getAllAdmin();
    Administrator selectAdminByName(String username);
    int insertAdmin(Administrator admin);
    int deleteAdmin(int id);
    int updateAdmin(Administrator admin);
}
