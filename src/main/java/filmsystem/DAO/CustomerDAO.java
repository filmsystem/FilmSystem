package filmsystem.DAO;

import java.util.ArrayList;

import filmsystem.Mapper.CustomerMapper;
import filmsystem.Model.Customer;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class CustomerDAO {
    ApplicationContext ac;
    SqlSessionFactory factory;
    SqlSession sqlSession;
    CustomerMapper customerMapper;

    public CustomerDAO(){
        ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        factory = (SqlSessionFactory) ac.getBean("mySqlSessionFactory");
        sqlSession = factory.openSession();
        customerMapper = sqlSession.getMapper(CustomerMapper.class);
    }

    public boolean insertCustomer(Customer customer) {
        if(customerMapper.insertCustomer(customer)>0)
            return true;
        return false;
    }

    public boolean deleteCustomer(int id) {
        if(customerMapper.deleteCustomer(id)>0)
            return true;
        return false;
    }

    public Customer selectCustomerById(int id) {
        return customerMapper.selectCustomerById(id);
    }

    public Customer selectCustomerByName(String username) {
        return customerMapper.selectCustomerByName(username);
    }

    public boolean updateCustomer(Customer customer) {
        if(customerMapper.updateCustomer(customer)>0)
            return true;
        return false;
    }
}
