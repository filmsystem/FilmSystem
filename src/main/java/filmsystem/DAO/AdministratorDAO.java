package filmsystem.DAO;

import filmsystem.Mapper.AdministratorMapper;
import filmsystem.Model.Administrator;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import java.util.ArrayList;

public class AdministratorDAO {
    ApplicationContext ac;
    SqlSessionFactory factory;
    SqlSession sqlSession;
    AdministratorMapper administratorMapper;

    public AdministratorDAO() {
        ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        factory = (SqlSessionFactory) ac.getBean("mySqlSessionFactory");
        sqlSession = factory.openSession();
        administratorMapper = sqlSession.getMapper(AdministratorMapper.class);
    }

    public boolean insertAdministrator(Administrator admin) {
        if(administratorMapper.insertAdmin(admin)>0)
            return true;
        return false;
    }

    public boolean deleteAdministrator(int id) {
        if(administratorMapper.deleteAdmin(id)>0)
            return true;
        return false;
    }

    public Administrator selectAdminById(int id) {
        return administratorMapper.selectAdminById(id);
    }

    public ArrayList<Administrator> getAllAdmin() {
        return administratorMapper.getAllAdmin();
    }

    public Administrator selectAdminByName(String username) {
        return administratorMapper.selectAdminByName(username);
    }

    public boolean updateAdministrator(Administrator admin) {
        if(administratorMapper.updateAdmin(admin)>0)
            return true;
        return false;
    }
}
