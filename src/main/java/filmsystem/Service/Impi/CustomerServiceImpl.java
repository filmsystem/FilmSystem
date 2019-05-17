package filmsystem.Service.Impi;

import filmsystem.DAO.CustomerDAO;
import filmsystem.Model.Customer;
import org.springframework.stereotype.Service;
import filmsystem.Service.ICustomerService;

@Service("customerService")
public class CustomerServiceImpl implements ICustomerService{
    private CustomerDAO customerDAO = new CustomerDAO();
    public boolean insertCustomer(Customer customer) {
        return customerDAO.insertCustomer(customer);
    }

    public boolean updateCustomer(Customer customer) {
        return customerDAO.updateCustomer(customer);
    }

    public boolean deleteCustomer(int id) {
        return customerDAO.deleteCustomer(id);
    }

    public Customer findCustomerById(int id) {
        return customerDAO.selectCustomerById(id);
    }

    public Customer findCustomerByName(String name) {
        return customerDAO.selectCustomerByName(name);
    }
}
